import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/components/Custom_prodect_card.dart';
import 'package:market/core/components/custom_search_field.dart';
import 'package:market/core/cubit/home_cubit.dart';
import 'package:market/models/product_model/product_model.dart';
import 'package:market/views/home/ui/widget/categories_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

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
          SizedBox(height: 20),
          Image.asset("assets/images/buy.jpg"),
          SizedBox(height: 15),
          Text(
            "Categories",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15),
          CategoriesList(),
          SizedBox(height: 15),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Recently Added",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          BlocProvider(
            create: (context) => HomeCubit()..getProducts(),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                List<ProductModel> products = context.read<HomeCubit>().products;
                return state is GetDataLoading?Center(child: CircularProgressIndicator(),): ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return CutomProductCard(
                      imgUrl:
                          "https://img.freepik.com/free-photo/modern-comfortable-workplace-home-there-are-computer-laptop-table_613910-13268.jpg?ga=GA1.1.164920025.1746638074&semt=ais_hybrid&w=740",
                      productName: "Product Name",
                      productPrice: "\$100",
                      productDiscountPrice: "\$90",
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
