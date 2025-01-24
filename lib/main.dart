import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:omiga/app/core/constants/themes.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/splash/bindings/splash_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      theme: AppTheme.theme,
    ),
  );
}
