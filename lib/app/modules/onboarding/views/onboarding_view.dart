import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Gap(30),
            Expanded(
              child: PageView(
                controller: controller.pageController,
                onPageChanged: controller.updateCurrentPage,
                children: [
                  _buildOnboardingPage(
                    image: 'assets/onboarding1.png',
                    title: 'Various Collection Of the Latest Product',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  ),
                  _buildOnboardingPage(
                    image: 'assets/onboarding2.png',
                    title: 'Various Collection Of the Latest Product',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  ),
                  _buildOnboardingPage(
                    image: 'assets/onboarding3.png',
                    title: 'Various Collection Of the Latest Product',
                    description:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  ),
                ],
              ),
            ),
            _buildButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildOnboardingPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              height: Get.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Get.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  description,
                  style: Get.textTheme.labelMedium!.copyWith(
                    color: AppColor.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: controller.currentPage.value == index
            ? AppColor.primary
            : AppColor.grey,
      ),
    );
  }

  Widget _buildButtons() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) => _buildDot(index)),
              )),
          const SizedBox(height: 32),
          CustomButton(
            title: 'Create Account',
            onTap: () {
              Get.toNamed(Routes.SIGNUP);
            },
          ),
          TextButton(
            onPressed: () => Get.toNamed(Routes.LOGIN),
            child: Text(
              'Already an Account',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
