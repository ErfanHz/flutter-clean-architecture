import 'package:clean_base/src/data/failure.dart';
import 'package:clean_base/src/data/models/auth/send_otp_model.dart';
import 'package:clean_base/src/data/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SendOtpUseCase {
  AuthRepository repository = AuthRepository();

  Future<Either<Failure, SendOtpResponseModel>> execute(
    Map<String, String> query,
  ) {
    return repository.sendOtp(query);
  }
}
