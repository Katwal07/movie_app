import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/extension/string.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

class MovieTitle extends StatelessWidget {
  const MovieTitle({super.key, required this.movieEntity});

  final MovieEntity movieEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movieEntity.title ?? "No title",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: Colors.white),
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          children: [
            const Icon(
              Icons.date_range,
              color: Colors.white,
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              movieEntity.releaseDate?.toString().toFormattedDate() ?? 'N/A',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            ),
            const Spacer(),
            const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            SizedBox(
              width: 5.h,
            ),
            Text(
              movieEntity.voteAverage!.toStringAsFixed(1),
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
