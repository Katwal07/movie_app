import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetTopRatedMoviesUsecase extends Usecase<Either<AppError, List<MovieEntity>>,dynamic>{
  @override
  Future<Either<AppError, List<MovieEntity>>> call({params}) async{
    return await sl<MovieRepository>().topRatedMovies();
  }
}