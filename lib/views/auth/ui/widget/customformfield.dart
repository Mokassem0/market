import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.labelText,
    this.isPassword = false,
    this.keybordType,
  });
  final String? hintText;
  final Widget? suffixIcon;
  final String? labelText;
  final bool isPassword;
  final TextInputType? keybordType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscuringCharacter: "*",
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      keyboardType: keybordType,
      decoration: InputDecoration(
        labelText: "$labelText",
        hintText: "$hintText",
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColor.kBordersideColor, width: 1),
        ),
      ),
    );
  }
}
