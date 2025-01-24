import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/favourite_controller.dart';
import '../../../core/constants/appcolors.dart';
import '../../../routes/app_pages.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorite'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: Get.textTheme.bodyMedium,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          // Grid of Favorite Products
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: 4, // Number of favorite products
              itemBuilder: (context, index) => _buildProductCard(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductCard(int index) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.DETAILS),
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
                      'https://picsum.photos/seed/$index/200/200',
                      fit: BoxFit.cover,
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
                        Icons.favorite,
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
                    'Monitor LG 22"inc 4K',
                    style: Get.textTheme.headlineSmall!
                        .copyWith(color: AppColor.black),
                  ),
                  Text(
                    '₹199.99',
                    style: Get.textTheme.labelLarge!.copyWith(
                      overflow: TextOverflow.ellipsis,
                      color: AppColor.black,
                      fontWeight: FontWeight.bold,
                    ),
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
