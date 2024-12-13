import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/bloc/generic/generic_state.dart';
import 'package:movie_app/core/configs/assets/app_images.dart';
import 'package:movie_app/core/configs/assets/app_vectors.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/domain/auth/usecase/logged_out_usecase.dart';
import 'package:movie_app/presentation/drawer/bloc/drawer_cubit.dart';
import 'package:movie_app/presentation/drawer/navigation_list.dart';
import 'package:movie_app/service_locator.dart';

import 'bloc/drawer_state.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DrawerCubit(),
        ),
        BlocProvider(
          create: (context) => GenericCubit(),
        ),
      ],
      child: BlocListener<GenericCubit, GenericDataState>(
        listener: (context, state) {
          if(state is DataLoaded){
            Navigator.pushNamedAndRemoveUntil(context, RoutesName.loginScreen, (route)=> false);
          }
        },
        child: Container(
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: const Color(0xff242A32).withOpacity(0.7),
              blurRadius: 4,
            )
          ]),
          width: MediaQuery.of(context).size.width / 1.7,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
            child: BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                final currentIndex =
                    (state is DrawerItemClicked) ? state.currentIndex : 0;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppImages.logo,
                      width: 150.w,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    NavigationListItems(
                        accessPath: AppVectors.home,
                        title: "Home",
                        onPressed: () {
                          if (currentIndex != 0) {
                            context.read<DrawerCubit>().onDrawerItemClicked(0);
                            Navigator.pushReplacementNamed(
                                context, RoutesName.homeScreen);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }),
                    NavigationListItems(
                        accessPath: AppVectors.like,
                        title: "Favourite",
                        onPressed: () {
                          if (currentIndex != 1) {
                            context.read<DrawerCubit>().onDrawerItemClicked(0);
                            Navigator.pushNamed(context, RoutesName.homeScreen);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }),
                    NavigationListItems(
                        accessPath: AppVectors.profile,
                        title: "Profile",
                        onPressed: () {
                          if (currentIndex != 2) {
                            context.read<DrawerCubit>().onDrawerItemClicked(0);
                            Navigator.pushNamed(context, RoutesName.homeScreen);
                          } else {
                            Navigator.of(context).pop();
                          }
                        }),
                    BlocBuilder<GenericCubit, GenericDataState>(
                        builder: (context, state) {
                      if (state is DataInitial) {
                        return NavigationListItems(
                            accessPath: AppVectors.logout,
                            title: "Logout",
                            onPressed: () {
                              context
                                  .read<GenericCubit>()
                                  .execute(sl<LoggedOutUsecase>());
                            });
                      }
                      if (state is DataLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is DataLoaded) {
                        return NavigationListItems(
                            accessPath: AppVectors.logout,
                            title: "Logout",
                            onPressed: () {
                              context
                                  .read<GenericCubit>()
                                  .execute(sl<LoggedOutUsecase>());
                            });
                      }
                      return const SizedBox();
                    }),
                  ],
                );
              },
            ),
          )),
        ),
      ),
    );
  }
}
