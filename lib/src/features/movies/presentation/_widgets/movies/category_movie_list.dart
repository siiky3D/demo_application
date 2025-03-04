import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/movie_listing_widget.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/home/home_screen.dart';

class CategoryMovieList extends StatelessWidget {
  const CategoryMovieList({
    required this.categoryTitle,
    required this.movies,
    required this.whenScrollBottom,
    required this.hasReachedMax,
    super.key,
  });

  final String categoryTitle;
  final List<MovieDetailEntity>? movies;
  final void Function() whenScrollBottom;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final isLoading = movies == null || movies!.isEmpty;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16).w,
          child: Row(
            children: [
              if (isLoading)
                const ShimmerMovieCard(
                  height: 30,
                  width: 120,
                )
              else
                Text(
                  categoryTitle,
                  style: context.appTheme.typographies.heading,
                ),
            ],
          ),
        ),
        gapH8,
        MovieListingWidget(
          movies: movies,
          whenScrollBottom: whenScrollBottom,
          hasReachedMax: hasReachedMax,
        ),
        gapH32,
      ],
    );
  }
}
