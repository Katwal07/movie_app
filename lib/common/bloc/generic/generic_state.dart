import 'package:movie_app/core/error/app_error.dart';

abstract class GenericDataState {}

class DataInitial extends GenericDataState {}

class DataLoading extends GenericDataState {}

class DataLoaded<T> extends GenericDataState {
  final T data;
  final int? defaultIndex;

  DataLoaded({required this.data, this.defaultIndex});


}

class FailureDataLoad extends GenericDataState {
  final AppError appError;

  FailureDataLoad({required this.appError});
}
