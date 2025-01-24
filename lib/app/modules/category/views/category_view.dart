import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/modules/details/controllers/details_controller.dart';
import 'package:omiga/app/routes/app_pages.dart';
import '../controllers/category_controller.dart';
import '../../../core/constants/appcolors.dart';
import 'package:shimmer/shimmer.dart';

class CategoryView extends GetView<CategoryController> {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(
          () => Text(controller.categoryName.value),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => _showFilterBottomSheet(context),
          ),
        ],
      ),
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) => _buildProductCard(index),
        ),
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return Obx(() {
      if (controller.isLoading.value) {
        return _buildShimmerCard();
      }
      return InkWell(
        onTap: () async {
          final detailsController = Get.put(DetailsController());
          detailsController.productId.value =
              controller.products[index].id ?? 0;
          await detailsController.fetchProductDetails();
          Get.toNamed(Routes.DETAILS);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 8,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(12)),
                      child: Image.network(
                        '${AppUrls.baseUrlImage}${controller.products[index].image}',
                        fit: BoxFit.contain,
                        width: double.infinity,
                      ),
                    ),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColor.primary,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.products[index].name ?? '',
                      style: Get.textTheme.headlineSmall!
                          .copyWith(color: AppColor.black),
                    ),
                    // Text(
                    //   '₹9999',
                    //   style: Get.textTheme.labelLarge!.copyWith(
                    //     overflow: TextOverflow.ellipsis,
                    //     color: AppColor.black,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildShimmerCard() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 8,
          ),
        ],
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 16,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 14,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Filter By',
              style: Get.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            Text(
              'Price',
              style: Get.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            // Add price range slider here
            const SizedBox(height: 16),
            Text(
              'Color',
              style: Get.textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            // Add color selection here
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Apply Filter',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
