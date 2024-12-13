import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/bloc/generic/generic_cubit.dart';
import 'package:movie_app/common/widgets/movie/movie_card.dart';
import 'package:movie_app/core/configs/routes/routes_name.dart';
import 'package:movie_app/domain/movie/usecases/get_similar_movies.dart';
import 'package:movie_app/service_locator.dart';

import '../../../common/bloc/generic/generic_state.dart';

class SimilarMovies extends StatelessWidget {
  const SimilarMovies({super.key, required this.movieId});

  final int movieId;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericCubit()..execute(sl<GetSimilarMoviesUseCase>(),params: movieId),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Similar Movies",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
             SizedBox(
              height: 10.h,
            ),
             BlocBuilder<GenericCubit, GenericDataState>(
               builder: (context, state) {
               if(state is DataLoaded){
                  return SizedBox(
                    height: 300.h,
                    child: ListView.separated(
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index){
                              final movieDetails = state.data[index];
                             return GestureDetector(
                              onTap: ()=> Navigator.pushNamed(context, RoutesName.watchPage,arguments: movieDetails),
                              child: CategoryMovieCard(movieEntity: state.data[index]));
                             }, 
                              separatorBuilder: (context, index) => const SizedBox(
                               width: 10,
                             ),
                             itemCount: state.data.length
                           ),
                  );
               }
               if(state is DataLoading){
                return const Center(child: CircularProgressIndicator(),);
               }
               return const SizedBox();
              },
            ),
          ],
        ),
    );
  }
}
