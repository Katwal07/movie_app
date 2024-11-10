import 'package:movie_app/domain/movie/entity/movie.dart';

import '../../../../common/helper/error/app_error.dart';

abstract class TrendingState {}

class TrendingStateLoading extends TrendingState {}

class TrendingStateLoaded extends TrendingState {
  final int defaultIndex;
  final List<MovieEntity> movies;

  TrendingStateLoaded({required this.defaultIndex, required this.movies,});
}

class TrendingStateFailure extends TrendingState {
  final AppError appError;

  TrendingStateFailure({required this.appError});

  
}
