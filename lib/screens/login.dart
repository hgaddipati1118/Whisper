import 'package:complete/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:complete/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:complete/services/validators.dart';
import 'package:complete/screens/sign_up.dart';
class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';

  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Text Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email address',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !validateEmail(value)) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !validatePasword(value)) {
                        return 'Please enter a valid password with at least 8 characters, one capital letter, and one number';
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child:
                        BlocConsumer<AuthenticationBloc, AuthenticationState>(
                      listener: (context, state) {
                        if (state is AuthenticationSuccessState) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            HomeScreen.id,
                            (route) => false,
                          );
                        } else if (state is AuthenticationFailureState) {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const AlertDialog(
                                  content: Text('error'),
                                );
                              });
                        }
                      },
                      builder: (context, state) {
                        return SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                
                                BlocProvider.of<AuthenticationBloc>(context).add(
                                LoginUser(
                                  emailController.text.trim(),
                                  passwordController.text.trim(),
                                ),
                              );
                              }
                              
                            },
                            child: Text(
                              state is! AuthenticationLoadingState || !state.isLoading
                                  ? 'Login'
                                  : '.......',
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () { Navigator.pushNamed(context, SignupScreen.id);},
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

