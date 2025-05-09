import 'package:flutter/material.dart';
import 'package:market/core/components/Custom_prodect_card.dart';
import 'package:market/core/components/function/AppBar.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "My Orders"),
      body: ListView.builder(
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
    );
  }
}
