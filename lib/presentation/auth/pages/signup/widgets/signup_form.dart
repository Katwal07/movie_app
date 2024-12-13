import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/helper/message/message.dart';
import 'package:movie_app/common/widgets/reactive_app_button/reactive_app_button.dart';
import 'package:movie_app/core/constant/app_string.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signup_usecase.dart';
import 'package:movie_app/service_locator.dart';
import '../../../../../common/bloc/generic/generic_state.dart';
import '../../../../../core/configs/routes/routes_name.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<GenericCubit, GenericDataState>(
      listener: (context, state) {
        if (state is DataLoading) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is DataLoaded) {
          Navigator.pushNamedAndRemoveUntil(
              context, RoutesName.loginScreen, (route) => false);
        }
        if (state is FailureDataLoad) {
          ShowSnackbar.displayMessage(
              context, state.appError.displayMessage, Colors.red);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 60.w),
        child: Container(
          height: 350.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: const Color(0xff242A32), width: 3.w)
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: _emailCon,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: AppString.email,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.r),
                            ),
                            borderSide: const BorderSide(color: Colors.white)),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextField(
                      controller: _passCon,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        hintText: AppString.password,
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r),),),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Builder(builder: (context) {
                      return SizedBox(
                        width: double.infinity,
                        height: 50.h,
                        child: BasicReactiveButton(
                       
                          onPressed: () {
                            context.read<GenericCubit>().execute(
                                  sl<SignupUseCase>(),
                                  params: SignupReqParams(
                                    email: _emailCon.text,
                                    password: _passCon.text,
                                  ),
                                );
                          }, title: AppString.signup,
                         
                        ),
                      );
                    }),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff242A32),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, RoutesName.loginScreen);
                        },
                        child: const Text(
                          AppString.goToLogin,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
