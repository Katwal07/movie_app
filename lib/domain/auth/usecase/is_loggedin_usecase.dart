import '../../../core/usecase/usecase.dart';
import '../../../service_locator.dart';
import '../repositories/auth.dart';

class IsLoggedinUsecase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async{
    return await sl<AuthRepository>().isLoggedIn();
  }
}