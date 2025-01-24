import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/cart_controller.dart';
import '../../../core/constants/appcolors.dart';

class CartView extends GetView<CartController> {
  final TextEditingController promoCodeController = TextEditingController();
  CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 20,
              separatorBuilder: (context, index) => Divider(
                height: 32,
                color: AppColor.grey.withOpacity(0.3),
              ),
              itemBuilder: (context, index) => _buildCartItem(),
            ),
          ),
          CustomButton(
            hMargin: 16,
            title: 'Check Out',
            onTap: () {
              Get.bottomSheet(
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(34),
                    topRight: Radius.circular(34),
                  ),
                ),
                _buildBottomSection(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildCartItem() {
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      _QuantityButton(icon: Icons.remove, onPressed: () {}),
                    ],
                  ),
                  Text(
                    '₹199',
                    style: Get.textTheme.titleLarge!.copyWith(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomSection() {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(34),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildPromoCodeInput(),
            const SizedBox(height: 16),
            _buildPriceDetails(),
            const SizedBox(height: 16),
            CustomButton(
              title: 'Check Out',
              onTap: () {
                Get.toNamed(Routes.PAYMENT);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCodeInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                filled: false,
                hintText: 'Enter your promo code',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColor.grey.withOpacity(0.6)),
                ),
                hintStyle: Get.textTheme.bodyMedium!.copyWith(
                  color: AppColor.grey.withOpacity(0.8),
                ),
              ),
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: AppColor.grey),
        ],
      ),
    );
  }

  Widget _buildPriceDetails() {
    return Column(
      children: [
        _buildPriceRow('Subtotal', '₹199'),
        const SizedBox(height: 8),
        _buildPriceRow('Shipping', '₹199'),
        const Divider(height: 24),
        _buildPriceRow('Total', '₹199', isTotal: true),
      ],
    );
  }

  Widget _buildPriceRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Get.textTheme.headlineMedium!.copyWith(
            fontSize: 14,
          ),
        ),
        Text(
          amount,
          style: Get.textTheme.headlineMedium!
              .copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButton({
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.grey.withOpacity(0.2),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: const Icon(
                Icons.remove,
                color: AppColor.black,
                size: 10,
              ),
            ),
          ),
          const SizedBox(width: 10),
          const Text('1'),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {},
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.black,
              ),
              child: const Icon(
                Icons.add,
                color: AppColor.white,
                size: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
