import 'package:flutter/material.dart';
import 'package:market/core/components/Custom_prodect_card.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Center(
            child: Text(
              "Your Favorite Products",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),

          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) {
              return CutomProductCard(
                product: null, 
              );
            },
          ),
        ],
      ),
    );
  }
}
