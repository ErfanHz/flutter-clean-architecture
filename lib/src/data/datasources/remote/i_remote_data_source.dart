import 'package:clean_base/src/data/models/api_response_model.dart';

abstract class IRemoteDataSource {
  Future<ReturnResponse> sendOtp(Map<String, String> query);
}
