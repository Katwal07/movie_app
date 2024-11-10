import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/button/button_cubit.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/data/auth/models/signup_req_params.dart';
import 'package:movie_app/domain/auth/usecase/signup_usecase.dart';
import 'package:movie_app/service_locator.dart';

class SignupForm extends StatelessWidget {
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Builder(
              builder: (context) {
                return SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      context.read<ButtonCubit>().execute(
                       params:  SignupReqParams(
                          email: _emailCon.text, 
                          password: _passCon.text
                          ),
                          usecase:  sl<SignupUseCase>()
                          );
                    },
                    child: const Text("Signup"),
                  ),
                );
              }
            ),

            const SizedBox(
              height: 20,
            ),

                 SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesName.loginScreen);
                    },
                    child: const Text("Go to Login"),
                  ),
                ),
         
          ],
        ),
      ),
    );
  }
}
