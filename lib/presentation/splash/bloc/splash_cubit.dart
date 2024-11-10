import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/auth/usecase/is_loggedin_usecase.dart';
import 'package:movie_app/presentation/splash/bloc/splash_state.dart';
import 'package:movie_app/service_locator.dart';

class SplashCubit extends Cubit<SplashState>{
  SplashCubit(): super(DisplaySplash());

  void appStarted() async{
    await Future.delayed(const Duration(seconds: 3));

    bool returnedData = await sl<IsLoggedinUsecase>().call();
    if(returnedData == true){
      emit(UserAuthenticated());
    }else{
      emit(UserUnAuthenticated());
    }
  }
}