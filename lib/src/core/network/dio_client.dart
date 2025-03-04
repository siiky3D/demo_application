import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/network/api_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A class that provides a wrapper around the Dio HTTP client library.
///
/// This class provides methods for making HTTP requests such as GET, POST, PUT,
/// PATCH, and DELETE.
///
/// It also sets up the base URL, headers, timeouts, response type, and
/// interceptors for the Dio client.

@lazySingleton
class DioClient {
  DioClient() {
    _dio = Dio();

    _dio
      ..options.baseUrl = AppConstants.baseUrl
      ..options.headers = {
        HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
        HttpHeaders.authorizationHeader: 'Bearer ${AppConstants.apiToken}',
      }
      ..options.connectTimeout = const Duration(milliseconds: 15000)
      ..options.receiveTimeout = const Duration(milliseconds: 13000)
      ..options.responseType = ResponseType.json
      ..interceptors.addAll(
        [
          PrettyDioLogger(
            requestHeader: true,
            requestBody: true,
            compact: false,
            logPrint: (object) => log(object.toString(), name: 'TMDB API'),
          ),
          InterceptorsWrapper(
            onRequest: (options, handler) async {
              // Check for token refresh logic
              // If expired, refresh token
              print('Before Request Base URL: ${options.baseUrl}');

              return handler.next(options);
            },
            onResponse: (response, handler) {
              if (response.statusCode == 401) {
                // Handle unauthorized - Refresh token or re-login
              }
              return handler.next(response);
            },
            onError: (DioException e, handler) {
              if (e.response?.statusCode == 500) {
                // Retry logic for 500 error
              }
              return handler.next(e);
            },
          ),
        ],
      );
    apiClient = ApiClient(_dio);
  }
  late final Dio _dio;
  late final ApiClient apiClient;
}
