import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/button/button_cubit.dart';
import 'package:movie_app/data/auth/models/signin_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signin_usecase.dart';
import 'package:movie_app/service_locator.dart';

import '../../../../../common/bloc/button/button_state.dart';
import '../../../../../core/configs/routes/routes_name.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          debugPrint('Current state: $state');
          if (state is ButtonLoadingState) {
            const CircularProgressIndicator();
          }
          if (state is ButtonSuccessState) {
            Navigator.pushNamed(context, RoutesName.homeScreen);
          }
          if(state is ButtonFailureState){
            debugPrint(state.message);
            var snackbar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);
          }
          const SizedBox();
        },
        child: Container(
          height: 300,
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailCon,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passCon,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Builder(builder: (context) {
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        context.read<ButtonCubit>().execute(
                          params: SigninReqParams(email: _emailCon.text, password: _passCon.text), 
                          usecase: sl<SigninUseCase>(),
                          );
                      },
                      child: const Text("Login"),
                    ),
                  );
                }),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.signupScreen);
                    },
                    child: const Text("Go to Signup"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
