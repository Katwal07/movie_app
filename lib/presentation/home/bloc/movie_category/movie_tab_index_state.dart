import 'package:equatable/equatable.dart';
import 'package:movie_app/domain/movie/entity/movie.dart';

abstract class MovieTabIndexState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieTabInitialState extends MovieTabIndexState {
  final int currentTab;

  MovieTabInitialState({this.currentTab = 0});

  @override
  List<Object?> get props => [currentTab];

  MovieTabInitialState copyWith({
    int? currentTab,
  }) {
    return MovieTabInitialState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}

class MovieTabLoadingState extends MovieTabIndexState {
    final int currentTab;

  MovieTabLoadingState({required this.currentTab});

  @override
  List<Object?> get props => [currentTab];

  MovieTabLoadingState copyWith({
    int? currentTab,
  }) {
    return MovieTabLoadingState(
      currentTab: currentTab ?? this.currentTab,
    );
  }
}

class MovieTabLoadedState extends MovieTabIndexState {
    final int currentTab;
    final List<MovieEntity> tabData;

  MovieTabLoadedState({required this.currentTab, required this.tabData,});

  @override
  List<Object?> get props => [currentTab,tabData];

  MovieTabLoadedState copyWith({
    int? currentTab,
    List<MovieEntity>? tabData,
  }) {
    return MovieTabLoadedState(
      currentTab: currentTab ?? this.currentTab,
      tabData: tabData ?? this.tabData,
    );
  }
}

class MovieTabFailureState extends MovieTabIndexState {}
