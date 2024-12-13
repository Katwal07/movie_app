import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/bloc/generic/generic_cubit.dart';
import '../../../common/bloc/generic/generic_state.dart';
import 'heading.dart';
import 'movie_page_view/movie_page_view.dart';

class TrendingMovies extends StatelessWidget {
  const TrendingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit, GenericDataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DataLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20.h,
              ),
              const HeadingText(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  Text(
                    "Trending 🔥🔥",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              MoviePageView(
                movies: state.data,
                initialPage: state.defaultIndex ?? 0,
              ),
            ],
          );
        }
        if (state is FailureDataLoad) {
          return Center(
              child: Text(
            state.appError.displayMessage,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Colors.white),
          ));
        }
        return Container();
      },
    );
  }
}
