import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/error/error_handler.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/movie/models/movie.dart';
import 'package:movie_app/service_locator.dart';
import '../../../core/constant/api_urls.dart';

abstract class MovieApiService {
  Future<Either<ErrorState, List<MovieModel>>> getTrendingMovies();
  Future<Either> getNowPlayingMovies();
}

class MovieApiServiceImpl extends MovieApiService{
  @override
  Future<Either<ErrorState, List<MovieModel>>> getTrendingMovies() async{
    return await ErrorHandler.callApi(
      ()=> sl<DioClient>().getRequest(ApiUrl.trendingMovies), 
      (data)=> List.from(data['content']).map((item)=> MovieModel.fromJson(item)).toList(),
    );
  }
  
  @override
  Future<Either> getNowPlayingMovies() async{
    try{
      var response = await sl<DioClient>().getRequest(ApiUrl.nowPlayingMovies);
      return Right(response.data);
    }on DioException catch(e){
      return Left(e.response!.data['message']);
    }
  }

}