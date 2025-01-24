import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/modules/details/controllers/details_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductImageCarousel extends GetView<DetailsController> {
  const ProductImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        final product = controller.productDetails.value?.product;

        final images = [
          product?.image,
          product?.image2 ?? '',
          product?.image3 ?? '',
          product?.image4 ?? '',
        ].where((img) => img != null && img.isNotEmpty).toList();
        // final images = [
        //   product?.image,
        //   product?.image2 ?? '',
        //   product?.image3 ?? '',
        //   product?.image4 ?? '',
        // ].toList();

        return Column(
          children: [
            SizedBox(
              height: 300,
              child: PageView.builder(
                controller: controller.pageController,
                itemCount: images.length,
                itemBuilder: (context, index) => Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.network(
                    '${AppUrls.baseUrlImage}${images[index]}',
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
            const SizedBox(height: 10),
            SmoothPageIndicator(
              controller: controller.pageController,
              count: images.length,
              effect: const WormEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.green,
                dotColor: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
