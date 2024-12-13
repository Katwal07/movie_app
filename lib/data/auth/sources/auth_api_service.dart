import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error_handler.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/data/auth/models/user.dart';
import 'package:movie_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/api_urls.dart';

abstract class AuthApiService {
  Future<Either<ErrorState, UserModel>> signup(SignupReqParams params);
  Future<Either<ErrorState,UserModel>> signin(SigninReqParams params);
  Future<Either<ErrorState, dynamic>> loggedOut();
}

class AuthApiServiceImpl extends AuthApiService{
  @override
  Future<Either<ErrorState, UserModel>> signin(SigninReqParams params) async{
   return await ErrorHandler.callApi(
    ()=> sl<DioClient>().postRequest(ApiUrl.signin,data: params.toMap()), 
    (data)=> UserModel.fromMap(data['user']),
  );
  }

  @override
  Future<Either<ErrorState,UserModel>> signup(SignupReqParams params) async{
     return await ErrorHandler.callApi(
      ()=> sl<DioClient>().postRequest(ApiUrl.signup,data: params.toMap()), 
      (data)=> UserModel.fromMap(data['user']),
    );
  }
  
  @override
  Future<Either<ErrorState, dynamic>> loggedOut() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().postRequest(ApiUrl.logout), 
      (data)=> data,
    );
  }
}