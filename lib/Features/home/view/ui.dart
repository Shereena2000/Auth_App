import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart' show Lottie;
import 'package:nxl/Settings/utils/p_colors.dart';
import 'package:provider/provider.dart';

import '../../../Services/auth_service.dart';
import '../../authentication/login/view_model/login_view_model.dart';
import '../../authentication/sign_up/view_model/sign_up_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0, 
        leadingWidth: 100, 
        leading: Padding(
          padding: const EdgeInsets.only(left: 16), 
          child: Center(
            child: Text(
              "NXL",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16), // space after action
            child: IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                // ✅ Show confirmation dialog
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: PColors.secondaryColor,
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, false), // cancel
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () =>
                            Navigator.pop(context, true), // confirm
                        child: const Text("Logout"),
                      ),
                    ],
                  ),
                );

                // If user confirmed logout
                if (shouldLogout ?? false) {
                  try {
                    context.read<LoginViewModel>().clearFields();
                  } catch (e) {
                    // ViewModel might not be available in context
                    debugPrint('LoginViewModel not found: $e');
                  }
                  
                  try {
                    context.read<SignUpViewModel>().clearFields();
                  } catch (e) {
                    // ViewModel might not be available in context
                    debugPrint('SignUpViewModel not found: $e');
                  }
                  final authService = AuthService();
                  await authService.logout();

                  // Navigate to login screen
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Center(child: Lottie.asset('assets/lottie/intro.json')),
      ),
    );
  }
}
