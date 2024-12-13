import 'package:movie_app/core/error/app_error.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

abstract class SearchState {}

class SearchInitial extends SearchState{}

class SearchLoading extends SearchState{}

class SearchLoaded extends SearchState{
  final List<MovieEntity> movie;

  SearchLoaded({required this.movie});
}

class SearchFailure extends SearchState{
  final AppError appError;

  SearchFailure({required this.appError});
}