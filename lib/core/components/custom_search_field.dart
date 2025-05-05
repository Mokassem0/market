import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Search in the Market",
        suffixIcon: ElevatedButton.icon(
          onPressed: () {},
          label: Icon(Icons.search, size: 25),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
            foregroundColor: AppColor.kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.kBordersideColor, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 138, 129, 129),
            width: 2,
          ),
        ),
      ),
    );
  }
}
