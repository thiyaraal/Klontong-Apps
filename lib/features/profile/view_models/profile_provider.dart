import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {

  String name = "John Doe";
  String email = "johndoe@example.com";
  String profileImageUrl = "https://img.icons8.com/?size=100&id=Ib9FADThtmSf&format=png&color=FA5252";

  final String phone = "081234567890";
  final String address = "Jl. Contoh No. 123, Jakarta";

  void updateProfile(String name, String email, String profileImageUrl) {
    this.name = name;
    this.email = email;
    this.profileImageUrl = profileImageUrl;
    notifyListeners();
  }

  
}

