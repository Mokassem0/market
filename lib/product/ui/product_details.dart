import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market/core/components/function/AppBar.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Product Name"),
      body: ListView(
        children: [
          Image.network(
            "https://img.freepik.com/free-photo/modern-comfortable-workplace-home-there-are-computer-laptop-table_613910-13268.jpg?ga=GA1.1.164920025.1746638074&semt=ais_hybrid&w=740",
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Name", style: TextStyle(fontSize: 18)),
                    Text("\$100", style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("3 "),
                        Icon(Icons.star, color: Colors.amber),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Center(
                  child: Text(
                    "Product Description",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder:
                      (context, _) => Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
