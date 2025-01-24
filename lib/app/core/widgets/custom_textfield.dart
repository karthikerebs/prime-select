import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:omiga/app/core/constants/appcolors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final double width;
  final double radius;
  final int maxLength;
  final TextInputType keyboardType;
  final dynamic maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool isPassword;
  final String? prefixIcon;
  final double verticalMargin;
  final double horizontalMargin;
  final VoidCallback? onTap;
  final bool readOnly;
  final double? prefixIconConstraintsMaxHeight;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    this.width = double.infinity,
    this.radius = 16,
    this.maxLength = 2000,
    this.keyboardType = TextInputType.text,
    this.maxLines,
    this.inputFormatters,
    this.validator,
    this.isPassword = false,
    this.prefixIcon,
    this.verticalMargin = 8,
    this.horizontalMargin = 0,
    this.onTap,
    this.readOnly = false,
    this.prefixIconConstraintsMaxHeight,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: widget.verticalMargin,
            horizontal: widget.horizontalMargin),
        child: TextFormField(
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          style:
              TextStyle(color: Theme.of(context).textTheme.bodyMedium!.color),
          controller: widget.controller,
          obscureText: widget.isPassword ? _obscureText : false,
          maxLines: widget.isPassword ? 1 : widget.maxLines,
          maxLength: widget.maxLength,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              suffixIconColor: AppColor.grey,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      icon: Icon(
                        _obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        size: 18,
                      ),
                    )
                  : null,
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SvgPicture.asset(
                        widget.prefixIcon!,
                        height: 14,
                      ),
                    )
                  : null,
              prefixIconConstraints: BoxConstraints(
                maxHeight: widget.prefixIconConstraintsMaxHeight ?? 40,
              ),
              hintText: widget.hintText,
              hintStyle: Get.textTheme.labelLarge!.copyWith(
                color: AppColor.hintTextColor,
              ),
              counter: const Offstage()),
          validator: widget.validator,
        ),
      ),
    );
  }
}
