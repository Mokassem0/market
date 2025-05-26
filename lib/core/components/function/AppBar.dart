import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

AppBar buildCustomAppBar(BuildContext context, String title) {
  return AppBar(
    centerTitle: true,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back_ios_new, color: AppColor.kWhiteColor),
      onPressed: () {
        Navigator.of(context).pop();
      },
    ),
    title: Text('$title', style: TextStyle(color: AppColor.kWhiteColor)),
    backgroundColor: AppColor.kPrimaryColor,
  );
}
