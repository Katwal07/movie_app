import 'package:dio/dio.dart';
import 'package:movie_app/core/constant/api_urls.dart';
import 'package:movie_app/core/network/interceptors.dart';

class DioClient {
  late final Dio _dio;

  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: ApiUrl.baseURL,
            headers: {
              'Content-Type': 'application/json; charset=UTF-8',
            },
            responseType: ResponseType.json,
            receiveTimeout: const Duration(seconds: 10),
            sendTimeout: const Duration(seconds: 10),
          ),
        )..interceptors.addAll(
            [LoggerInterceptor(),AuthorizationInterceptor()],
          );

  Future<Response> getRequest(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(url,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }

  Future<Response> postRequest(
    String url, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(url,
      data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress);
      return response;
    } on DioException {
      rethrow;
    }
  }
}
