import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/movie_card.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/home/home_screen.dart';

class MovieListingWidget extends HookWidget {
  const MovieListingWidget({
    required this.movies,
    required this.whenScrollBottom,
    required this.hasReachedMax,
    super.key,
  });

  final List<MovieDetailEntity>? movies;
  final void Function() whenScrollBottom;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final scrollController = useScrollController();
    useAutomaticKeepAlive();

    final listener = useMemoized(() => () async {
          final isBottom = scrollController.position.maxScrollExtent ==
                  scrollController.offset &&
              scrollController.position.pixels ==
                  scrollController.position.maxScrollExtent;

          if (isBottom) {
            whenScrollBottom.call();
          }
        });

    useEffect(
      () {
        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [],
    );

    final isLoading = movies == null || movies!.isEmpty;
    const shimmerItemCount = 5;

    return SizedBox(
      height: size.height * 0.15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16).w,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: isLoading ? shimmerItemCount : movies!.length,
        itemBuilder: (_, index) {
          if (isLoading) {
            return const ShimmerMovieCard();
          }
          final tag = UniqueKey();
          return GestureDetector(
            onTap: () => context.pushNamed(
              AppRoute.movieDetail.name,
              pathParameters: {'id': movies?[index].id.toString() ?? '0'},
              extra: movies?[index],
            ),
            // child: Hero(tag: tag, child: OldMovieCard(movie: movies?[index])),
            child: Hero(
              tag: tag,
              child: Container(
                margin: const EdgeInsets.only(right: Sizes.p8).w,
                child: const MovieCard(
                  imageUrl: AppConstants.movieImage,
                  isNetflixOriginal: true,
                  isTop10: true,
                  isNewRelease: true,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
