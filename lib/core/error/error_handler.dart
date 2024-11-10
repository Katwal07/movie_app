import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../enum/network_enum.dart';
part 'error_state.dart';

class ErrorHandler {

  static Future<bool> _isConnected() async{
  var result = await Connectivity().checkConnectivity();
  return result != ConnectivityResult.none;
  }
  static Future<Either<ErrorState, T>> callApi<T>(
      Future<Response> Function() api, T Function(dynamic) parse) async {
    try {
      final response = await api();
      switch (response.statusCode) {
        case 200:
          try {
            return Right(parse(response.data));
          } catch (e) {
            return Left(DataParseError(Exception(e.toString())));
          }
        case 401:
          return Left(DataHttpError(HttpException.unAuthorised));
        case 500:
          return Left(DataHttpError(HttpException.internalServerError));
        default:
          return Left(DataHttpError(HttpException.unknown));
      }
    } on DioException catch (e) {
      if(! await _isConnected()){
        return Left(DataNetworkError(NetworkException.noInternetConnection));
      }
      return switch (e.type) {
        DioExceptionType.receiveTimeout =>
          Left(DataNetworkError(NetworkException.timeOutError)),
        DioExceptionType.connectionTimeout =>
          Left(DataNetworkError(NetworkException.timeOutError)),
        DioExceptionType.sendTimeout =>
          Left(DataNetworkError(NetworkException.timeOutError)),
        _ => Left(DataNetworkError(NetworkException.unknown))
      };
    }
  }
}
