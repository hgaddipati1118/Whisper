import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Center(
        child: ListView(
          children: const <Widget>[
            Text("Whisper"),
            Text("Email"),
            Text("Password"),
          ],
        ),
      ),
    );
  }
}
