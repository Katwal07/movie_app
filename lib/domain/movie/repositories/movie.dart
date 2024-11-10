import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

abstract class MovieRepository{
  Future<Either<AppError, List<MovieEntity>>> getTrendingMovies();
  Future<Either> nowPlayingMovies();
}