import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/bloc/generic/generic_state.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget? content;
  final double? width;
  final double? height;
  const BasicReactiveButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.content,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericDataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return _loading(context);
        }
        return _loaded(context);
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
          minimumSize:
              Size(width ?? MediaQuery.of(context).size.width, height ?? 80)),
      child: const CircularProgressIndicator(),
    );
  }

  Widget _loaded(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff242A32),
        minimumSize:
            Size(width ?? MediaQuery.of(context).size.width, height ?? 80),
      ),
      child: content ??
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: Colors.white),
          ),
    );
  }
}
