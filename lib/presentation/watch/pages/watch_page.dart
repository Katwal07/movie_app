import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/presentation/watch/widgets/movie_overvier.dart';
import 'package:movie_app/presentation/watch/widgets/movie_title.dart';
import 'package:movie_app/presentation/watch/widgets/recommendated_movie.dart';
import 'package:movie_app/presentation/watch/widgets/similar_movies.dart';
import '../../../common/widgets/app_bar/app_bar.dart';

class WatchPage extends StatelessWidget {
  const WatchPage({super.key, required this.movieEntity});

  final MovieEntity movieEntity;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        height: 50.h,
        hideback: false,
        containerColor: const Color.fromARGB(255, 104, 103, 103),
        
      ),
      backgroundColor: const Color(0xff242A32),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            SizedBox(height: 20.h,),
            Container(
              height: 220.h,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),

            /// Movie Title
            MovieTitle(movieEntity: movieEntity),

            SizedBox(
              height: 10.h,
            ),

            /// Movie Overview
            MovieOverView(movieEntity: movieEntity),

            SizedBox(
              height: 20.h,
            ),

            /// Recommendation Movies
            RecommendatedMovie(movieId: movieEntity.id!),

            SizedBox(
              height: 20.h,
            ),

            /// Similar Movies
            SimilarMovies(movieId: movieEntity.id!),

            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
