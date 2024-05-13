import 'package:firebase_auth/firebase_auth.dart';
import 'package:complete/models/user.dart';
import 'package:complete/services/database.dart';
class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseService _databaseService = DatabaseService();
  /// Creates a new user account with the provided email and password.
  ///
  /// Returns a [UserModel] object representing the newly created user if successful,
  /// otherwise returns null.
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
        UserModel user = UserModel(
          id: firebaseUser.uid,
          email: firebaseUser.email ?? '',
          isVerified: firebaseUser.emailVerified,
        );
        return user;
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }

    return null;
  } 

  /// Logs in a user with the provided email and password.
  ///
  /// Returns a [UserModel] object representing the logged-in user if successful,
  /// otherwise returns null.
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
        return await _databaseService.retrieveUserData();
      }
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
    return null;
  } 

  /// Signs out the currently logged-in user.
  Future<void> signOutUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await FirebaseAuth.instance.signOut();
    }
  }

  /// Retrieves the currently logged-in user.
  ///
  /// Returns a [UserModel] object representing the logged-in user if successful,
  /// otherwise returns null.
  Future<UserModel?> getUser() async {
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return await _databaseService.retrieveUserData();
    }
    return null;
  }

  // ... (other methods)}
}