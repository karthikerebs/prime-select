import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/widgets/custom_buttons.dart';
import 'package:omiga/app/modules/details/views/widgets/product_image_carousel.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/details_controller.dart';
import 'package:shimmer/shimmer.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Obx(() {
        return controller.isLoading.value
            ? const DetailsShimmer()
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    ProductImageCarousel(),
                    ProductDetails(),
                  ],
                ),
              );
      }),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text('Details Product'),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.favorite_border,
            color: AppColor.primary,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}

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

class ProductTitleAndRating extends GetView<DetailsController> {
  const ProductTitleAndRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.productDetails.value?.product;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product?.name ?? '',
            style: Get.textTheme.titleSmall!.copyWith(color: AppColor.black),
          ),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 20),
              Text(
                ' 4.8 ',
                style: Get.textTheme.labelLarge,
              ),
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
    });
  }
}

class PriceAndQuantity extends GetView<DetailsController> {
  const PriceAndQuantity({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final unit = controller.productDetails.value?.units?.firstOrNull;
      return Row(
        children: [
          Text(
            '₹${unit?.offerprice ?? unit?.price ?? 0}',
            style: Get.textTheme.titleLarge,
          ),
          const Spacer(),
          Container(
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
          ),
        ],
      );
    });
  }
}

class ColorSelection extends StatelessWidget {
  const ColorSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: Get.textTheme.titleSmall),
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

class ProductDescription extends GetView<DetailsController> {
  const ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final product = controller.productDetails.value?.product;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Get.textTheme.titleSmall,
          ),
          const SizedBox(height: 10),
          Text(
            product?.desc ?? '',
            style: Get.textTheme.labelMedium!.copyWith(
              color: AppColor.grey.withOpacity(0.8),
            ),
          ),
        ],
      );
    });
  }
}

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            onTap: () {
              Get.toNamed(Routes.CART);
            },
            title: 'Add To Cart',
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: CustomButton(
            onTap: () {
              Get.toNamed(Routes.PAYMENT);
            },
            title: 'Buy Now',
            buttonColor: AppColor.orange,
          ),
        ),
      ],
    );
  }
}

class DetailsShimmer extends StatelessWidget {
  const DetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel shimmer
            Container(
              height: 300,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title shimmer
                  Container(
                    width: Get.width * 0.7,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  // Rating shimmer
                  Container(
                    width: Get.width * 0.3,
                    height: 15,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 20),
                  // Price shimmer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 80,
                        height: 25,
                        color: Colors.white,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Color section shimmer
                  Container(
                    width: 60,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Description shimmer
                  Container(
                    width: 100,
                    height: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: double.infinity,
                    height: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 30),
                  // Action buttons shimmer
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 45,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
