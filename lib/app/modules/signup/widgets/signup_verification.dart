import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/routes/app_pages.dart';
import 'package:pinput/pinput.dart';

class SignupVerification extends StatelessWidget {
  const SignupVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildVerificationIcon(),
            const SizedBox(height: 24),
            _buildVerificationTitle(),
            const SizedBox(height: 16),
            _buildEmailText(),
            const SizedBox(height: 32),
            _buildPinInput(),
            const SizedBox(height: 24),
            _buildSubmitButton(),
            const SizedBox(height: 16),
            _buildResendOption(),
          ],
        ),
      ),
    );
  }

  Widget _buildVerificationIcon() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primary.withOpacity(0.3),
      ),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary,
          ),
          child: const Icon(
            Icons.lock_outline,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationTitle() {
    return const Text(
      'Verification Code',
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildEmailText() {
    return Text(
      'We have to sent the code verification to\nkjsbdka@ndksand.kkb',
      textAlign: TextAlign.center,
      style: Get.textTheme.bodyLarge!.copyWith(color: AppColor.grey),
    );
  }

  Widget _buildPinInput() {
    return Pinput(
      length: 4,
      defaultPinTheme: PinTheme(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      focusedPinTheme: PinTheme(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary, width: 1.5),
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      submittedPinTheme: PinTheme(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      separatorBuilder: (index) => const SizedBox(width: 16),
      keyboardType: TextInputType.number,
      onCompleted: (pin) {
        // Handle pin completion
      },
    );
  }

  Widget _buildSubmitButton() {
    return CustomButton(
      title: "Submit",
      onTap: () {
        // Show success dialog and navigate to home
        _showSuccessDialog();
      },
    );
  }

  Widget _buildResendOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Didn't receive The Code ? ",
          style: Get.textTheme.labelMedium!.copyWith(color: AppColor.grey),
        ),
        TextButton(
          onPressed: () {
            // Implement resend logic
          },
          child: Text(
            'Resend',
            style: Get.textTheme.labelMedium!.copyWith(color: AppColor.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildIcon({required IconData icon}) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.primary.withOpacity(0.3),
      ),
      child: Center(
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primary,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog() {
    Get.dialog(
      Dialog(
        backgroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIcon(icon: Icons.check),
              const SizedBox(height: 24),
              Text(
                'RegisterSuccess',
                style: Get.textTheme.titleLarge!,
              ),
              const SizedBox(height: 16),
              Text(
                'Congratulation! your account already created,\nplease login to get amazing experience',
                textAlign: TextAlign.center,
                style:
                    Get.textTheme.labelMedium!.copyWith(color: AppColor.grey),
              ),
              const SizedBox(height: 24),
              CustomButton(
                title: "Go to Homepages",
                onTap: () => Get.offAllNamed(Routes.MAIN),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
