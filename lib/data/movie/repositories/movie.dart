import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/error/app_error.dart';
import 'package:movie_app/common/helper/mapper/error_mapper.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<Either<AppError, List<MovieEntity>>> getTrendingMovies() async {
    var returnedData = await sl<MovieApiService>().getTrendingMovies();
    return returnedData.fold(
      (error){
        final appError = AppErrorMapper.mapErrorStateToAppError(error);
        return Left(appError);
      }, (data){
        var movies = List.from(data).map((item)=> MovieMapper.toEntity(item)).toList();
        return Right(movies);
      });
  }
  
  @override
  Future<Either> nowPlayingMovies() async{
    var returnedData = await sl<MovieApiService>().getNowPlayingMovies();
    return returnedData.fold(
      (error){
        return Left(error);
      }, 
      (data){
        var movies = List.from(data['content']).map((items)=> MovieMapper.toEntity(MovieModel.fromJson(items))).toList();
        return Right(movies);
      }
    );
  }
}
