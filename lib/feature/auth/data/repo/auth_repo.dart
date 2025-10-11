import 'dart:developer';

import 'package:bookia/core/services/dio/api_endpoints.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/feature/auth/data/models/auth_params.dart';
import 'package:bookia/feature/auth/data/models/auth_response/auth_response.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<AuthResponse?> register(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.register,
        data: params.toJson(),
      );
      if (res.statusCode == 201) {
        var body = res.data;
        return AuthResponse.fromJson(body);
        //sucess
      } else {
        //error
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(AuthParams params) async {
    try {
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.login,
        data: params.toJson(),
      );
      if (res.statusCode == 200) {
        var body = res.data;
        return AuthResponse.fromJson(body);
        //sucess
      } else {
        //error
        return null;
      }
    } on DioException catch (e) {
      print('Status Code: ${e.response?.statusCode}');
      print('Error Data: ${e.response?.data}');
      print('Request Data: ${e.requestOptions.data}');
      return null;
    }
  }
}
