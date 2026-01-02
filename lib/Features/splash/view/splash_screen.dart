// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../Settings/utils/p_colors.dart';
import '../../../Settings/utils/p_pages.dart';
import '../../../Settings/utils/p_textstyle.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateNext();
  }

  Future<void> navigateNext() async {
    // Wait 2 seconds for splash effect
    await Future.delayed(const Duration(seconds: 2));

    // Check if user is logged in
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // ✅ User is logged in → go to Home
      Navigator.pushNamedAndRemoveUntil(
        context,
        PPages.homePageUi, 
        (route) => false,
      );
    } else {
      // ✅ Not logged in → go to Login
      Navigator.pushNamedAndRemoveUntil(
        context,
        PPages.login,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App logo or icon
            Icon(
              Icons.favorite_border,
              color: PColors.white,
              size: 80,
            ),
            const SizedBox(height: 20),

            // App name
            Text(
              "NXL",
              style: PTextStyles.displayLarge,
            ),
            const SizedBox(height: 10),

            // Optional tagline
            Text(
              "Start Your Journey",
              style: PTextStyles.displaySmall,
            ),

            const SizedBox(height: 30),
            // Optional loading indicator
            const CircularProgressIndicator(
              color:  Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
