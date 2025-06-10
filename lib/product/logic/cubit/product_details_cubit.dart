import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:market/core/api_services.dart';
import 'package:market/product/logic/models/rate_model.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  final ApiServices _apiServices = ApiServices();
  String userId = Supabase.instance.client.auth.currentUser!.id;
  List<RateModel> rates = [];

  int averageRate = 0;
  int userRate = 5;
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
      _getAverageRate();
      _getUserRate();
      emit(GetRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetRateError());
    }
  }

  void _getAverageRate() {
    for (var avgRate in rates) {
      if (avgRate.rates != null) {
        averageRate += avgRate.rates!;
      }
    }
    averageRate = (averageRate / rates.length).round();
  }

  void _getUserRate() {
    List<RateModel> userRate =
        rates.where((RateModel rate) {
          return rate.forUser == userId;
        }).toList();
    if (userRate.isNotEmpty) {
      this.userRate = userRate[0].rates!; // افترض أن القيمة الافتراضية هي 5
    }
  }

  bool _isUserRateExist({required String productId}) {
    for (var rate in rates) {
      if ((rate.forUser == userId) && (rate.forProduct == productId)) {
        return true;
      }
    }
    return false;
  }

  Future<void> addOrupdateRate({required String productId ,required Map<String,dynamic >data }) async {
    //path ثابت
    String path="rates_table?select=*&for_product=eq.$productId&for_user=eq.$userId";
    emit(addOrUpdateRateLoading());
    try {
      if (_isUserRateExist(productId: productId)) {
        //patch == update
        await _apiServices.patchData(
          path,
          data,
        );
      }else{
        await _apiServices.postData(
          path,
          data,
        );
      }
      emit(addOrUpdateRateSuccess());
    } catch (e) {
      log(e.toString());
      emit(addOrUpdateRateError());
    }
  }
}
