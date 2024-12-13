import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

class MovieOverView extends StatelessWidget {
  const MovieOverView({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Colors.white,
              ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          movieEntity.overview.toString(),
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }
}
