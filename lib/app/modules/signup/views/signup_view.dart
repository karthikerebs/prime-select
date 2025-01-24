import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/core/widgets/custom_textfield.dart';
import 'package:omiga/app/routes/app_pages.dart';

import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeading(),
            _buildSignupForm(
                usernameController, emailController, passwordController),
            _buildSocialButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomOutlinedButton(
          title: "Sign Up With Google",
          onTap: () {},
          logo: Images.googleLogo,
          vMargin: 0,
        ),
        CustomOutlinedButton(
          title: "Sign Up With Facebook",
          onTap: () {},
          logo: Images.googleLogo,
        ),
      ],
    );
  }

  Widget _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        Text(
          'Create Account',
          style: Get.textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Lorem ipsum dolor sit amet, consectetur',
          style: Get.textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ],
    );
  }

  Widget _buildSignupForm(
    TextEditingController usernameController,
    TextEditingController emailController,
    TextEditingController passwordController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 32),
        Text(
          'Username',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: usernameController,
          hintText: "Create Your User Name",
          prefixIcon: Images.userIcon,
        ),
        const SizedBox(height: 24),
        Text(
          'Email Or Phone Number',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: emailController,
          hintText: "Enter Your Email or Phone Number",
          prefixIcon: Images.emailIcon,
        ),
        const SizedBox(height: 24),
        Text(
          'Password',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: passwordController,
          hintText: "Create Your Password",
          isPassword: true,
          prefixIcon: Images.lockIcon,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.LOGIN);
            },
            child: Text(
              'Already have an account?',
              style: Get.textTheme.labelLarge!.copyWith(color: AppColor.primary),
            ),
          ),
        ),
        CustomButton(
          title: "Create Account",
          onTap: () {
            Get.toNamed(Routes.SIGNUP_VERIFICATION);
          },
        ),
        Center(
          child: Text(
            'Or using other method',
            style: Get.textTheme.labelMedium!.copyWith(color: AppColor.grey),
          ),
        ),
        const SizedBox(height: 48),
      ],
    );
  }
}
