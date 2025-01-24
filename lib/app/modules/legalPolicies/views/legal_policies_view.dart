import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';

import '../controllers/legal_policies_controller.dart';

class LegalPoliciesView extends GetView<LegalPoliciesController> {
  const LegalPoliciesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Legal and Polices'),
        centerTitle: true,
        titleTextStyle: Get.textTheme.titleSmall,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms',
              style: Get.textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
              'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
              'Ut enim ad minim veniam, quis nostrud exercitation ullamco '
              'laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum '
              'dolor sit amet, consectetur adipiscing elit, sed do eiusmod '
              'tempor incididunt ut labore et dolore magna aliqua. Ut enim ad '
              'minim veniam, quis nostrud exercitation ullamco laboris nisi ut '
              'aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, '
              'consectetur adipiscing elit, sed do eiusmod tempor incididunt '
              'ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
              'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea '
              'commodo consequat.',
              style: Get.textTheme.headlineSmall!.copyWith(
                color: AppColor.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
