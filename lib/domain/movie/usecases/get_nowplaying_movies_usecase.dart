import 'package:dartz/dartz.dart';
import 'package:movie_app/core/usecase/usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class GetNowplayingMoviesUsecase extends Usecase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await sl<MovieRepository>().nowPlayingMovies();
  }
}