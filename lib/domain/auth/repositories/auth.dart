import 'package:dartz/dartz.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/entity/user.dart';

import '../../../core/error/app_error.dart';
import '../../../data/auth/models/signin_req_params.dart';

abstract class AuthRepository{
  Future<Either<AppError, UserEntity>> signup(SignupReqParams params);
  Future<Either<AppError, UserEntity>> signin(SigninReqParams params);
  Future<bool> isLoggedIn();
  Future<Either<AppError, dynamic>> loggedOut();
}