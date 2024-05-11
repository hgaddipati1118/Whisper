import 'package:complete/screens/auth_flow.dart';
import 'package:complete/firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:complete/bloc/authentication/bloc/authentication_bloc.dart';
import 'package:complete/screens/login.dart';
import 'package:complete/screens/sign_up.dart';
import 'package:complete/screens/home.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(BlocProvider(
      create: (context) => AuthenticationBloc(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routes: {
          'login_screen': (context) => const LoginScreen(),
          'signup_screen': (context) => const SignupScreen(),
          'home_screen':(context) => const HomeScreen(),
          // other routes...
        },
        home: const AuthenticationFlowScreen());
  }
}
