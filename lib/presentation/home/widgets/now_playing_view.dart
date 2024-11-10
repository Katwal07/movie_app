import 'package:flutter/material.dart';
import 'package:movie_app/presentation/home/widgets/movie_card.dart';

import '../../../domain/movie/entity/movie.dart';

class NowPlayingMovieView extends StatelessWidget {
  final List<MovieEntity> movies;
  const NowPlayingMovieView({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          final MovieEntity movieEntity = movies[index];
          return MovieCard(
            posterPath: movieEntity.posterPath.toString(),
            );
        }, 
        separatorBuilder: (context,index)=> const SizedBox(width: 10,), 
        itemCount: movies.length,
        ),
    );
  }
}