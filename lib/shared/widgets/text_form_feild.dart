// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormFeild extends StatelessWidget {
  final TextInputType? keyboardType;

  final String hintText;
  final String labelText;
  final bool? isObscur;
  final Widget? suffixIcon;

  final TextEditingController? controller;

  const AppTextFormFeild({
    Key? key,
    this.keyboardType,
    required this.hintText,
    required this.labelText,
    this.isObscur,
    required this.suffixIcon,
    required this.controller,
  }) : super(key: key);

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
      obscureText: isObscur ?? false,
    );
  }
}
