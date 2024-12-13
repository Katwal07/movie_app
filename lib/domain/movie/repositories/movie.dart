import 'package:dartz/dartz.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

import '../../../core/error/app_error.dart';

abstract class MovieRepository{
  Future<Either<AppError, List<MovieEntity>>> getTrendingMovies();
  Future<Either<AppError,List<MovieEntity>>> nowPlayingMovies();
  Future<Either<AppError, List<MovieEntity>>> popularMovies();
  Future<Either<AppError, List<MovieEntity>>> topRatedMovies();
  Future<Either<AppError, List<MovieEntity>>> upcommingMovies();
  Future<Either<AppError, List<MovieEntity>>> recommendatedMovie(int movieId);
  Future<Either<AppError, List<MovieEntity>>> similarMovies(int movieId);
  Future<Either<AppError, List<MovieEntity>>> searchMovie(String query);
}