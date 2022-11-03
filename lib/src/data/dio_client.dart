import 'package:clean_base/src/core/constants/constants.dart';
import 'package:dio/dio.dart';

class DioClient {
  Dio _dio = Dio();

  static final DioClient _apiServiceManager = DioClient._internal();

  factory DioClient() {
    BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: Constants.dioConnectionTimeOut,
      receiveTimeout: Constants.dioConnectionTimeOut,
      sendTimeout: Constants.dioConnectionTimeOut,
    );
    _apiServiceManager._dio = Dio(options);
    return _apiServiceManager;
  }

  DioClient._internal();

  Future<Response> get(
    String path, {
    Map<String, String?>? query,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("getRequest => : $path + ${query.toString()}");
      print(":BODY => : $query ");
      Response response = await _dio.get(
        path,
        queryParameters: query,
        options: _getRequestOptions(useAuthorize),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? body,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("postRequest => : $path ");
      print(":BODY => : $body ");
      Response response = await _dio.post(
        path,
        data: body,
        options: _getRequestOptions(useAuthorize),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? body,
    bool useAuthorize = false,
  }) async {
    // await Future.delayed(const Duration(milliseconds: 200));
    try {
      print("putRequest => : $path ");
      Response response = await _dio.put(
        path,
        data: body,
        options: _getRequestOptions(useAuthorize),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Options? _getRequestOptions(bool useAuthorize) {
    if (!useAuthorize) return null;
    return Options(
      headers: {
        "Authorization": "Bearer ${123}",
      },
    );
  }
}
