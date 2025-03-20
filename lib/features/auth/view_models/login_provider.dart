import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _errorMessage = '';
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message ?? 'Unknown error';
    }
    notifyListeners();
  }
}
