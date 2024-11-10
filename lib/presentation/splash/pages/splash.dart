import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/presentation/splash/bloc/splash_cubit.dart';
import '../bloc/splash_state.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..appStarted(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if(state is UserAuthenticated){
            Navigator.pushNamed(context, RoutesName.navigation);
          }else if(state is UserUnAuthenticated){
            Navigator.pushNamed(context, RoutesName.loginScreen);
          }
        },
        child: Scaffold(
          backgroundColor: const Color(0xff242A32),
          body: Center(
            child: Image.asset("assets/images/splash_logo.png",
            height: 189.h,
            width: 189.w,
            ),
          ),
        ),
      ),
    );
  }
}
