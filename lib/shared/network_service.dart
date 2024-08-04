import 'package:dio/dio.dart';

abstract class NetworkService {
  String get baseUrl;

  String get apiKey;

  Map<String, Object> get headers;

  Future<Response> get(
      String endPoint, {
        Map<String, dynamic>? queryParams,
      });
}