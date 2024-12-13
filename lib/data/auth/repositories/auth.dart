import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/error_mapper.dart';
import 'package:movie_app/common/helper/mapper/user_mapper.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/auth/sources/auth_local_service.dart';
import 'package:movie_app/domain/auth/entity/user.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/app_error.dart';
import '../models/signup_req_params.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either<AppError, UserEntity>> signup(SignupReqParams params) async {
    Either returnedData = await sl<AuthApiService>().signup(params);
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      final user = UserMapper.toEntity(data);
      return Right(user);
    });
  }

  @override
  Future<Either<AppError,UserEntity>> signin(SigninReqParams params) async {
    Either returnedData = await sl<AuthApiService>().signin(params);
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) async{
      final user = UserMapper.toEntity(data);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      sharedPreferences.setString('token',user.token);
      return Right(user);
    });
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }
  
  @override
  Future<Either<AppError, dynamic>> loggedOut() async{
     Either returnedData = await sl<AuthApiService>().loggedOut();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) async{
      return Right(data);
    });
  }
}
