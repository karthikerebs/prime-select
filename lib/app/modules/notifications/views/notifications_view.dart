import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        titleTextStyle: Get.textTheme.titleSmall,
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              // Add clear all functionality
            },
            child: Text(
              'Clear all',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today',
                  style: Get.textTheme.labelMedium,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2, // Replace with actual notification count
              itemBuilder: (context, index) => _buildNotificationCard(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Title',
            style: Get.textTheme.labelMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt.',
            style: Get.textTheme.bodySmall!.copyWith(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
