import 'package:get_it/get_it.dart';
import 'package:movie_app/core/network/dio_client.dart';
import 'package:movie_app/data/auth/repositories/auth.dart';
import 'package:movie_app/data/auth/sources/auth_api_service.dart';
import 'package:movie_app/data/auth/sources/auth_local_service.dart';
import 'package:movie_app/data/movie/repositories/movie.dart';
import 'package:movie_app/data/movie/sources/movie_api_service.dart';
import 'package:movie_app/domain/auth/repositories/auth.dart';
import 'package:movie_app/domain/auth/usecase/is_loggedin_usecase.dart';
import 'package:movie_app/domain/auth/usecase/signin_usecase.dart';
import 'package:movie_app/domain/auth/usecase/signup_usecase.dart';
import 'package:movie_app/domain/movie/repositories/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_nowplaying_movies_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_trending_movie_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator(){

  /// Http Service
  sl.registerSingleton<DioClient>(DioClient());

  /// APIs Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  sl.registerSingleton<MovieApiService>(MovieApiServiceImpl());

  /// Repositories
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<MovieRepository>(MovieRepositoryImpl());

  /// UseCases
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<IsLoggedinUsecase>(IsLoggedinUsecase());
  sl.registerSingleton<GetTrendingMovieUseCase>(GetTrendingMovieUseCase());
  sl.registerSingleton<GetNowplayingMoviesUsecase>(GetNowplayingMoviesUsecase());
}