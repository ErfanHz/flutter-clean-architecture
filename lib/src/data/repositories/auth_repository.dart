import 'package:clean_base/src/core/constants/messages.dart';
import 'package:clean_base/src/data/datasources/remote/remote_data_source.dart';
import 'package:clean_base/src/data/failure.dart';
import 'package:clean_base/src/data/models/auth/send_otp_model.dart';
import 'package:clean_base/src/domain/repositories/i_auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class AuthRepository implements IAuthRepository {
  RemoteDataSource remoteDataSource = RemoteDataSource();

  @override
  Future<Either<Failure, SendOtpResponseModel>> sendOtp(
    Map<String, String> query,
  ) async {
    try {
      final result = await remoteDataSource.sendOtp(query);
      if (result.isOkStatus) {
        return Right(SendOtpResponseModel.fromJson(result.data));
      } else {
        return Left(Failure(ApplicationMessages.internalError));
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.data == 'otp cannot deliverd.') {
          return Left(Failure(ApplicationMessages.otpCodeNotDelivered));
        }
      }
      return Left(Failure(remoteDataSource.handleErrorException(e)));
    }
  }

}
