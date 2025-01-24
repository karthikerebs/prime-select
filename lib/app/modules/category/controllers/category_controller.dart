import 'package:get/get.dart';
import 'package:omiga/app/core/constants/urls.dart';
import 'package:omiga/app/data/models/product_model.dart';
import 'package:omiga/app/data/services/api_service.dart';

class CategoryController extends GetxController {
  final ApiService _apiService = ApiService();
  final categoryName = ''.obs;
  final products = <Product>[].obs;
  final isLoading = true.obs;
  final categoryId = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void fetchProducts() async {
    isLoading.value = true;
    final response = await _apiService.postRequest(
      url: AppUrls.products,
      data: {'catid': categoryId.value},
    );
    if (response != null) {
      final productResponse = ProductResponse.fromJson(response);
      products.value = productResponse.products?.data ?? [];
    }
    isLoading.value = false;
  }
}
