import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/core/widgets/shimmer/shimmer.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    required this.movie,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.useHero = true,
    this.placeholder,
    this.tintColor,
    super.key,
  });

  static const Size _cacheMaxSize = Size(700, 700);

  final MovieDetailEntity movie;
  final EdgeInsets padding;
  final bool useHero;
  final Size size;
  final ImageProvider? placeholder;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    return HeroMode(
      enabled: useHero,
      child: Hero(
        tag: movie.posterPath ?? UniqueKey(),
        child: AnimatedPadding(
          duration: const Duration(milliseconds: 600),
          padding: padding,
          child: CachedNetworkImage(
            imageUrl: '${AppConstants.imageUrl}${movie.posterPath}',
            useOldImageOnUrlChange: true,
            maxWidthDiskCache: _cacheMaxSize.width.toInt(),
            maxHeightDiskCache: _cacheMaxSize.height.toInt(),
            fadeInDuration: const Duration(milliseconds: 120),
            fadeOutDuration: const Duration(milliseconds: 120),
            imageBuilder: (_, image) => Image(
              image: image,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.cover,
            ),
            placeholder: (_, __) => const ShimmerPlaceholder(),
            errorWidget: (_, __, ___) => const BaseIndicator(),
          ),
        ),
      ),
    );
  }
}
