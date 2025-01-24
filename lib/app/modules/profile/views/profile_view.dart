import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/routes/app_pages.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Info
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/200/200',
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Nithin T V',
                      style: Get.textTheme.headlineMedium,
                    ),
                    Text(
                      '+91 974 555 734',
                      style: Get.textTheme.bodyMedium!.copyWith(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Menu Items
              _buildMenuItem(Icons.shopping_cart_outlined, 'Order', onTap: () {
                Get.toNamed(Routes.ORDERS);
              }),
              _buildMenuItem(Icons.edit_outlined, 'Edit Profile'),
              _buildMenuItem(Icons.location_on_outlined, 'Address', onTap: () {
                Get.toNamed(Routes.MY_ADDRESSES);
              }),
              const SizedBox(height: 24),
              Text('Preference', style: Get.textTheme.titleSmall),
              const SizedBox(height: 16),
              _buildMenuItem(Icons.shield_outlined, 'Legal and Policies',
                  onTap: () {
                Get.toNamed(Routes.LEGAL_POLICIES);
              }),
              _buildMenuItem(Icons.help_outline, 'Help and Support', onTap: () {
                Get.toNamed(Routes.HELP_AND_SUPPORT);
              }),
              _buildMenuItem(Icons.logout, 'Log out', color: Colors.green,
                  onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              }),
              _buildMenuItem(Icons.delete_outline, 'Delete Account',
                  color: Colors.red, onTap: () {
                Get.offAllNamed(Routes.LOGIN);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title,
      {Color? color, VoidCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColor.grey.withOpacity(0.05),
        ),
        child: Row(
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 16),
            Text(
              title,
              style: Get.textTheme.headlineMedium,
            ),
            const Spacer(),
            if (title != 'Log out' && title != 'Delete Account')
              const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
