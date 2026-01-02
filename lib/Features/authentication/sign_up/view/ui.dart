import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';


import '../../../../Settings/common/custom_elevated_button.dart';
import '../../../../Settings/common/custom_outline_button.dart';
import '../../../../Settings/common/custom_text_feild.dart';
import '../../../../Settings/constants/sized_box.dart';
import '../../../../Settings/utils/p_colors.dart';
import '../../../../Settings/utils/p_pages.dart';
import '../../../../Settings/utils/p_textstyle.dart';
import '../../../../Settings/utils/svgs.dart';
import '../../common_widgets/auth_switch.dart';
import '../../common_widgets/or_divder.dart';
import '../view_model/sign_up_view_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SignUpViewModel>();
    return Scaffold(
      body: SafeArea(
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
              Text("Start Your Journey", style: PTextStyles.displayMedium),
              SizeBoxH(5),
              Text(
                "Create An Account",
                style: PTextStyles.displaySmall.copyWith(
                  fontSize: 12,
                  color: PColors.lightRed,
                ),
              ),
              SizeBoxH(15),
      
              const SizeBoxH(24),
      
              // PageView for Steps
              Flexible(
                child: PageView(
                  controller: viewModel.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // Step 1: Email + Google Sign Up
                    _buildEmailStep(context, viewModel),
      
                    // Step 2: Password Fields
                    _buildPasswordStep(context, viewModel),
                  ],
                ),
              ),
      
              SizeBoxH(12),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailStep(BuildContext context, SignUpViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
               CustomTextFeild(
            controller: viewModel.nameController,
            textHead: "Name",
            hintText: 'Enter Your Name',
            filColor: const Color(0xFF261B1B),
            borderColor: PColors.lightRed,
            hintColor: PColors.lightRed,
          ),
               const SizeBoxH(8),
          CustomTextFeild(
            controller: viewModel.emailController,
            textHead: "Email Address",
            hintText: 'Enter Your Email',
            filColor: const Color(0xFF261B1B),
            borderColor: PColors.lightRed,
            hintColor: PColors.lightRed,
          ),
          const SizeBoxH(14),
          CustomElavatedTextButton(
            text: "Continue",
            onPressed: () => viewModel.goToNextStep(context),
          ),
          const SizeBoxH(12),
          const OrDivider(),
          const SizeBoxH(12),
          CustomOutlineButton(
            onPressed: () {
              // TODO: Implement Google Sign Up
            },
            text: "Sign up with Google",
            leading: SvgPicture.asset(Svgs.googleIcon, height: 18),
          ),
          SizeBoxH(12),
          AuthSwitchText(
            prefixText: "Already have an account? ",
            actionText: "Login",
      
            onTap: () {
              Navigator.popAndPushNamed(context, PPages.login);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordStep(BuildContext context, SignUpViewModel viewModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Back button
          Align(
            alignment: Alignment.topLeft,
            child: TextButton.icon(
              onPressed: viewModel.goToPreviousStep,
              icon: Icon(Icons.arrow_back, color: PColors.lightRed, size: 20),
              label: Text('Back', style: TextStyle(color: PColors.lightRed)),
            ),
          ),
      
          CustomTextFeild(
            controller: viewModel.passwordController,
            textHead: "Password",
            hintText: 'Enter Your Password',
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
      
            sufixfn: () {
              viewModel.togglePasswordVisibility();
            },
          ),
          const SizeBoxH(14),
          CustomTextFeild(
            controller: viewModel.confirmPasswordController,
            textHead: "Confirm Password",
            hintText: 'Re-enter Your Password',
            filColor: const Color(0xFF261B1B),
            borderColor: PColors.lightRed,
            hintColor: PColors.lightRed,
            obscureText: viewModel.isConfirmPasswordHidden,
      
            suffixIcon: Icon(
              viewModel.isConfirmPasswordHidden
                  ? Icons.visibility_off
                  : Icons.visibility,
              color: PColors.lightRed,
            ),
      
            sufixfn: () {
              viewModel.toggleConfirmPasswordVisibility();
            },
          ),
          const SizeBoxH(20),
          CustomElavatedTextButton(
         text: viewModel.isLoading ? "Creating..." : "Create Account",
          onPressed: viewModel.isLoading
        ? null
        : () => viewModel.createAccount(context),
          ),
          SizeBoxH(12),
          AuthSwitchText(
            prefixText: "Already have an account? ",
            actionText: "Login",
      
            onTap: () {
                  context.read<SignUpViewModel>().clearFields(); 
              Navigator.popAndPushNamed(context, PPages.login);
            },
          ),
        ],
      ),
    );
  }
}
