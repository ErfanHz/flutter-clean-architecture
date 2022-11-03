import 'package:clean_base/src/core/constants/api_urls.dart';
import 'package:clean_base/src/core/constants/messages.dart';
import 'package:clean_base/src/data/datasources/remote/i_remote_data_source.dart';
import 'package:clean_base/src/data/dio_client.dart';
import 'package:clean_base/src/data/models/api_response_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource extends IRemoteDataSource {
  _checkResponse(Response resp, ReturnResponse returnResponse) async {
    try {
      final res = resp.data;

      returnResponse.statusCode = resp.statusCode;

      if (returnResponse.statusCode == 200) {
        returnResponse.data = res['data'];
        if (resp.data['pagination'] != null) {
          returnResponse.pagination =
              PaginationModel.fromJson(res['pagination']);
        }
      } else {
        if (res["message"] != null) {
          returnResponse.message = res["message"];
        }
      }
    } catch (e) {
      returnResponse.message = ApplicationMessages.unknownError;
    }
  }

  handleErrorException(error) {
    if (error is DioError) {
      if (error.type == DioErrorType.receiveTimeout ||
          error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout) {
        return ApplicationMessages.connectionTimeout;
      } else if (error.type == DioErrorType.other) {
        return ApplicationMessages.connectionFailed;
      } else if (error.response?.statusCode == 400) {
        return ApplicationMessages.badRequest;
      } else if (error.response?.statusCode == 404) {
        return ApplicationMessages.error404;
      }
    }
    return ApplicationMessages.unknownError;
  }

  @override
  Future<ReturnResponse> sendOtp(Map<String, String> query) async {
    try {
      ReturnResponse responseJson = ReturnResponse();
      final response = await DioClient().get(
        ApiUrls.sendOtp(),
        query: query,
      );
      _checkResponse(response, responseJson);
      return responseJson;
    } catch (e) {
      rethrow;
    }
  }
}
