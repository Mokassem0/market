import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColor.kPrimaryColor,
                  foregroundColor: AppColor.kWhiteColor,
                  child: Icon(categories[index].icon, size: 30),
                ),

                Text(categories[index].name),
              ],
            ),
          );
        },
      ),
    );
  }
}

List<Category> categories = [
  Category(icon: Icons.sports, name: "Sports"),
  Category(icon: Icons.tv, name: "Electronics"),
  Category(icon: Icons.collections, name: "Collections"),
  Category(icon: Icons.book, name: "Books"),
  Category(icon: Icons.games, name: "Games"),
  Category(icon: Icons.bike_scooter, name: "Bikes"),
];

class Category {
  final IconData icon;
  final String name;

  Category({required this.icon, required this.name});
}
