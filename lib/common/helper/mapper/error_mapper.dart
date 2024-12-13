 // ignore_for_file: unused_element

 import '../../../core/enum/app_error_type.dart';
import '../../../core/enum/network_enum.dart';
import '../../../core/error/app_error.dart';
import '../../../core/error/error_handler.dart';

class AppErrorMapper{
  final AppErrorType appErrorType;
  final String message;
  AppErrorMapper(this.appErrorType, {this.message = 'An error occurred'});

  static AppError mapErrorStateToAppError(ErrorState errorState) {
    switch (errorState.runtimeType) {
      case DataNetworkError _:
        final networkError = errorState.networkError;
        return AppError(AppErrorType.network, message: networkError?.toString() ?? 'Network error occurred');
      case DataParseError _:
        final parseError = errorState.parseError;
        return AppError(AppErrorType.api, message: parseError?.toString() ?? 'Data parsing error');
      case DataHttpError _:
        final httpError = errorState.httpError;
        switch (httpError) {
          case HttpException.unAuthorised:
            return const AppError(AppErrorType.unauthorised, message: 'Unauthorized access');
          case HttpException.internalServerError:
            return const AppError(AppErrorType.api, message: 'Internal server error');
          case HttpException.invalidCredentials:
            return const AppError(AppErrorType.unauthorised, message: 'Invalid Credentials');
          default:
            return const AppError(AppErrorType.api, message: 'Unknown HTTP error');
        }
      case DataClientError _:
        final clientError = errorState.clientError;
        return AppError(AppErrorType.api, message: clientError?.toString() ?? 'Client error occurred');
      default:
        return const AppError(AppErrorType.api, message: 'Unexpected error occurred');
    }
  }
}