import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/routes/app_pages.dart';

import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payments'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Address Section
            Text(
              'Address',
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildAddressCard(),

            // Product Section
            const SizedBox(height: 24),
            Text(
              'Product (3)',
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildProductsList(),

            // Payment Method Section
            const SizedBox(height: 24),
            Text(
              'Payment method',
              style: Get.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _buildPaymentMethods(),

            // Total Amount Section
            const SizedBox(height: 24),
            _buildTotalAmount(),

            const SizedBox(height: 16),
            CustomButton(
              title: 'Order Now',
              onTap: () {
                Get.bottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(34),
                      topRight: Radius.circular(34),
                    ),
                  ),
                  _successBottomsheet(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard() {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                color: AppColor.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(Images.addressIcon),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'House',
                  style: Get.textTheme.headlineLarge!.copyWith(
                    fontSize: 18,
                  ),
                ),
                Text(
                  '2118 Thornridge Cir. Syracuse,\nConnecticut 35624',
                  style: Get.textTheme.bodyMedium!.copyWith(
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
          right: 0,
          top: 0,
          child: TextButton(
            onPressed: () {
              Get.toNamed(Routes.ADDRESS);
            },
            child: Text(
              'Edit',
              style: Get.textTheme.bodyMedium!.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductsList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      separatorBuilder: (context, index) => Divider(
        height: 32,
        color: AppColor.grey.withOpacity(0.3),
      ),
      itemBuilder: (context, index) => _buildProductItem(),
    );
  }

  Widget _buildProductItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://picsum.photos/100/100',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Monitor LG 22"inc 4K 120Fps',
                style: Get.textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Color: Brown',
                style: Get.textTheme.labelLarge!.copyWith(
                  color: AppColor.grey.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '2 X ₹199',
                    style: Get.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethods() {
    return Column(
      children: [
        _buildPaymentOption(
          'Pay Cash On Delivery',
          isSelected: true,
        ),
        const SizedBox(height: 12),
        _buildPaymentOption(
          'Pay Online',
          isSelected: false,
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String title, {required bool isSelected}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Get.textTheme.headlineMedium,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? Colors.blue : Colors.grey,
                width: 2,
              ),
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                  )
                : null,
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAmount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Total Amount',
          style: Get.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          '₹199',
          style: Get.textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _successBottomsheet() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
          topRight: Radius.circular(34),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Gap(32),
          Image.asset(Images.orderSuccessImage),
          const SizedBox(height: 16),
          Text('Order Placed Successfully', style: Get.textTheme.headlineLarge),
          const Spacer(),
          CustomButton(
            title: 'Continue Shopping',
            onTap: () {
              Get.offAllNamed(Routes.MAIN);
            },
          ),
        ],
      ),
    );
  }
}
