import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/help_and_support_controller.dart';

class HelpAndSupportView extends GetView<HelpAndSupportController> {
  const HelpAndSupportView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help and Support'),
        centerTitle: true,
        titleTextStyle: Get.textTheme.titleSmall,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFAQItem(
              'Lorem ipsum dolor sit amet',
              isExpanded: true,
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              'Lorem ipsum dolor sit amet',
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              'Lorem ipsum dolor sit amet',
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            ),
            const SizedBox(height: 16),
            _buildFAQItem(
              'Lorem ipsum dolor sit amet,',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String title,
      {String? description, bool isExpanded = false}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          title: Text(
            title,
            style: Get.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          initiallyExpanded: isExpanded,
          tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          childrenPadding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
          ),
          iconColor: Get.theme.primaryColor,
          textColor: Get.theme.primaryColor,
          children: [
            if (description != null)
              Text(
                description,
                style: Get.textTheme.headlineSmall!.copyWith(
                  color: Colors.grey[600],
                  height: 1.5,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
