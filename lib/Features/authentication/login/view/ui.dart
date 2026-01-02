import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Settings/common/custom_elevated_button.dart';
import '../../../../Settings/common/custom_outline_button.dart';
import '../../../../Settings/common/custom_text_feild.dart';
import '../../../../Settings/common/underline_text_button.dart';
import '../../../../Settings/constants/sized_box.dart';
import '../../../../Settings/utils/images.dart';
import '../../../../Settings/utils/p_colors.dart';
import '../../../../Settings/utils/p_pages.dart';
import '../../../../Settings/utils/p_textstyle.dart';
import '../../common_widgets/auth_switch.dart';
import '../../common_widgets/or_divder.dart';
import '../view_model/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginViewModel>(
      builder: (context, viewModel, _) {
        return Scaffold(
          body: Stack(
            children: [
              // 🔹 Background Image
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Images.loginBg),
                    fit: BoxFit.cover, // important
                  ),
                ),
              ),
          
              // 🔹 Optional dark overlay (for text visibility)
              Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.3),
              ),
          
              // 🔹 Your login content
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: PColors.primaryColor,
                          size: 40,
                        ),
                        const SizeBoxH(12),
                        Text(
                          "Let’s Get Started",
                          style: PTextStyles.displayMedium,
                        ),
                        SizeBoxH(8),
                        // Email
                        CustomTextFeild(
                          controller: viewModel.emailController,
                          textHead: "Email",
                          hintText: "Enter your email",
                          filColor: const Color(0xFF261B1B),
                          borderColor: PColors.lightRed,
                          hintColor: PColors.lightRed,
                        ),
                        SizeBoxH(12),
                        // Password
                        CustomTextFeild(
                          controller: viewModel.passwordController,
                          textHead: "Password",
                          hintText: "Enter your password",
                          filColor: const Color(0xFF261B1B),
                          borderColor: PColors.lightRed,
                          hintColor: PColors.lightRed,
                          obscureText: viewModel.isPasswordHidden,
                          suffixIcon: Icon(
                            viewModel.isPasswordHidden
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: PColors.lightRed,
                          ),
                          sufixfn: viewModel.togglePasswordVisibility,
                        ),
                        SizeBoxH(5),
                            
                        Row(
                          children: [
                            Spacer(),
                            UnderlineTextButton(
                              text: "Forgot Password?",
                            
                              onTap: () {
                                // navigate to forgot password
                              },
                            ),
                          ],
                        ),
                        SizeBoxH(12),
                        CustomElavatedTextButton(
                          text: viewModel.isLoading ? "Logging in..." : "Login",
                          onPressed: viewModel.isLoading
                              ? null
                              : () => viewModel.login(context),
                        ),
                        SizeBoxH(12),
                        OrDivider(),
                            
                        SizeBoxH(12),
                        CustomOutlineButton(
                          onPressed: () {},
                          text: "Continue with Google",
                        ),
                            
                        SizeBoxH(20),
                            
                        AuthSwitchText(
                          prefixText: "New user? ",
                          actionText: "Sign Up",
                          prefixColor: PColors.lightRed,
                          actionColor: PColors.primaryColor,
                          onTap: () {
                               context.read<LoginViewModel>().clearFields();
                            Navigator.popAndPushNamed(context, PPages.signup);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
