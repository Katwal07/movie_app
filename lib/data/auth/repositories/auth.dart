import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/error/app_error.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/auth/sources/auth_local_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<AppError, dynamic>> signup(SignupReqParams params) async {
    Either returnedData = await sl<AuthApiService>().signup(params);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<Either> signin(SigninReqParams params) async {
    Either returnedData = await sl<AuthApiService>().signin(params);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) async{
      SharedPreferences sharedPreferences =await SharedPreferences.getInstance();
      sharedPreferences.setString('token', data['user']['token']);
      return Right(data);
    });
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }
}
