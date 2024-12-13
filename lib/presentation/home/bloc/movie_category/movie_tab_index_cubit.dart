import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';
import 'package:movie_app/domain/movie/usecases/get_nowplaying_movies_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_popular_movies_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_top.rated_movies_usecase.dart';
import 'package:movie_app/domain/movie/usecases/get_upcomming_movies_usecase.dart';
import 'package:movie_app/service_locator.dart';
import '../../../../core/error/app_error.dart';
import 'movie_tab_index_state.dart';

class MovieTabIndexCubit extends Cubit<MovieTabIndexState> {
  MovieTabIndexCubit() : super(MovieTabInitialState()){
    _fetchTabData(0);
  }

  void setCurrentTab(int index) async{
    emit(MovieTabLoadingState(currentTab: index));
    await _fetchTabData(index);
  }

  Future<void> _fetchTabData(int index) async {
    Either<AppError, List<MovieEntity>>? returnedData;
    switch (index) {
      case 0:
        returnedData = await sl<GetNowplayingMoviesUsecase>().call();
        break;
      case 1:
        returnedData = await sl<GetPopularMoviesUsecase>().call();
        break;
      case 2:
        returnedData = await sl<GetTopRatedMoviesUsecase>().call();
        break;
      case 3:
        returnedData = await sl<GetUpcommingMoviesUsecase>().call();
        break;
      default:
    }
    if (returnedData != null) {
      returnedData.fold(
        (error) =>emit(MovieTabFailureState()),
        (data) => emit(MovieTabLoadedState(currentTab: index, tabData: data)),
      );
    } else {
      emit(
        MovieTabFailureState(),
      );
    }
  }
}
