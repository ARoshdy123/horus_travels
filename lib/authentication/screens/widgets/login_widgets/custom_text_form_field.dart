import 'package:flutter/material.dart';

class CTextFormField extends StatelessWidget {
  const CTextFormField({
    super.key,
    required this.controller,  this.obscureText = false, required this.labelText, required this.prefixIcon,  this.suffixIcon,  this.keyboardType,
  });
final bool? obscureText ;
final String labelText;
  final Icon prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
        obscureText: obscureText!,
        keyboardType: keyboardType,
      decoration:  InputDecoration(
        border: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Color(0xFFE0E0E0)),
        ),
        focusedBorder:const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Color(0xFF272727)),
        ),
        errorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 1, color: Color(0xFFF57C00)),
        ),
        focusedErrorBorder: const OutlineInputBorder().copyWith(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(width: 2, color: Color(0xFFF57C00)),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,

        labelText: labelText,
      ),
    );
  }
}