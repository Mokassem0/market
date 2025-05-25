import 'package:dio/dio.dart';
import 'package:market/core/sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "https://vloghozftpjfwiypbtup.supabase.co/rest/v1/",
      headers: {"apikey": anonKey},
    ),
  );
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }
  //استخدمنا path كمسار للطلب Map<String, dynamic> data ارسال بيانات
  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }
  Future<Response> patchData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }
  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
