import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/bloc/generic/generic_state.dart';
import 'package:movie_app/common/helper/message/message.dart';
import 'package:movie_app/common/widgets/app_bar/app_bar.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movie_usecase.dart';
import 'package:movie_app/presentation/home/bloc/movie_category/movie_tab_index_cubit.dart';
import 'package:movie_app/presentation/home/bloc/movie_category/movie_tab_index_state.dart';
import 'package:movie_app/presentation/home/widgets/movie_tab/movie_tabbed_widget.dart';
import 'package:movie_app/presentation/home/widgets/trending_movie.dart';
import 'package:movie_app/service_locator.dart';

import '../../drawer/navigation_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              GenericCubit()..execute(sl<GetTrendingMovieUseCase>()),
        ),
        BlocProvider(create: (context) => MovieTabIndexCubit()),
      ],
      child: BlocListener<GenericCubit, GenericDataState>(
        listener: (context, state) {
          if (state is FailureDataLoad) {
            ShowSnackbar.displayMessage(
                context, state.appError.displayMessage, Colors.red);
          }
        },
        child: Scaffold(
            key: _scaffoldKey,
          appBar: BasicAppBar(
            height: 20.h,
            hideback: false,
            containerColor: const Color(0xff242A32),
            leading: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  icon: Transform.scale(
                    scale: 4,
                    child: SvgPicture.asset(
                      AppVectors.menu,
                    ),
                  ),
                );
              }
            ),
          ),
          drawer: const AppDrawer(),
          backgroundColor: const Color(0xff242A32),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  /// Trending Movies
                  const FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: TrendingMovies()),

                  /// Category Movies
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: BlocBuilder<MovieTabIndexCubit, MovieTabIndexState>(
                      builder: (context, state) {
                        if (state is MovieTabLoadingState) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (state is MovieTabLoadedState) {
                          return MovieTabbedWidget(
                              selectedTabIndex: state.currentTab,
                              onTabSelected: (index) {
                                context
                                    .read<MovieTabIndexCubit>()
                                    .setCurrentTab(index);
                              },
                              tabData: state.tabData);
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
