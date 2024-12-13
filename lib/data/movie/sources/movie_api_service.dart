import 'package:dartz/dartz.dart';
import 'package:movie_app/core/error/error_handler.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/service_locator.dart';
import '../../../core/constant/api_urls.dart';

abstract class MovieApiService {
  Future<Either<ErrorState, List<MovieModel>>> getTrendingMovies();
  Future<Either<ErrorState, List<MovieModel>>> getNowPlayingMovies();
  Future<Either<ErrorState, List<MovieModel>>> popularMovies();
  Future<Either<ErrorState, List<MovieModel>>> topRatedMovies();
  Future<Either<ErrorState, List<MovieModel>>> upcommingMovies();
  Future<Either<ErrorState, List<MovieModel>>> recommendatedMovie(int movieId);
  Future<Either<ErrorState, List<MovieModel>>> similarMovies(int movieId);
  Future<Either<ErrorState, List<MovieModel>>> searchMovie(String query);

}

class MovieApiServiceImpl extends MovieApiService {
  @override
  Future<Either<ErrorState, List<MovieModel>>> getTrendingMovies() async {
    return await ErrorHandler.callApi(
      () => sl<DioClient>().getRequest(ApiUrl.trendingMovies),
      (data) => List.from(data['content'])
          .map((item) => MovieModel.fromJson(item))
          .toList(),
    );
  }

  @override
  Future<Either<ErrorState, List<MovieModel>>> getNowPlayingMovies() async {
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest(ApiUrl.nowPlayingMovies), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }

  @override
  Future<Either<ErrorState, List<MovieModel>>> popularMovies() async{
      return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest(ApiUrl.popularMovies), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }

  @override
  Future<Either<ErrorState, List<MovieModel>>> topRatedMovies() async{
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest(ApiUrl.topRatedMovies), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }

  @override
  Future<Either<ErrorState, List<MovieModel>>> upcommingMovies() async{
      return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest(ApiUrl.upcommingMovies), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }
  
  @override
  Future<Either<ErrorState, List<MovieModel>>> recommendatedMovie(int movieId) async{
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest('${ApiUrl.movie}$movieId/recommendations'), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }
  
  @override
  Future<Either<ErrorState, List<MovieModel>>> similarMovies(int movieId) async{
      return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest('${ApiUrl.movie}$movieId/similar'), 
      (data)=> List.from(data['content']).map((items)=> MovieModel.fromJson(items)).toList(),
    );
  }
  
  @override
  Future<Either<ErrorState, List<MovieModel>>> searchMovie(String query) async{
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest("${ApiUrl.search}movie/$query"), 
      (data) => List.from(data['content']).map((item)=> MovieModel.fromJson(item)).toList(),
    );
  }
}
