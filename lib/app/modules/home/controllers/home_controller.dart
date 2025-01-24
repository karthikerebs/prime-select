import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/data/models/carousel_model.dart';
import 'package:omiga/app/data/models/category_models.dart';
import 'package:omiga/app/data/models/new_arrival_model.dart';
import 'package:omiga/app/data/services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  final pageController = PageController();
  final currentPage = 0.obs;
  final RxList<String> searchHistory = <String>[
    'Electronics',
    'Electronics',
    'Electronics',
    'Electronics',
  ].obs;
  final RxList<Category> categories = <Category>[].obs;
  final RxList<String> carouselImages = <String>[].obs;
  final RxBool isLoading = true.obs;
  final RxList<ProductData> trendingProducts = <ProductData>[].obs;

  @override
  void onInit() {
    fetchCategories();
    fetchCarouselImages();
    fetchTrendingProducts();
    super.onInit();
  }

  void updateCurrentPage(int index) {
    currentPage.value = index;
  }

  void addToSearchHistory(String term) {
    if (!searchHistory.contains(term)) {
      searchHistory.insert(0, term);
      if (searchHistory.length > 10) {
        searchHistory.removeLast();
      }
    }
  }

  void removeFromSearchHistory(String term) {
    searchHistory.remove(term);
  }

  void clearSearchHistory() {
    searchHistory.clear();
  }

  void fetchCategories() async {
    try {
      isLoading.value = true;
      final response = await _apiService
          .postRequest(url: AppUrls.categories, data: {'shopid': 1});
      if (response != null) {
        final categoryModel = CategoryResponse.fromJson(response);
        categories.value = categoryModel.categories ?? [];
      }
    } catch (e) {
      print('[Categories] Error: $e');
      Get.snackbar('Error', 'Failed to load categories');
    } finally {
      isLoading.value = false;
    }
  }

  void fetchCarouselImages() async {
    try {
      isLoading.value = true;
      final response = await _apiService
          .postRequest(url: AppUrls.banners, data: {'shopid': 1});
      if (response != null) {
        final carouselModel = CarouselModel.fromJson(response);
        carouselImages.value = carouselModel.mainBanners.map((banner) {
          return "${AppUrls.baseUrlImage}${banner.image}";
        }).toList();
      }
    } catch (e) {
      print('[CarouselImages] Error: $e');
      Get.snackbar('Error', 'Failed to load banner images');
    } finally {
      isLoading.value = false;
    }
  }

  void fetchTrendingProducts() async {
    try {
      isLoading.value = true;
      final response = await _apiService.postRequest(
        url: '${AppUrls.baseUrl}trending_products',
        data: {
          'shopid': 1,
          'userid': 652,
        },
      );
      if (response != null) {
        print(response);
        final productResponse = NewArrivalModel.fromJson(response);
        trendingProducts.value = productResponse.trendingproducts!.data ?? [];
      }
    } catch (e) {
      print('[TrendingProducts] Error: $e');
      Get.snackbar('Error', 'Failed to load trending products');
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
