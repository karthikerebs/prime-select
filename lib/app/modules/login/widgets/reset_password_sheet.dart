import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/images.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/core/widgets/custom_textfield.dart';

class ResetPasswordSheet extends StatelessWidget {
  const ResetPasswordSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Reset Password',
            style: Get.textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'Enter your email address to reset your password',
            style: Get.textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          CustomTextField(
            controller: TextEditingController(),
            hintText: "Enter Your Email",
            prefixIcon: Images.emailIcon,
          ),
          const SizedBox(height: 24),
          CustomButton(
            title: "Send Reset Link",
            onTap: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
