import 'package:get/get.dart';

import '../controllers/help_and_support_controller.dart';

class HelpAndSupportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HelpAndSupportController>(
      () => HelpAndSupportController(),
    );
  }
}
