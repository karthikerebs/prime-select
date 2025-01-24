import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ProductTitleAndRating(),
          SizedBox(height: 20),
          PriceAndQuantity(),
          SizedBox(height: 20),
          ColorSelection(),
          SizedBox(height: 20),
          ProductDescription(),
          SizedBox(height: 30),
          ActionButtons(),
        ],
      ),
    );
  }
}

class ProductTitleAndRating extends StatelessWidget {
  const ProductTitleAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Monitor LG 22"inc 4K 12...',
          style: Get.textTheme.titleSmall!.copyWith(color: AppColor.black),
        ),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            Text(' 4.8 ', style: Get.textTheme.labelLarge),
            Text(
              '(320 Review)',
              style: Get.textTheme.labelLarge!.copyWith(
                color: AppColor.grey.withOpacity(0.8),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class PriceAndQuantity extends StatelessWidget {
  const PriceAndQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Get.textTheme.labelLarge!.copyWith(
                color: AppColor.grey.withOpacity(0.8),
              ),
            ),
            Text(
              '\$399.99',
              style: Get.textTheme.titleLarge!.copyWith(
                color: AppColor.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          children: [
            _QuantityButton(
              icon: Icons.remove,
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                '1',
                style: Get.textTheme.titleMedium,
              ),
            ),
            _QuantityButton(
              icon: Icons.add,
              onPressed: () {},
            ),
          ],
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
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: IconButton(
        icon: Icon(icon, size: 16),
        onPressed: onPressed,
        color: AppColor.grey,
      ),
    );
  }
}

class ColorSelection extends StatelessWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: Get.textTheme.labelLarge!.copyWith(
            color: AppColor.grey.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _ColorOption(color: Colors.black, isSelected: true),
            _ColorOption(color: Colors.blue, isSelected: false),
            _ColorOption(color: Colors.red, isSelected: false),
          ],
        ),
      ],
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;
  final bool isSelected;

  const _ColorOption({
    required this.color,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColor.primary : Colors.transparent,
          width: 2,
        ),
      ),
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: Get.textTheme.labelLarge!.copyWith(
            color: AppColor.grey.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
          style: Get.textTheme.bodyMedium!.copyWith(
            color: AppColor.grey,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
            label: const Text('Add to Cart'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              side: BorderSide(color: AppColor.primary),
              foregroundColor: AppColor.primary,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: AppColor.primary,
              foregroundColor: Colors.white,
            ),
            child: const Text('Buy Now'),
          ),
        ),
      ],
    );
  }
}
