import 'package:complete/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Saves the user data to the database.
  ///
  /// This function takes a [UserModel] object as a parameter and saves it to the database.
  /// It returns a [Future] that completes with a [bool] value indicating whether the operation was successful or not.
  /// If the data is successfully saved, the function returns `true`, otherwise it returns `false`.
  /// If an error occurs during the operation, the error message is printed to the console.
  Future<bool> saveUserData(UserModel userData) async {
    try {
      await _db.collection('users').doc(userData.id).set(userData.toMap());
      return true; //Means it worked
    } catch (e) {
      print(e.toString());
      return false; //Means it failed
    }
  }

  /// Retrieves user data from the database.
  ///
  /// This method retrieves the user data from the database based on the current user's UID.
  /// It fetches the document from the "Users" collection using the UID as the document ID.
  /// The retrieved data is then used to create a [UserModel] object.
  ///
  /// Returns the [UserModel] object representing the user's data.
  Future<UserModel> retrieveUserData() async {
    String uid = _firebaseAuth.currentUser!.uid;
    DocumentSnapshot<Map<String, dynamic>> snapshot =
        await _db.collection("Users").doc(uid).get();
    if (snapshot.exists) {
      Map<String, dynamic> data = snapshot.data()!;
      data['isVerified'] = _firebaseAuth.currentUser!.emailVerified;
      UserModel user = UserModel.makeUser(data);
      return user;
    } else {
      UserModel user = UserModel(
        id: _firebaseAuth.currentUser!.uid,
        email: _firebaseAuth.currentUser!.email,
        isVerified: _firebaseAuth.currentUser!.emailVerified,
      );
      saveUserData(user);
      return user;

    }
  }
}
