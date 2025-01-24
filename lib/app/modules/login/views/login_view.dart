import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/core/widgets/custom_textfield.dart';
import 'package:omiga/app/modules/login/widgets/reset_password_sheet.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
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
            _buildLoginForm(emailController, passwordController),
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
          logo: Images.facebookLogo,
        ),
      ],
    );
  }

  _buildHeading() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 80),
        Text(
          'Login Account',
          style: Get.textTheme.titleLarge,
        ),
        const SizedBox(height: 16),
        Text(
          'Please login with registered account',
          style: Get.textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ],
    );
  }

  _buildLoginForm(TextEditingController emailController,
      TextEditingController passwordController) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32),
        Text(
          'Email Or Phone Number',
          style: Get.textTheme.labelLarge,
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: emailController,
          hintText: "Enter Your Email",
          prefixIcon: Images.emailIcon,
        ),
        SizedBox(height: 24),
        Text(
          'Password',
          style: Get.textTheme.labelLarge,
        ),
        SizedBox(height: 8),
        CustomTextField(
          controller: passwordController,
          hintText: "Your Password",
          isPassword: true,
          prefixIcon: Images.lockIcon,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              Get.bottomSheet(const ResetPasswordSheet());
            },
            child: Text(
              'Forgot Password?',
              style: Get.textTheme.labelLarge!.copyWith(color: AppColor.primary),
            ),
          ),
        ),
        const SizedBox(height: 16),
        CustomButton(
          title: "Login",
          onTap: () {
            Get.offAllNamed(Routes.MAIN);
          },
        ),
        Align(
          alignment: Alignment.center,
          child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.SIGNUP);
            },
            child: Text(
              'Don\'t have an account?',
              style: Get.textTheme.labelLarge!.copyWith(color: AppColor.primary),
            ),
          ),
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
