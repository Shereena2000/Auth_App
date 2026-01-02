import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Services/auth_service.dart';
import '../../../../Settings/helper/validator.dart';
import '../../../../Settings/utils/p_pages.dart';


class SignUpViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  final PageController pageController = PageController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool _isPasswordHidden = true;
  bool _isConfirmPasswordHidden = true;
  bool _isLoading = false;
  int _currentStep = 0;

  bool get isPasswordHidden => _isPasswordHidden;
  bool get isConfirmPasswordHidden => _isConfirmPasswordHidden;
  bool get isLoading => _isLoading;
  int get currentStep => _currentStep;

  void togglePasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordHidden = !_isConfirmPasswordHidden;
    notifyListeners();
  }

  /// STEP 1 VALIDATION
  void goToNextStep(BuildContext context) {
    final nameError = Validator.textSpecific(nameController.text, "name");
    final emailError = Validator.email(emailController.text);

    if (nameError != null || emailError != null) {
      _showSnackBar(context, nameError ?? emailError!);
      return;
    }

    _currentStep = 1;
    notifyListeners();

    pageController.animateToPage(
      1,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  void goToPreviousStep() {
    _currentStep = 0;
    notifyListeners();

    pageController.animateToPage(
      0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  /// CREATE ACCOUNT
  Future<void> createAccount(BuildContext context) async {
    final passwordError = Validator.password(passwordController.text);

    if (passwordError != null) {
      _showSnackBar(context, passwordError);
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showSnackBar(context, "Passwords do not match");
      return;
    }

    try {
      _isLoading = true;
      notifyListeners();

      await _authService.signUpWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      _showSnackBar(context, "Account created successfully");

      Navigator.pushNamedAndRemoveUntil(
      context,
      PPages.homePageUi, // make sure this exists
      (route) => false,
    );

    } on FirebaseAuthException catch (e) {
      _showSnackBar(context, e.message ?? "Signup failed");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
void clearFields() {
  nameController.clear();
  emailController.clear();
  passwordController.clear();
  confirmPasswordController.clear();
  _isPasswordHidden = true;
  _isConfirmPasswordHidden = true;
  _currentStep = 0;
  pageController.jumpToPage(0);
  notifyListeners();
}
  @override
  void dispose() {
    pageController.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
