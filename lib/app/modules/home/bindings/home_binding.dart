import 'package:get/get.dart';
import 'package:omiga/app/modules/category/controllers/category_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
  }
}
