import 'package:flutter/material.dart';
import 'package:market/core/app_color.dart';
import 'package:market/product/ui/product_details.dart';

class CutomProductCard extends StatelessWidget {
  const CutomProductCard({
    super.key,
    required this.imgUrl,
    required this.productName,
    required this.productPrice,
    required this.productDiscountPrice,
  });
  final String imgUrl;
  final String productName;
  final String productPrice;
  final String productDiscountPrice;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => ProductDetails()));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          children: [
            SizedBox(height: 10),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: Image.network(imgUrl),
                ),
                Positioned(
                  child: Container(
                    width: 65,
                    height: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                    ),
                    child: Text(
                      "10% off",
                      style: TextStyle(color: AppColor.kWhiteColor),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        " $productName",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite, color: AppColor.kGreyColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "$productPrice",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Text(
                            "$productDiscountPrice",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: AppColor.kGreyColor,
                            ),
                          ),
                        ],
                      ),
                      MaterialButton(
                        height: 40,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {},
                        child: Text("Buy Now"),
                        color: AppColor.kPrimaryColor,
                        textColor: AppColor.kWhiteColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
