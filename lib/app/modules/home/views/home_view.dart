import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/modules/category/controllers/category_controller.dart';
import 'package:omiga/app/modules/details/controllers/details_controller.dart';
import 'package:omiga/app/modules/home/widgets/product_search_delegate.dart';
import 'package:omiga/app/modules/home/widgets/vertical_product_list.dart';
import 'package:omiga/app/routes/app_pages.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../controllers/home_controller.dart';
import '../../../core/constants/appcolors.dart';
import '../../../core/constants/images.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildCarousel(0),
              _buildCategories(),
              _buildNewArrivals(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.primary
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(Images.appIcon, height: 40),
            // Image.asset(Images.appIconText, height: 40),
            const Spacer(),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    showSearch(
                      context: Get.context!,
                      delegate: ProductSearchDelegate(
                        searchHistory: controller.searchHistory,
                        onHistoryRemoved: controller.removeFromSearchHistory,
                        onClearAll: controller.clearSearchHistory,
                      ),
                    );
                  },
                  child: SvgPicture.asset(Images.searchIcon),
                ),
                Gap(24),
                InkWell(
                  onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
                  child: SvgPicture.asset(Images.notificationIcon),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(int index) {
    return Obx(
      () => Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 200,
            child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: controller.updateCurrentPage,
              itemCount: controller.carouselImages.length,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  controller.carouselImages[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SmoothPageIndicator(
            controller: controller.pageController,
            count: controller.carouselImages.length,
            effect: WormEffect(
              dotWidth: 8,
              dotHeight: 8,
              activeDotColor: AppColor.primary,
              dotColor: AppColor.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: controller.currentPage.value == index
            ? AppColor.primary
            : AppColor.grey,
      ),
    );
  }

  Widget _buildCategories() {
    final categoryController = Get.find<CategoryController>();
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: Get.textTheme.titleSmall,
                ),
                TextButton(
                  onPressed: () {
                    Get.to(() => const VerticalProductList());
                  },
                  child: Text(
                    'See all',
                    style: Get.textTheme.labelLarge!
                        .copyWith(color: AppColor.primary),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          categoryController.categoryId.value =
                              controller.categories[index].id ?? 0;
                          categoryController.fetchProducts();
                          Get.toNamed(Routes.CATEGORY);
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey[200],
                          ),
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
                      ),
                      const SizedBox(height: 8),
                      Text(
                        controller.categories[index].name?.capitalizeFirst ??
                            '',
                        style: Get.textTheme.headlineSmall!
                            .copyWith(color: AppColor.grey),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewArrivals() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: ShimmerBox(height: 24, width: 120),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4,
              itemBuilder: (context, index) => _buildShimmerCard(),
            ),
          ],
        );
      }

      if (controller.trendingProducts.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Text('No products available'),
          ),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'New Arrivals',
              style: Get.textTheme.titleSmall,
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: controller.trendingProducts.length,
            itemBuilder: (context, index) {
              final product = controller.trendingProducts[index];
              return InkWell(
                onTap: () async {
                  final detailsController = Get.put(DetailsController());
                  detailsController.productId.value = product.id ?? 0;
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
                              borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(12)),
                              child: Image.network(
                                '${AppUrls.baseUrlImage}${product.image}',
                                fit: BoxFit.contain,
                                width: double.infinity,
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
                            Positioned(
                              right: 8,
                              top: 8,
                              child: CircleAvatar(
                                radius: 10,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite_border,
                                  color: AppColor.primary,
                                  size: 13,
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
                              product.name ?? 'Product Name',
                              style: Get.textTheme.headlineSmall!
                                  .copyWith(color: AppColor.black),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            // Text(
                            //   '₹199.99',
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
            },
          ),
        ],
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
}

// Helper widget for shimmer boxes
class ShimmerBox extends StatelessWidget {
  final double height;
  final double width;

  const ShimmerBox({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );
  }
}
