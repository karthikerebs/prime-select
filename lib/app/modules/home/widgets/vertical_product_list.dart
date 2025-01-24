import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/modules/category/controllers/category_controller.dart';
import 'package:omiga/app/modules/home/controllers/home_controller.dart';
import 'package:omiga/app/routes/app_pages.dart';
import 'package:shimmer/shimmer.dart';

class VerticalProductList extends StatelessWidget {
  const VerticalProductList({super.key});
  @override
  Widget build(BuildContext context) {
    final categoryController = Get.find<CategoryController>();
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            horizontalTitleGap: 16,
            titleAlignment: ListTileTitleAlignment.center,
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            onTap: () {
              categoryController.categoryId.value =
                  controller.categories[index].id ?? 0;
              categoryController.fetchProducts();
              Get.toNamed(Routes.CATEGORY);
            },
            leading: SizedBox(
              height: 100,
              width: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "${AppUrls.baseUrlImage}${controller.categories[index].image ?? ''}",
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[300],
                      child: const Center(
                        child: Icon(Icons.image_not_supported),
                      ),
                    );
                  },
                ),
              ),
            ),
            title: Text(
              controller.categories[index].name?.capitalizeFirst ?? '',
              style:
                  Get.textTheme.headlineMedium!.copyWith(color: AppColor.grey),
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 16);
        },
      ),
    );
  }

  Widget _buildShimmerCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        height: 120,
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
          child: Row(
            children: [
              Container(
                width: 120,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(12)),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
