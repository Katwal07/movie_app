import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/widgets/app_bar/app_bar.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.authPicture),),
        ),
        child: Scaffold(
          appBar: BasicAppBar(
            containerColor: Colors.white,
            hideback: true,height: 70.h,),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Center(child: LoginForm()),
            ),
          ),
        ),
      ),
    );
  }
}
