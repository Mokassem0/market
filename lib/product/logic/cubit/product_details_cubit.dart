import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_services.dart';
import 'package:market/product/logic/models/rate_model.dart';
import 'package:meta/meta.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();

  List<RateModel> rates = [];

  int averageRate = 0;

  Future<void> getRate({required String productId}) async {
    emit(GetRateLoading());
    try {
     Response response= await _apiServices.getData(
        "rates_table?select=*&for_proudct=eq.$productId",
      );
      for (var rate in response.data) {
        rates.add(RateModel.fromJson(rate));

      }
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }
}
