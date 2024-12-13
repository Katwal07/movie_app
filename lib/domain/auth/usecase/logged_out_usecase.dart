import 'package:dartz/dartz.dart';

import '../../../core/error/app_error.dart';
import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repositories/auth.dart';

class LoggedOutUsecase implements Usecase<Either<AppError,dynamic>, dynamic> {
  @override
  Future<Either<AppError,dynamic>> call({dynamic params}) async{
    return await sl<AuthRepository>().loggedOut();
  }
}