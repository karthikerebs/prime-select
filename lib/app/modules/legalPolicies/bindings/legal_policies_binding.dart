import 'package:get/get.dart';

import '../controllers/legal_policies_controller.dart';

class LegalPoliciesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LegalPoliciesController>(
      () => LegalPoliciesController(),
    );
  }
}
