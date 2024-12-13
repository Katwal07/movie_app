import '../../../core/enum/app_error_type.dart';

class AppError {
  final AppErrorType appErrorType;
  final String message;
  const AppError(this.appErrorType, {this.message = 'An error occurred'});

    String get displayMessage {
    switch (appErrorType) {
      case AppErrorType.network:
        return "Network error. Please check your connection.";
      case AppErrorType.invalidCredentials:
        return "Invalid credentials. Please check your email and password.";
      case AppErrorType.api:
        return "An API error occurred. Please try again later.";
      case AppErrorType.unauthorised:
        return "Unauthorized access. Please log in again.";
      case AppErrorType.noInternet:
        return "No internet connection. Please check your network settings.";
      default:
        return message;
    }
  }
}
