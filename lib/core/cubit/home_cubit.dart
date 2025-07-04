import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_services.dart';
import 'package:market/models/product_model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final ApiServices _apiServices = ApiServices();

  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(GetDataLoading());
    try {
      Response response = await _apiServices.getData(
        "products_table?select=*,favorite_product(*),purchase_table(*)",
      );
      for (var product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetDataError());
    }
  }
}
