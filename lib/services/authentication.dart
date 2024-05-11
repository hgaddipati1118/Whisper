import 'package:firebase_auth/firebase_auth.dart';

import '../models/user.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  /// create user
  Future<UserModel?> signUpUser(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        firebaseUser.sendEmailVerification();
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          isVerified: firebaseUser.emailVerified,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  } 

  /// login user
  Future<UserModel?> loginUser(
    String email,
    String password,
  ) async {
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        return UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          isVerified: firebaseUser.emailVerified,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  } 

   ///signOutUser 
   Future<void> signOutUser() async {
      final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }
    Future<UserModel?> getUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return UserModel(
        id: firebaseUser.uid,
        email: firebaseUser.email ?? '',
        isVerified: firebaseUser.emailVerified,
      );
    }
    return null;
    }
  // ... (other methods)}
}