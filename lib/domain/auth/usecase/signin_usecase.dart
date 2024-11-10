import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/service_locator.dart';

import '../../../data/auth/models/signin_req_params.dart';

class SigninUseCase implements Usecase<Either, SigninReqParams> {
  @override
  Future<Either> call({SigninReqParams ? params}) async{
    return await sl<AuthRepository>().signin(params!);
  }
}