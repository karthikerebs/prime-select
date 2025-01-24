import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omiga/app/core/constants/appcolors.dart';

class AppTheme {
  static final theme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: AppColor.black),
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
    textTheme: GoogleFonts.outfitTextTheme(
      ThemeData.light().textTheme.copyWith(
            titleLarge: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
            titleMedium: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColor.black),
            titleSmall: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColor.black),
            bodyLarge: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
            bodyMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w200,
                color: AppColor.black),
            bodySmall: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: AppColor.black),
            labelLarge: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
            labelMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black),
            labelSmall: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: AppColor.black),
            displayLarge: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColor.black),
            displayMedium: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColor.black),
            displaySmall: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w200,
                color: AppColor.black),
            headlineLarge: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
            headlineMedium: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.black),
            headlineSmall: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle:
            Get.textTheme.headlineMedium!.copyWith(color: AppColor.primary),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColor.textfieldColor,
      hintStyle:
          Get.textTheme.displayMedium!.copyWith(color: AppColor.hintTextColor),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: AppColor.grey, width: 1.5),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(53),
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(53),
        ),
        textStyle: Get.textTheme.headlineMedium,
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColor.grey,
    ),
  );
}
