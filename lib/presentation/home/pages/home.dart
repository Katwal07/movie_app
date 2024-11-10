import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/home/bloc/now_playing/now_playing_cubit.dart';
import 'package:movie_app/presentation/home/bloc/trending/trending_cubit.dart';
import 'package:movie_app/presentation/home/widgets/heading.dart';
import 'package:movie_app/presentation/home/widgets/movie_page_view.dart';
import 'package:movie_app/presentation/home/widgets/search_field.dart';

import '../bloc/now_playing/now_playing_state.dart';
import '../bloc/trending/trending_state.dart';
import '../widgets/now_playing_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingCubit()..getTrendingMovies(),
        ),
        BlocProvider(
          create: (context) => NowPlayingCubit()..getNowPlayingMovies(),
        ),
      ],
      child: Scaffold(
          backgroundColor: const Color(0xff242A32),
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.5,
                      child: BlocBuilder<TrendingCubit, TrendingState>(
                        builder: (context, state) {
                          if (state is TrendingStateLoading) {
                            return const CircularProgressIndicator();
                          }
                          if (state is TrendingStateLoaded) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                const HeadingText(),
                                SizedBox(
                                  height: 10.h,
                                ),
                                const SearchField(),
                                SizedBox(
                                  height: 30.h,
                                ),
                                MoviePageView(
                                  movies: state.movies,
                                  initialPage: state.defaultIndex,
                                ),
                              ],
                            );
                          }
                          if (state is TrendingStateFailure) {
                            return Center(child: Text(state.appError.displayMessage,style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),));
                          }
                          return Container();
                        },
                      ),
                    ),
                     FractionallySizedBox(
                      alignment: Alignment.bottomCenter,
                      heightFactor: 0.4,
                      child: BlocBuilder<NowPlayingCubit, NowPlayingState>(
                        builder: (context, state) {
                          if(state is NowPlayingStateLoading){
                            return const CircularProgressIndicator();
                          }
                         if(state is NowPlayingStateLoaded){
                           return Column(
                            children: [
                              NowPlayingMovieView(
                                movies: state.movies,
                              ),
                            ],
                          );
                         }
                         return Container();
                        },
                      ),
                    ),
                  ],
                )),
          )),
    );
  }
}
