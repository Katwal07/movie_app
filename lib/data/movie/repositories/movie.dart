import 'package:dartz/dartz.dart';
import 'package:movie_app/common/helper/mapper/error_mapper.dart';
import 'package:movie_app/common/helper/mapper/movie_mapper.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/service_locator.dart';
import '../../../core/error/app_error.dart';

class MovieRepositoryImpl extends MovieRepository {
   @override
  Future<Either<AppError, List<MovieEntity>>> getTrendingMovies() async {
    var returnedData = await sl<MovieApiService>().getTrendingMovies();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var movies =
          List.from(data).map((item) => MovieMapper.toEntity(item)).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> nowPlayingMovies() async {
    var returnedData = await sl<MovieApiService>().getNowPlayingMovies();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var movies =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> popularMovies() async {
    var returnedData = await sl<MovieApiService>().popularMovies();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var movies =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> topRatedMovies() async {
    var returnedData = await sl<MovieApiService>().topRatedMovies();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var movies =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> upcommingMovies() async {
    var returnedData = await sl<MovieApiService>().upcommingMovies();
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var movies =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(movies);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> recommendatedMovie(int movieId) async {
    var returnedData = await sl<MovieApiService>().recommendatedMovie(movieId);
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var recommendatedMovie =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(recommendatedMovie);
    });
  }

  @override
  Future<Either<AppError, List<MovieEntity>>> similarMovies(int movieId) async{
      var returnedData = await sl<MovieApiService>().similarMovies(movieId);
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var similarMovies =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(similarMovies);
    });
  }
  
  @override
  Future<Either<AppError, List<MovieEntity>>> searchMovie(String query) async{
       var returnedData = await sl<MovieApiService>().searchMovie(query);
    return returnedData.fold((error) {
      final appError = AppErrorMapper.mapErrorStateToAppError(error);
      return Left(appError);
    }, (data) {
      var searchMovie =
          List.from(data).map((items) => MovieMapper.toEntity(items)).toList();
      return Right(searchMovie);
    });
  }
}
