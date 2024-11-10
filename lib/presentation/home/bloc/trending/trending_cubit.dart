import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/common/helper/error/app_error.dart';
import 'package:movie_app/core/enum/app_error_type.dart';

import '../../../../domain/movie/usecases/get_trending_movie_usecase.dart';
import '../../../../service_locator.dart';
import 'trending_state.dart';

class TrendingCubit extends Cubit<TrendingState> {
  TrendingCubit() : super(TrendingStateLoading());

  void getTrendingMovies() async {
    try {
      emit(TrendingStateLoading());
      
      final returnedData = await sl<GetTrendingMovieUseCase>().call();
      
      returnedData.fold(
        (error) {
          emit(TrendingStateFailure(appError: error));
        },
        (data) {
          emit(TrendingStateLoaded(
            movies: data,
            defaultIndex: 0,
          ));
        },
      );
    } catch (e) {
      emit(TrendingStateFailure(appError: AppError(AppErrorType.api, message: e.toString())));
    }
  }
}