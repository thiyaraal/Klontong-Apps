import 'package:flutter/material.dart';
import 'package:kelontong_app/features/auth/view_models/login_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:kelontong_app/core/helpers/routing_documentations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginPage();
}

class _LoginPage extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Tambahkan form key
  bool _isPasswordHidden = true;
  bool _isLoading = false;

  void _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return; // Jika form tidak valid, tidak lanjutkan login
    }

    setState(() => _isLoading = true);
    print("Login process started...");

    final loginProvider = Provider.of<LoginProvider>(context, listen: false);
    bool success = await loginProvider.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    setState(() => _isLoading = false);

    if (success) {
      print("Navigating to main screen...");
      Navigator.pushNamed(context, AppRoutes.main);
    } else {
      print("Login failed: ${loginProvider.errorMessage}");
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(loginProvider.errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey, // Gunakan form untuk validasi
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Masuk ke Akunmu",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF020617),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Color(0xFFF8FAFC),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? "Email tidak boleh kosong"
                              : null,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: _isPasswordHidden,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    filled: true,
                    fillColor: Color(0xFFF8FAFC),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 16.0,
                      horizontal: 12.0,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordHidden
                            ? TablerIcons.eye
                            : TablerIcons.eye_off,
                        color: Color(0xFF1E293B),
                      ),
                      onPressed: () {
                        setState(() {
                          _isPasswordHidden = !_isPasswordHidden;
                        });
                      },
                    ),
                  ),
                  validator:
                      (value) =>
                          value == null || value.isEmpty
                              ? "Password tidak boleh kosong"
                              : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _handleLogin,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color(0xFF084E85),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child:
                      _isLoading
                          ? CircularProgressIndicator(color: Colors.white)
                          : const Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
