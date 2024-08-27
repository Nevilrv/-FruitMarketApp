import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class TsField extends StatelessWidget {
  final String? labelText;
  final Color? fillColor;
  final Widget? suffix;
  final TextInputAction? action;
  final IconData? icon;
  final FormFieldValidator validator;
  final TextEditingController controller;
  final bool hide;
  final TextInputType? keyboardType;
  final int? length;
  final TextAlign align;
  final Widget? prefix;
  final TextInputAction? inputAction;

  final BorderRadius? border;

  const TsField({
    Key? key,
    this.icon,
    required this.validator,
    required this.controller,
    required this.hide,
    this.keyboardType,
    this.length,
    this.action,
    this.align = TextAlign.start,
    this.prefix,
    this.border,
    this.fillColor,
    required this.labelText,
    this.inputAction,
    this.suffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      textAlign: align,
      obscureText: hide,
      maxLength: length,
      textInputAction: inputAction,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.h),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10.h),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.h),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.h),
            borderSide: const BorderSide(color: Colors.red),
          ),
          counter: Offstage(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.h),
          labelText: labelText,
          suffixIcon: suffix),
    );
  }
}
