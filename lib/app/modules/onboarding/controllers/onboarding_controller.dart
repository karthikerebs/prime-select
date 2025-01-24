import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final pageController = PageController();
  final currentPage = 0.obs;

  void updateCurrentPage(int index) {
    currentPage.value = index;
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
