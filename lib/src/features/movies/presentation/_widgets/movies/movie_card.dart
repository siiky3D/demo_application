import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:shimmer/shimmer.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    required this.movie,
    super.key,
    this.isNetflixOriginal = false,
    this.isTop10 = false,
    this.isNewRelease = false,
  });
  final MovieDetailEntity movie;
  final bool isNetflixOriginal;
  final bool isTop10;
  final bool isNewRelease;

  String getFullImageUrl(String? path) {
    if (path == null || path.isEmpty) {
      return 'https://placehold.co/400';
    }
    return '${AppConstants.imageUrl}$path';
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: getFullImageUrl(movie.posterPath),
            width: size.width * 0.25.w,
            height: size.height * 0.15.h,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[800]!,
              highlightColor: Colors.grey[600]!,
              child: Container(
                width: double.infinity,
                height: 300,
                color: Colors.grey[800],
              ),
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.red),
          ),
        ),
        if (isNetflixOriginal)
          Positioned(
            top: 5,
            left: 5,
            child: Image.asset(
              'assets/images/netflix_symbol.png',
              width: 30,
              height: 30,
            ),
          ),
        if (isTop10)
          Positioned(
            top: 5,
            right: 5,
            child: Image.asset(
              //TODO: change image to top10
              'assets/images/netflix_symbol.png',
              width: 30,
              height: 30,
            ),
          ),
        if (isNewRelease)
          Positioned(
            bottom: 0,
            left: 14,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: AppColors.brightRed.withOpacity(0.8),
              child: Text(
                'New Release',
                style: context.appTheme.typographies.bodyExtraSmall.copyWith(
                  color: context.colors.textOnPrimary,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
