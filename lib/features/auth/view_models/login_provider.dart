import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kelontong_app/core/helpers/shared_preferences_helper.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      print("Attempting to login with email: $email");

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print("Login successful, fetching user data...");
      User? user = userCredential.user;

      if (user != null) {
        String displayName = user.displayName ?? "User";
        String photoURL = user.photoURL ?? "";

        print("Saving user data to SharedPreferences...");
        await SharedPreferencesHelper.saveUserData(
          email,
          displayName,
          photoURL,
        );

        _errorMessage = '';
        return true;
      } else {
        _errorMessage = 'Gagal mendapatkan data pengguna.';
        print(_errorMessage);
        return false;
      }
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'Unknown error';
      print("FirebaseAuthException: $_errorMessage");
      notifyListeners();
      return false;
    }
  }
}
