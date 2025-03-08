import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_clone/env/env.dart';
import 'package:netflix_clone/src/core/network/api/actort_api.dart';
import 'package:netflix_clone/src/core/network/api/movie_api.dart';
import 'package:netflix_clone/src/core/network/api/search_api.dart';
import 'package:netflix_clone/src/core/network/api/tv_series_api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@singleton
class DioClient {
  DioClient() {
    _dio = Dio();

    _configureDio();
    _configureInterceptors();

    movieApiClient = MovieApi(_dio);
    searchApiClient = SearchApi(_dio);
    tvSeriesApiClient = TvSeriesApi(_dio);
    actorApiClient = ActorApi(_dio);
  }

  late final Dio _dio;
  late final MovieApi movieApiClient;
  late final SearchApi searchApiClient;
  late final TvSeriesApi tvSeriesApiClient;
  late final ActorApi actorApiClient;

  void _configureDio() {
    _dio.options.baseUrl = Env.tmdbBaseUrl;
    _dio.options.headers = {
      HttpHeaders.contentTypeHeader: ContentType.json.mimeType,
      HttpHeaders.authorizationHeader: 'Bearer ${Env.tmdbAccessToken}',
    };
    _dio.options.connectTimeout = const Duration(milliseconds: 20000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 30000);
    _dio.options.responseType = ResponseType.json;
  }

  void _configureInterceptors() {
    _dio.interceptors.addAll([
      _loggingInterceptor(),
      _authInterceptor(),
      _errorHandlingInterceptor(),
      _cacheInterceptor(),
    ]);
  }

  Interceptor _loggingInterceptor() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
      logPrint: (object) => log(object.toString(), name: 'TMDB API'),
    );
  }

  Interceptor _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        debugPrint('Before Request Base URL: ${options.baseUrl}');

        final tokenExpired = await _isTokenExpired();
        if (tokenExpired) {
          options.headers[HttpHeaders.authorizationHeader] =
              'Bearer ${Env.tmdbAccessToken}';
        }

        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.statusCode == 401) {
          _handleUnauthorized();
        }
        return handler.next(response);
      },
    );
  }

  Interceptor _errorHandlingInterceptor() {
    return InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 500) {
          debugPrint('Server error, retrying request...');
        }
        return handler.next(e);
      },
    );
  }

  Interceptor _cacheInterceptor() {
    return DioCacheInterceptor(
      options: CacheOptions(
        store: MemCacheStore(),
        maxStale: const Duration(minutes: 5),
      ),
    );
  }

  Future<bool> _isTokenExpired() async {
    return false;
  }

  void _handleUnauthorized() {
    debugPrint('Unauthorized: Token may have expired, please login again.');
  }
}
