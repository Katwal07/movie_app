import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/service_locator.dart';

import '../../../core/constant/api_urls.dart';

abstract class AuthApiService {
  Future<Either> signup(SignupReqParams params);
  Future<Either> signin(SigninReqParams params);
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either> signin(SigninReqParams params) async{
    try {
      var response = await sl<DioClient>().postRequest(
        ApiUrl.signin,
        data: params,
      );
      return Right(response.data);
    }on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

  @override
  Future<Either> signup(SignupReqParams params) async{
     try {
      var response = await sl<DioClient>().postRequest(
        ApiUrl.signup,
        data: params,
        );
      return Right(response.data);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }
  

}