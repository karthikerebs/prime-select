import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:omiga/app/modules/cart/views/cart_view.dart';
import 'package:omiga/app/modules/favourite/views/favourite_view.dart';
import 'package:omiga/app/modules/home/views/home_view.dart';
import 'package:omiga/app/modules/profile/views/profile_view.dart';

class MainPageController extends GetxController {
  final RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  set selectedIndex(int value) => _selectedIndex.value = value;

  final List<Widget> pages = [
    HomeView(),
    CartView(),
    FavouriteView(),
    ProfileView(),
  ];

  // Add PageController
  final pageController = PageController();

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    // Animate to the selected page
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  // Add method to handle page changes from scroll
  void onPageChanged(int index) {
    selectedIndex = index;
  }
}
