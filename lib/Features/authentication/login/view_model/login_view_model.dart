import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../Services/auth_service.dart';
import '../../../../Settings/helper/validator.dart';
import '../../../../Settings/utils/p_pages.dart';

class LoginViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isPasswordHidden = true;
  bool _isLoading = false;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isLoading => _isLoading;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  Future<void> login(BuildContext context) async {
    // ✅ Validation
    final emailError = Validator.email(emailController.text);
    final passwordError = Validator.password(passwordController.text);

    if (emailError != null) {
      _showSnackBar(context, emailError);
      return;
    }
    if (passwordError != null) {
      _showSnackBar(context, passwordError);
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      await _authService.loginWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      _showSnackBar(context, "Login Successful");

      // ✅ Navigate to Home after login
      Navigator.pushNamedAndRemoveUntil(
        context,
        PPages.homePageUi, // your home page route
        (route) => false,
      );
    } on FirebaseAuthException catch (e) {
      _showSnackBar(context, e.message ?? "Login failed");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
void clearFields() {
  emailController.clear();
  passwordController.clear();
  _isPasswordHidden = true;
  notifyListeners();
}
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
