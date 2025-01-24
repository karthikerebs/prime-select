import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Image.asset(Images.logo),
      ),
    );
  }
}
