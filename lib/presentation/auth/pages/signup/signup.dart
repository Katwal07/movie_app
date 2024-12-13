import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/widgets/app_bar/app_bar.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/presentation/auth/pages/signup/widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit(),
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.authPicture),
          ),
        ),
        child: Scaffold(
          appBar: BasicAppBar(
            containerColor: Colors.white,
            hideback: false, height: 80.h,),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Center(
              child: Center(child: SignupForm()),
            ),
          ),
        ),
      ),
    );
  }
}
