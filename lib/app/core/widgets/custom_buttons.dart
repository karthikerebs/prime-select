import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';
import 'package:omiga/app/core/constants/images.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.hMargin = 0,
    this.vMargin = 16,
    this.buttonColor = AppColor.primary,
    this.buttonHeight = 60,
  });

  final VoidCallback onTap;
  final String title;
  final bool isLoading;
  final double hMargin;
  final double vMargin;
  final Color buttonColor;
  final double buttonHeight;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: buttonHeight,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
        ),
        child: isLoading
            ? SpinKitThreeBounce(
                color: Get.theme.colorScheme.secondary, size: 20)
            : Text(title,
                style:
                    Get.textTheme.labelMedium!.copyWith(color: AppColor.white)),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.title,
    required this.onTap,
    this.isLoading = false,
    this.hMargin = 0,
    this.vMargin = 16,
    this.buttonColor = AppColor.grey,
    this.logo = Images.googleLogo,
    this.buttonHeight = 60,
  });
  final VoidCallback onTap;
  final String title;
  final bool isLoading;
  final double hMargin;
  final double vMargin;
  final Color buttonColor;
  final String logo;
  final double buttonHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: buttonHeight,
      margin: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      child: OutlinedButton(
        onPressed: isLoading ? null : onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: buttonColor),
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: isLoading
            ? SpinKitThreeBounce(
                color: Get.theme.colorScheme.secondary, size: 20)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    logo,
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 12),
                  Text(title,
                      style: Get.textTheme.labelMedium!
                          .copyWith(color: AppColor.black)),
                ],
              ),
      ),
    );
  }
}
