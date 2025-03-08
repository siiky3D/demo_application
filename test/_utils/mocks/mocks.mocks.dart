// Mocks generated by Mockito 5.4.5 from annotations
// in netflix_clone/test/_utils/mocks/mocks.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;

import 'package:mockito/mockito.dart' as _i1;
import 'package:netflix_clone/src/core/network/api/actort_api.dart' as _i5;
import 'package:netflix_clone/src/core/network/api/movie_api.dart' as _i2;
import 'package:netflix_clone/src/core/network/api/search_api.dart' as _i3;
import 'package:netflix_clone/src/core/network/api/tv_series_api.dart' as _i4;
import 'package:netflix_clone/src/core/network/dio_client.dart' as _i8;
import 'package:netflix_clone/src/data/data_sources/remote/movie/movie_remote_data_source.dart'
    as _i9;
import 'package:netflix_clone/src/data/models/movie/movie_detail_model.dart'
    as _i7;
import 'package:netflix_clone/src/data/models/movie/movie_listings_model.dart'
    as _i6;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeMovieApi_0 extends _i1.SmartFake implements _i2.MovieApi {
  _FakeMovieApi_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSearchApi_1 extends _i1.SmartFake implements _i3.SearchApi {
  _FakeSearchApi_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeTvSeriesApi_2 extends _i1.SmartFake implements _i4.TvSeriesApi {
  _FakeTvSeriesApi_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeActorApi_3 extends _i1.SmartFake implements _i5.ActorApi {
  _FakeActorApi_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieListingsModel_4 extends _i1.SmartFake
    implements _i6.MovieListingsModel {
  _FakeMovieListingsModel_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMovieDetailModel_5 extends _i1.SmartFake
    implements _i7.MovieDetailModel {
  _FakeMovieDetailModel_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [DioClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockDioClient extends _i1.Mock implements _i8.DioClient {
  MockDioClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieApi get movieApiClient => (super.noSuchMethod(
        Invocation.getter(#movieApiClient),
        returnValue: _FakeMovieApi_0(
          this,
          Invocation.getter(#movieApiClient),
        ),
      ) as _i2.MovieApi);

  @override
  set movieApiClient(_i2.MovieApi? _movieApiClient) => super.noSuchMethod(
        Invocation.setter(
          #movieApiClient,
          _movieApiClient,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.SearchApi get searchApiClient => (super.noSuchMethod(
        Invocation.getter(#searchApiClient),
        returnValue: _FakeSearchApi_1(
          this,
          Invocation.getter(#searchApiClient),
        ),
      ) as _i3.SearchApi);

  @override
  set searchApiClient(_i3.SearchApi? _searchApiClient) => super.noSuchMethod(
        Invocation.setter(
          #searchApiClient,
          _searchApiClient,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i4.TvSeriesApi get tvSeriesApiClient => (super.noSuchMethod(
        Invocation.getter(#tvSeriesApiClient),
        returnValue: _FakeTvSeriesApi_2(
          this,
          Invocation.getter(#tvSeriesApiClient),
        ),
      ) as _i4.TvSeriesApi);

  @override
  set tvSeriesApiClient(_i4.TvSeriesApi? _tvSeriesApiClient) =>
      super.noSuchMethod(
        Invocation.setter(
          #tvSeriesApiClient,
          _tvSeriesApiClient,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.ActorApi get actorApiClient => (super.noSuchMethod(
        Invocation.getter(#actorApiClient),
        returnValue: _FakeActorApi_3(
          this,
          Invocation.getter(#actorApiClient),
        ),
      ) as _i5.ActorApi);

  @override
  set actorApiClient(_i5.ActorApi? _actorApiClient) => super.noSuchMethod(
        Invocation.setter(
          #actorApiClient,
          _actorApiClient,
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [MovieRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRemoteDataSource extends _i1.Mock
    implements _i9.MovieRemoteDataSource {
  MockMovieRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i10.Future<_i6.MovieListingsModel> getPopularMovies({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getPopularMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #getPopularMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);

  @override
  _i10.Future<_i6.MovieListingsModel> getTopRatedMovies({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getTopRatedMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #getTopRatedMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);

  @override
  _i10.Future<_i7.MovieDetailModel> getMovieDetails({required int? movieId}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getMovieDetails,
          [],
          {#movieId: movieId},
        ),
        returnValue:
            _i10.Future<_i7.MovieDetailModel>.value(_FakeMovieDetailModel_5(
          this,
          Invocation.method(
            #getMovieDetails,
            [],
            {#movieId: movieId},
          ),
        )),
      ) as _i10.Future<_i7.MovieDetailModel>);

  @override
  _i10.Future<_i6.MovieListingsModel> getRecommendedMovies({
    required int? movieId,
    required int? page,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getRecommendedMovies,
          [],
          {
            #movieId: movieId,
            #page: page,
          },
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #getRecommendedMovies,
            [],
            {
              #movieId: movieId,
              #page: page,
            },
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);

  @override
  _i10.Future<_i6.MovieListingsModel> getUpcomingMovies({required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUpcomingMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #getUpcomingMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);

  @override
  _i10.Future<_i6.MovieListingsModel> getNowPlayingMovies(
          {required int? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getNowPlayingMovies,
          [],
          {#page: page},
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #getNowPlayingMovies,
            [],
            {#page: page},
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);

  @override
  _i10.Future<_i6.MovieListingsModel> searchMovies({
    required String? query,
    required int? page,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchMovies,
          [],
          {
            #query: query,
            #page: page,
          },
        ),
        returnValue:
            _i10.Future<_i6.MovieListingsModel>.value(_FakeMovieListingsModel_4(
          this,
          Invocation.method(
            #searchMovies,
            [],
            {
              #query: query,
              #page: page,
            },
          ),
        )),
      ) as _i10.Future<_i6.MovieListingsModel>);
}
