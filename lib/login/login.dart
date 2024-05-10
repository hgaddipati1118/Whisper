import 'package:complete/login/signup.dart';
import 'package:flutter/material.dart';
import 'package:complete/login/login_screen.dart';
class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Whisper Login")),
        body: const Center(
          child: Column(
            children: <Widget>[
              Text("Whisper"),
              LoginScreen(),
              SignupToggle(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupToggle extends StatelessWidget {
  const SignupToggle({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Sign up'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Signup()),
        );
      },
    );
  }
}