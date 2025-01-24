import 'package:get/get.dart';
import 'package:omiga/app/modules/bottombar/controllers/bottombar_controller.dart';
import 'package:omiga/app/modules/category/controllers/category_controller.dart';
import 'package:omiga/app/modules/details/controllers/details_controller.dart';
import 'package:omiga/app/modules/home/controllers/home_controller.dart';

class BottombarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(
      () => MainPageController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<CategoryController>(
      () => CategoryController(),
    );
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}
