import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFeild extends StatelessWidget {
  final TextInputType? keyboardType;

  final String hintText;
  final String labelText;

  final Widget? suffixIcon;

  final TextEditingController? controller;

  const AppTextFormFeild({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType,
    required this.suffixIcon,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 1.w),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
