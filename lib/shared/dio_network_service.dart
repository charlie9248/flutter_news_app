import 'package:dio/dio.dart';
import 'package:news_app/constants/app_constants.dart';
import 'package:news_app/shared/network_service.dart';



class DioNetworkService extends   NetworkService {


  late Dio dio;

  DioNetworkService() {
    dio = Dio();
    dio.options = dioBaseOptions;
    dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));

  }

  BaseOptions get dioBaseOptions => BaseOptions(
      baseUrl: baseUrl,
      headers: headers,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20));


  @override
  String get apiKey => AppConstants.apiKey;

  @override
  String get baseUrl => AppConstants.baseUrl;

  @override
  Map<String, Object> get headers => {
    'accept': 'application/json',
    'content-type': 'application/json',
  };

  @override
  Future<Response> get(String endPoint, {Map<String, dynamic>? queryParams}) async {

    try{
      final res = await dio.get(endPoint, queryParameters: queryParams);
      return res;
    }
    catch(e){
      print(e);
      print(e);
      rethrow;
    }
  }

}
