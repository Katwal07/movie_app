import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/bloc/button/button_cubit.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/presentation/auth/pages/signup/widgets/signup_form.dart';

import '../../../../common/bloc/button/button_state.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if(state is ButtonLoadingState){
            const CircularProgressIndicator();
          }
          if(state is ButtonSuccessState){
            Navigator.pushNamed(context, RoutesName.loginScreen);
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: SvgPicture.asset(AppVectors.splashVector),
                  ),
                  SignupForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
