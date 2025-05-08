import 'package:flutter/material.dart';
import 'package:market/core/components/Custom_prodect_card.dart';
import 'package:market/core/components/custom_search_field.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Welcome to Mo Market",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          CustomSearchField(),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CutomProductCard(
                imgUrl:
                    "https://img.freepik.com/free-photo/modern-comfortable-workplace-home-there-are-computer-laptop-table_613910-13268.jpg?ga=GA1.1.164920025.1746638074&semt=ais_hybrid&w=740",
                productName: "Product Name",
                productPrice: "\$100",
                productDiscountPrice: "\$90",
              );
            },
          ),
        ],
      ),
    );
  }
}
