import 'package:get/get.dart';

class OrderTrackingController extends GetxController {
  final RxInt currentStep = 1.obs;

  void updateStep(int step) {
    currentStep.value = step;
  }
}
