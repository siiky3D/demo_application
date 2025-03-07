import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_listings_entity.dart';
import 'package:netflix_clone/src/presenter/blocs/movie/movies_bloc.dart';
import 'package:netflix_clone/src/presenter/blocs/movie/movies_selector.dart';
import 'package:netflix_clone/src/presenter/widgets/buttons/primary_button.dart';
import 'package:netflix_clone/src/presenter/widgets/card/movie_card.dart';
import 'package:netflix_clone/src/presenter/widgets/image/movie_image.dart';
import 'package:netflix_clone/src/presenter/widgets/list/movie_list.dart';
import 'package:netflix_clone/src/presenter/widgets/shimmer/shimmer.dart';

part 'widgets/top_ranked_movie_card.dart';
part 'widgets/popular_movies_list.dart';
part 'widgets/top_rated_movies_list.dart';
part 'widgets/upcoming_movies_list.dart';
part 'widgets/now_playing_movies_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MoviesBloc get movieBloc => context.read<MoviesBloc>();
  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      movieBloc.add(const MoviesloadStarted());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _TopRankedMovieCard(),
          gapH32,
          _PopularMovieList(),
          gapH32,
          _TopRatedMoviesList(),
          gapH32,
          _UpcomingMoviesList(),
          gapH32,
          _NowPlayingMoviesList(),
          gapH32,
        ],
      ),
    );
  }
}
