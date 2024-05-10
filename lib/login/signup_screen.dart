import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:complete/login/send_verif_email.dart';
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() {
    return SignupScreenState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class SignupScreenState extends State<SignupScreen> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<SignupScreen>.
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailTc = TextEditingController();
  TextEditingController passwordTc = TextEditingController();
  String? _error = "";

  @override
  void initState() {
    super.initState();
  }
  Future<void> _signUpUser() async {
    try {
      final email = emailTc.text;
      final password = passwordTc.text;
      print("$email, $password");
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      sendEmailVerification();
      // Navigate to the logged-in user screen or perform actions
    } on FirebaseAuthException catch (e) {
      // Handle login errors (e.g., invalid email, wrong password)
      setState(() {
        _error = e.code;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: emailTc,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your email address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !validateEmail(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          TextFormField(
            controller: passwordTc,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !validatePasword(value)) {
                return 'Please enter a valid password with at least 8 characters, one capital letter, and one number';
              }
              return null;
            },
          ),
          Text(_error ?? ""),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                  _signUpUser();
                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}

bool validateEmail(String email) {
  return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
}

bool validatePasword(String password) {
  return RegExp(r'^(?=.*[A-Z])(?=.*[0-9]).{8,}$').hasMatch(password);
}
