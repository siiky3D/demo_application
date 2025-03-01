import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/common_widgets/buttons/retry_button.dart';
import 'package:netflix_clone/src/core/common_widgets/card/movie_card.dart';
import 'package:netflix_clone/src/core/common_widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_popular_movies/get_popular_movies_bloc.dart';
import 'package:netflix_clone/src/features/movies/presentation/blocs/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart';

part '../../_widgets/movies/movie_listing_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/netflix_symbol.png',
                    height: 60,
                    width: 120,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20).r,
                    child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.download,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20).r,
                    child: InkWell(
                      onTap: () {},
                      child: Icon(
                        Icons.search,
                        size: 30.r,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<GetPopularMoviesBloc, GetPopularMoviesState>(
            builder: (context, getPopularMoviesState) {
              if (getPopularMoviesState is GetPopularMoviesError) {
                return Padding(
                  padding: const EdgeInsets.all(12).r,
                  child: RetryButton(
                    text: getPopularMoviesState.message,
                    retryAction: () => context
                        .read<GetPopularMoviesBloc>()
                        .add(const FetchPopularMovies()),
                  ),
                );
              }

              if (getPopularMoviesState is GetPopularMoviesLoaded) {
                return _MovieListingWidget(
                  hasReachedMax:
                      context.watch<GetPopularMoviesBloc>().hasReachedMax,
                  movies: getPopularMoviesState.movies,
                  whenScrollBottom: () async => context
                      .read<GetPopularMoviesBloc>()
                      .add(const FetchPopularMovies()),
                );
              }

              return const BaseIndicator();
            },
          ),
          BlocBuilder<GetTopRatedMoviesBloc, GetTopRatedMoviesState>(
            builder: (context, getTopRatedMoviesState) {
              if (getTopRatedMoviesState is GetTopRatedMoviesError) {
                return Padding(
                  padding: const EdgeInsets.all(12).r,
                  child: RetryButton(
                    text: getTopRatedMoviesState.message,
                    retryAction: () => context
                        .read<GetTopRatedMoviesBloc>()
                        .add(const FetchTopRatedMovies()),
                  ),
                );
              }

              if (getTopRatedMoviesState is GetTopRatedMoviesLoaded) {
                return _MovieListingWidget(
                  hasReachedMax:
                      context.watch<GetTopRatedMoviesBloc>().hasReachedMax,
                  movies: getTopRatedMoviesState.movies,
                  whenScrollBottom: () async =>
                      context.read<GetTopRatedMoviesBloc>()
                        ..add(const FetchTopRatedMovies()),
                );
              }

              return const BaseIndicator();
            },
          ),
        ],
      ),
    );
  }
}
