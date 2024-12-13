import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetRecommendatedMovieUseCase extends Usecase<Either<AppError, List<MovieEntity>>,int>{
  @override
  Future<Either<AppError, List<MovieEntity>>> call({int ? params}) async{
    return await sl<MovieRepository>().recommendatedMovie(params!);
  }
}