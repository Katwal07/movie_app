import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/domain/movie/usecases/get_nowplaying_movies_usecase.dart';

import '../../../../service_locator.dart';
import 'now_playing_state.dart';

class NowPlayingCubit extends Cubit<NowPlayingState> {
  NowPlayingCubit() : super(NowPlayingStateLoading());

  void getNowPlayingMovies() async {
    try {
      emit(NowPlayingStateLoading());
      
      final returnedData = await sl<GetNowplayingMoviesUsecase>().call();
      
      returnedData.fold(
        (error) {
          emit(NowPlayingStateFailure(errorMessage: error.toString()));
        },
        (data) {
          emit(NowPlayingStateLoaded(
            movies: data,
          ));
        },
      );
    } catch (e) {
      emit(NowPlayingStateFailure(errorMessage: e.toString()));
    }
  }
}