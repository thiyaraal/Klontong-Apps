import 'package:flutter/material.dart';
import 'package:kelontong_app/core/helpers/shared_preferences_helper.dart';

class ProfileProvider with ChangeNotifier {
  String name = "John Doe";
  String email = "johndoe@example.com";
  String profileImageUrl =
      "https://img.icons8.com/?size=100&id=Ib9FADThtmSf&format=png&color=FA5252";

  final String phone = "081234567890";
  final String address = "Jl. Contoh No. 123, Jakarta";

  bool isLoading = true;

  ProfileProvider() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    String? savedName = await SharedPreferencesHelper.getName();
    String? savedEmail = await SharedPreferencesHelper.getEmail();
    String? savedPhoto = await SharedPreferencesHelper.getPhotoUrl();

    if (savedName != null) name = savedName;
    if (savedEmail != null) email = savedEmail;
    if (savedPhoto != null && savedPhoto.isNotEmpty)
      profileImageUrl = savedPhoto;

    isLoading = false;
    notifyListeners();
  }

  void updateProfile(String name, String email, String profileImageUrl) async {
    this.name = name;
    this.email = email;
    this.profileImageUrl = profileImageUrl;

    await SharedPreferencesHelper.saveUserData(name, email, profileImageUrl);

    notifyListeners();
  }
}
