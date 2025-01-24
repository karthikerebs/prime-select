import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/modules/bottombar/controllers/bottombar_controller.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final MainPageController controller = Get.put(MainPageController());

  @override
  Widget build(BuildContext context) {
    // Handle initialIndex if provided
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      final initialIndex = args['initialIndex'] as int?;
      if (initialIndex != null) {
        controller.selectedIndex = initialIndex;
      }
    }

    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: controller.onPageChanged,
        children: controller.pages,
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Theme(
      data: Theme.of(Get.context!).copyWith(
        canvasColor: AppColor.white,
      ),
      child: Obx(() => BottomNavigationBar(
            backgroundColor: AppColor.white,
            selectedFontSize: 10,
            unselectedFontSize: 10,
            selectedLabelStyle: _NavigationBarStyles.activeStyle,
            unselectedLabelStyle: _NavigationBarStyles.inactiveStyle,
            currentIndex: controller.selectedIndex,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: controller.onItemTapped,
            items: _buildNavigationBarItems(),
          )),
    );
  }

  List<BottomNavigationBarItem> _buildNavigationBarItems() {
    return [
      _buildNavigationBarItem('home', 'Home'),
      _buildNavigationBarItem('cart', 'Cart'),
      _buildNavigationBarItem('fav', 'Favorites'),
      _buildNavigationBarItem('profile', 'Profile'),
    ];
  }

  BottomNavigationBarItem _buildNavigationBarItem(String asset, String label) {
    return BottomNavigationBarItem(
      icon: _buildIcon(asset, label, isActive: false),
      activeIcon: _buildIcon(asset, label, isActive: true),
      label: '',
    );
  }

  Widget _buildIcon(String asset, String label, {required bool isActive}) {
    final color = isActive ? AppColor.primary : AppColor.grey;
    final style = isActive
        ? _NavigationBarStyles.activeStyle
        : _NavigationBarStyles.inactiveStyle;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(10),
        SvgPicture.asset(
          'assets/${asset}_${isActive ? 'active' : 'inactive'}.svg',
          colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: style,
          textAlign: TextAlign.center,
          softWrap: true,
        ),
      ],
    );
  }
}

class _NavigationBarStyles {
  static final TextStyle activeStyle = Get.textTheme.headlineSmall!.copyWith(
    color: AppColor.primary,
  );

  static final TextStyle inactiveStyle = Get.textTheme.headlineSmall!.copyWith(
    color: AppColor.grey,
  );
}
