import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/common_widgets/card/movie_card.dart';
import 'package:netflix_clone/src/core/common_widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/movie_card.dart';

part '../../_widgets/movies/movie_listing_widget.dart';
part '../../_widgets/movies/ranked_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          RankedMovieCard(size: size),
          gapH16,
          const MovieCard2(
            imageUrl: AppConstants.movieImage,
            isNetflixOriginal: true,
            isTop10: true,
            isNewRelease: true,
          ),
        ],
      ),
    );
  }
}
