import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class CustomRowCardBtn extends StatelessWidget {
  const CustomRowCardBtn({super.key, this.title, this.icon, this.onTap});
  final void Function()? onTap;
  final String? title;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: AppColor.kPrimaryColor,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, color: AppColor.kWhiteColor),
              Text(
                "$title",
                style: TextStyle(
                  color: AppColor.kWhiteColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: AppColor.kWhiteColor),
            ],
          ),
        ),
      ),
    );
  }
}
