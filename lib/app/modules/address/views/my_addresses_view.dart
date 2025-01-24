import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/address_controller.dart';

class MyAddressesView extends GetView<AddressController> {
  const MyAddressesView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
        titleTextStyle: Get.textTheme.titleSmall,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Address', style: Get.textTheme.titleSmall),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: (context, index) => _buildAddressCard(),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDRESS);
                },
                child: Text(
                  'Add New',
                  style: Get.textTheme.labelMedium!.copyWith(
                    color: AppColor.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard() {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade100,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  Images.addressIcon,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('House', style: Get.textTheme.labelLarge),
                    const SizedBox(height: 4),
                    Text(
                      '2118 Thornridge Cir. Syracuse,\nConnecticut 35624',
                      style: Get.textTheme.headlineSmall!
                          .copyWith(color: AppColor.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  title: 'Edit',
                  onTap: () {
                    // Handle edit
                  },
                  buttonColor: AppColor.primary,
                  buttonHeight: 37,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: CustomButton(
                  title: 'Delete',
                  onTap: () {
                    // Handle delete
                  },
                  buttonColor: AppColor.red,
                  buttonHeight: 37,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
