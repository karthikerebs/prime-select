import 'package:get/get.dart';
import 'package:omiga/app/routes/app_pages.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToOnboarding();
  }

  navigateToOnboarding() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.offAllNamed(Routes.ONBOARDING);
  }
}
