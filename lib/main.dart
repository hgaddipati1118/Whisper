import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:complete/login/login.dart';
import 'firebase_options.dart';
import 'package:complete/home/home.dart';
import 'package:complete/login/email_verification.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const MyApp({super.key});
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: StreamBuilder<User?>(
       stream: FirebaseAuth.instance.authStateChanges(),
       builder: (context, snapshot) {
         if (snapshot.connectionState == ConnectionState.active) {
           User? user = snapshot.data;
           if (user == null) {
             return const Login();
           } else if (user?.emailVerified == false) {
              return const EmailVerification();
           }
           return const HomePage();
         }
         return const Scaffold(body: Center(child: CircularProgressIndicator()));
       },
     ),
   );
 }
} 
