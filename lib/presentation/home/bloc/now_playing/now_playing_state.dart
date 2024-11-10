import 'package:movie_app/domain/movie/entity/movie.dart';

abstract class NowPlayingState {}

class NowPlayingStateLoading extends NowPlayingState {}

class NowPlayingStateLoaded extends NowPlayingState {
  final List<MovieEntity> movies;

  NowPlayingStateLoaded({required this.movies,});
}

class NowPlayingStateFailure extends NowPlayingState {
  final String errorMessage;

  NowPlayingStateFailure({required this.errorMessage});
}
