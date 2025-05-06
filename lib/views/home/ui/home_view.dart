import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/core/components/custom_search_field.dart';
import 'package:market/views/home/ui/widget/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          CustomSearchField(),
          SizedBox(height: 20),
          Image.asset("assets/images/buy.jpg"),
          SizedBox(height: 15),
          Text(
            "Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          CategoriesList(),
        ],
      ),
    );
  }
}
