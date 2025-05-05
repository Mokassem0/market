import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/custom_search_field.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(),
        ],
      ),
    );
  }
}
