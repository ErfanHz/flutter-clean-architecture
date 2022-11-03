import 'package:clean_base/src/data/failure.dart';
import 'package:clean_base/src/data/models/auth/send_otp_model.dart';
import 'package:dartz/dartz.dart';

abstract class IAuthRepository {
  Future<Either<Failure, SendOtpResponseModel>> sendOtp(
      Map<String, String> query);
}
