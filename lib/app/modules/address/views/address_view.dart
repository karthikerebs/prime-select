import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/address_controller.dart';
import '../../../core/widgets/custom_buttons.dart';
import '../../../core/widgets/custom_textfield.dart';

class AddressView extends GetView<AddressController> {
  const AddressView({super.key});
  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController stateController = TextEditingController();
    final TextEditingController districtController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text(
              'Add Address',
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(height: 32),
            _buildAddressForm(
              nameController,
              phoneController,
              addressController,
              stateController,
              districtController,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressForm(
    TextEditingController nameController,
    TextEditingController phoneController,
    TextEditingController addressController,
    TextEditingController stateController,
    TextEditingController districtController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: nameController,
          hintText: "Enter name",
        ),
        const SizedBox(height: 24),
        Text(
          'Phone Number',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: phoneController,
          hintText: "Enter number",
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'State',
                    style: Get.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    controller: stateController,
                    hintText: "Select State",
                    readOnly: true,
                    onTap: () {
                      // Add state selection logic
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'District',
                    style: Get.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    hintText: "Select District",
                    readOnly: true,
                    controller: districtController,
                    onTap: () {
                      // Add district selection logic
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Address',
          style: Get.textTheme.labelLarge,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: addressController,
          hintText: "Enter address",
          maxLines: null,
        ),
        const SizedBox(height: 48),
        CustomButton(
          title: "Save Address",
          onTap: () {
            Get.back();
          },
        ),
      ],
    );
  }
}
