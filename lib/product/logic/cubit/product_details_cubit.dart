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
Future<void> getRate({required String productid}) async {
  emit(GetRateLoading());
  rates.clear();
  averageRate = 0;
  try {
    Response response = await _apiServices.getData(
      "rates_table?select=*&for_product=eq.$productid", // صحح اسم العمود هنا
    );
    for (var rate in response.data) {
      rates.add(RateModel.fromJson(rate));
    }
    for (var userRate in rates) {
      if (userRate.rates != null) {
        averageRate += userRate.rates!;
      }
    }
    if (rates.isNotEmpty) {
      averageRate = (averageRate / rates.length).round();
    } else {
      averageRate = 0;
    }
    log(averageRate.toString());
    emit(GetRateSuccess());
  } catch (e) {
    log(e.toString());
    emit(GetRateError());
  }
}
}
