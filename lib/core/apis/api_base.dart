import 'package:dio/dio.dart';

class ApiBase {
  static final _dio = Dio();
  static Future<Response> getRequest({
    required String path,
  }) async {
    var response = _dio.get(path);
    return response;
  }
}
