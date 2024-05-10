import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  AuthFormState createState() {
    return AuthFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class AuthFormState extends State<AuthForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<AuthForm>.
  final _formKey = GlobalKey<FormState>();
  String _email = "";
  String _password = "";
  String? _error = "";
  Future<void> _signUpUser() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
      // Navigate to the logged-in user screen or perform actions
    } on FirebaseAuthException catch (e) {
      // Handle login errors (e.g., invalid email, wrong password)
      Text(e.code);
      print(e.code);
      print(e.message);
      setState(() {
        _error = e.message;
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
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your email address',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !validateEmail(value)) {
                return 'Please enter a valid email address';
              } else {
                (value) => setState(() => _email = value);
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter your password',
            ),
            validator: (value) {
              if (value == null || value.isEmpty || !validatePasword(value)) {
                return 'Please enter a valid password with at least 8 characters, one capital letter, and one number';
              } else {
                (value) => setState(() => _password = value);
              }
              return null;
            },
          ),
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
