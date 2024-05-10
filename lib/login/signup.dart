import 'package:complete/login/login.dart';
import 'package:flutter/material.dart';
import 'package:complete/login/signup_screen.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Whisper Signup")),
        body: const Center(
          child: Column(
            children: <Widget>[
              Text("Whisper"),
              SignupScreen(),
              LoginToggle(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginToggle extends StatelessWidget {
  const LoginToggle({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Log in'),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const Login()),
        );
      },
    );
  }
}