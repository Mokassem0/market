  import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage(BuildContext context, String text) {
    return ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(text),
            backgroundColor: AppColor.kRedColor,
          ),
        );
  }