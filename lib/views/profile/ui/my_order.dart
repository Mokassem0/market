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
            product: null, 
          );
        },
      ),
    );
  }
}
