import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:complete/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:complete/models/user.dart';
class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Hello User',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                if (state is AuthenticationLoadingState || state is AuthenticationInitialState) {
                  const CircularProgressIndicator();
                } else if (state is AuthenticationFailureState) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text('error try signing out and signing in again'),
                        );
                      });
                }
              },
              builder: (context, state) {
                print(state);
                if(state is AuthenticationInitialState){
                   BlocProvider.of<AuthenticationBloc>(context)
                            .add(GetUser());
                }
                if(state is AuthenticationSuccessState){
                final UserModel user = (context.read<AuthenticationBloc>().state as AuthenticationSuccessState).user;
                final bool emailStatus = user.isVerified ?? false;
                print(emailStatus);
                return Column(children: <Widget>[
                  Text(emailStatus? 'Email Verified' : 'Email Not Verified'),
                  ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(SignOut());
                      },
                      child: const Text('logOut'))
                ]
                );
                }
                return ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<AuthenticationBloc>(context)
                            .add(SignOut());
                      },
                      child: const Text('logOut'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
