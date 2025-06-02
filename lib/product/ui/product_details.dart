import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market/core/components/function/AppBar.dart';
import 'package:market/models/product_model/product_model.dart';
import 'package:market/product/logic/cubit/product_details_cubit.dart';
import 'package:market/product/ui/widget/comments_list.dart';
import 'package:market/views/auth/ui/widget/customformfield.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key, this.products}) : super(key: key);
  final ProductModel? products;

  @override
  Widget build(BuildContext context) {
    // اطبع قيمة productId للتأكد أنها صحيحة وليست null
    print("productId: ${products?.productId}");

    return BlocProvider(
      create: (context) {
        // تحقق أن productId ليست null أو فارغة
        if (products?.productId == null || products!.productId.toString().isEmpty) {
          throw Exception("productId is null or empty!");
        }
        return ProductDetailsCubit()..getRate(
          productid: products!.productId.toString(), // تأكد من النوع String أو int حسب ما يتوقع السيرفر
        );
      },
      child: BlocConsumer<ProductDetailsCubit, ProductDetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          ProductDetailsCubit cubit = context.read<ProductDetailsCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(
              context,
              products?.productName ?? "Product Name",
            ),
            body: state is GetRateLoading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                        child: Image.network(
                          products?.imageUrl ??
                              "https://img.freepik.com/free-photo/modern-comfortable-workplace-home-there-are-computer-laptop-table_613910-13268.jpg?ga=GA1.1.164920025.1746638074&semt=ais_hybrid&w=740",
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  products?.productName ?? "Product Name",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${products?.price ?? "100"}\$",
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    if (products?.oldPrice != null)
                                      Text(
                                        "${products?.oldPrice}\$",
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                          decoration: TextDecoration.lineThrough,
                                        ),
                                      ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text("${cubit.averageRate ?? 0} "),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.favorite,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25),
                            Center(
                              child: Text(
                                products?.description ?? "No description available.",
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 16),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Center(
                              child: RatingBar.builder(
                                initialRating: (cubit.userRate!).toDouble(),
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: false,
                                itemCount: 5,
                                itemPadding: const EdgeInsets.symmetric(
                                  horizontal: 4.0,
                                ),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            const SizedBox(height: 40),
                            CustomTextFormField(
                              hintText: "Feedback",
                              labelText: "Type your Feedback",
                              suffixIcon: const Icon(Icons.send),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Comments",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            CommentList(),
                          ],
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}