import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/core/widgets/buttons/primary_button.dart';
import 'package:netflix_clone/src/core/widgets/card/movie_card.dart';
import 'package:netflix_clone/src/core/widgets/image/movie_image.dart';
import 'package:netflix_clone/src/core/widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/core/widgets/list/movie_list.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_listings/movie_listings_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/export_movie_blocs.dart';

part '../../widgets/movies/top_ranked_movie_card.dart';
part '../../widgets/movies/popular_movies_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          _TopRankedMovieCard(),
          gapH32,
          _MovieList(movieType: MovieType.popular),
          gapH32,
          _MovieList(movieType: MovieType.topRated),
          gapH32,
          _MovieList(movieType: MovieType.upcoming),
          gapH32,
          _MovieList(movieType: MovieType.nowPlaying),
        ],
      ),
    );
  }
}
