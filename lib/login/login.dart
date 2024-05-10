import 'package:flutter/material.dart';
import 'auth_form.dart';

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
              AuthForm(),
              Text("Password"),
            ],
          ),
        ),
      ),
    );
  }
}
