import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/src/core/network/model/error_model.dart';

///
/// This class extends [Equatable] and implements [Exception].
/// It contains a [message] and a [statusCode] property.
/// The [message] property contains the error message and the [statusCode]
/// property contains the HTTP status code of the response.
///
/// This class has a constructor [fromDioError] which takes a [DioException]
/// as a parameter and sets the [statusCode] and [message] properties based on
/// the type of the [DioException].
///
/// This class also overrides the [props] getter from [Equatable] to compare
/// instances of this class based on the [message] and [statusCode] properties.
///
/// Example usage:
/// ```dart
/// try {
///   // some network request
/// } on DioException catch (e) {
///   throw NetworkException.fromDioError(e);
/// }
/// ```
class NetworkException extends Equatable implements Exception {
  NetworkException.fromDioError(DioException dioException) {
    statusCode = dioException.response?.statusCode;

    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';

      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';

      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';

      case DioExceptionType.sendTimeout:
        message = 'Send timeout in connection with API server';

      case DioExceptionType.connectionError:
        if (dioException.error.runtimeType == SocketException) {
          message = 'Please check your internet connection';
          break;
        } else {
          message = 'Unexpected error occurred';
          break;
        }

      case DioExceptionType.badCertificate:
        message = 'Bad Certificate';

      case DioExceptionType.badResponse:
        final model = NetworkErrorModel.fromJson(
          dioException.response?.data as Map<String, dynamic>,
        );
        message = model.statusMessage ?? 'Unexpected bad response';

      case DioExceptionType.unknown:
        message = 'Unexpected error occurred';
    }
  }
  late final String message;
  late final int? statusCode;

  @override
  List<Object?> get props => [message, statusCode];
}
