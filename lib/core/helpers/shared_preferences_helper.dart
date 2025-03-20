import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _emailKey = 'email';
  static const String _nameKey = 'name';
  static const String _photoUrlKey = 'photoUrl';

  /// Simpan data user ke SharedPreferences
  static Future<void> saveUserData(
    String email,
    String name,
    String photoUrl,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_nameKey, name);
    await prefs.setString(_photoUrlKey, photoUrl);
  }

  /// Ambil email dari SharedPreferences
  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }

  /// Ambil nama dari SharedPreferences
  static Future<String?> getName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_nameKey);
  }

  /// Ambil foto profil dari SharedPreferences
  static Future<String?> getPhotoUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_photoUrlKey);
  }

  /// Hapus data user dari SharedPreferences saat logout
  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_emailKey);
    await prefs.remove(_nameKey);
    await prefs.remove(_photoUrlKey);
  }
}
