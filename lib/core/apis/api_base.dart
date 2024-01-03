import 'package:dio/dio.dart';

class ApiBase {
  ApiBase._();
  static ApiBase? _instance;

  factory ApiBase.getInstance() {
    _instance ??= ApiBase._();
    return _instance!;
  }
  static final _dio = Dio();
  Future<Response> getRequest({
    required String path,
  }) async {
    var response = _dio.get(path);
    return response;
  }
}
