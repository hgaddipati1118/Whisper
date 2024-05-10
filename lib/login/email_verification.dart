import 'package:flutter/material.dart';
import 'package:complete/login/send_verif_email.dart';
class EmailVerification extends StatelessWidget {
  const EmailVerification({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text("Whisper Email Verification")),
        body:  Center(
          child: Column(
            children: <Widget>[
              const Text("Check your email to verify your account and get started :)"),
              ElevatedButton(
                child: const Text('Resend verification email'),
                onPressed: () {
                  sendEmailVerification();
                }
              )

            ],
          ),
        ),
      ),
    );
  }
}