import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class LoginType extends StatelessWidget {
  const LoginType({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Text(
          "$text",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.kBlackColor,
          ),
        ),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: AppColor.kPrimaryColor,
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.arrow_forward, color: AppColor.kWhiteColor),
          ),
        ),
      ],
    );
  }
}
