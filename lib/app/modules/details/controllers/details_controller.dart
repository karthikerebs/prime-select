import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/data/models/product_details_model.dart';
import 'package:omiga/app/data/services/api_service.dart';

class DetailsController extends GetxController {
  final productDetails = Rxn<ProductDetailsModel>();
  final isLoading = true.obs;
  final ApiService _apiService = ApiService();
  final productId = 0.obs;
  late final PageController pageController;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    isLoading.value = true;
    try {
      final response = await _apiService.postRequest(
        url: '${AppUrls.baseUrl}product_details',
        data: {
          'product_id': productId.value,
          'user_id': 652,
        },
      );
      if (response != null) {
        productDetails.value = ProductDetailsModel.fromJson(response);
      }
    } catch (e) {
      print('[ProductDetails] Error: $e');
      Get.snackbar('Error', 'Failed to load product details');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    // Reset values when controller is disposed
    productId.value = 0;
    productDetails.value = null;
    super.onClose();
  }
}
