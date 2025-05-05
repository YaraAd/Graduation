import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  final Dio dio;
  Api({required this.dio});
  Future<dynamic> get(
      {required String url, String? token, Options? options}) async {
    try {
      Map<String, String> header = {};
      if (token != null) {
        header.addAll({
          'Authorization': 'Bearer $token',
        });
      }

      final response = await dio.get(url,
          options: Options(
            headers: header,
          ));
      if (response.statusCode == 200) {
        print("api is working");
        return response.data;
      } else {
        throw Exception('error in status code${response.statusCode}');
      }
    } catch (e) {
      throw Exception('error to fetch data $e');
    }
  }

  Future<dynamic> post({
    required String url,
    dynamic? body,
    String? token,
  }) async {
    Map<String, String> header = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response = await dio.post(url,
        data: jsonEncode(body),
        options: Options(
          headers: header,
        ));
    if (response.statusCode == 200) {
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else {
        return jsonDecode(response.data);
      }
    } else {
      throw Exception(
          'error in status code${response.statusCode}  with body ${response.data}');
    }
  }

  Future<dynamic> delete({
    required String url,
    dynamic? body,
    String? token,
  }) async {
    Map<String, String> header = {
      'accept': '*/*',
      'Content-Type': 'application/json',
    };
    if (token != null) {
      header.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    Response response = await dio.delete(
      url,
      data: body != null ? jsonEncode(body) : null,
      options: Options(
        headers: header,
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 204) {
      if (response.data is Map<String, dynamic>) {
        return response.data;
      } else if (response.data is String && response.data.isNotEmpty) {
        return jsonDecode(response.data);
      }
      return null;
    } else {
      throw Exception(
          'error in status code ${response.statusCode} with body ${response.data}');
    }
  }
}
