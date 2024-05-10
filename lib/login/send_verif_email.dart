import 'package:firebase_auth/firebase_auth.dart';

Future<void> sendEmailVerification() async {
  User? user = FirebaseAuth.instance.currentUser;
  await user?.sendEmailVerification();
}