import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class Custom_Material_Button extends StatelessWidget {
  const Custom_Material_Button({
    super.key, this.text, this.onPressed,
  });
  final String? text;
  final Function ()? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: AppColor.kPrimaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 25,
      ),
      child: Text(
        "$text",
        style: TextStyle(
          color: AppColor.kWhiteColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
