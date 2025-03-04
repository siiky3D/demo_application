import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';
import 'package:netflix_clone/src/features/movies/presentation/pages/home/home_screen.dart';
import 'package:netflix_clone/src/features/movies/presentation/widgets/movies/movie_card.dart';

class MovieListingWidget extends StatefulWidget {
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
  State<MovieListingWidget> createState() => _MovieListingWidgetState();
}

class _MovieListingWidgetState extends State<MovieListingWidget> {
  final scrollController = ScrollController();

  void _scrollListener() {
    final isBottom =
        scrollController.position.maxScrollExtent == scrollController.offset &&
            scrollController.position.pixels ==
                scrollController.position.maxScrollExtent;

    if (isBottom) {
      widget.whenScrollBottom();
    }
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    final isLoading = widget.movies == null || widget.movies!.isEmpty;
    final shimmerItemCount = widget.movies?.length ?? 5;

    return SizedBox(
      height: size.height * 0.15.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16).w,
        physics: const PageScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: isLoading ? shimmerItemCount : widget.movies!.length,
        itemBuilder: (_, index) {
          if (isLoading) {
            return const ShimmerMovieCard();
          }
          final tag = UniqueKey();
          return GestureDetector(
            onTap: () => context.pushNamed(
              AppRoute.movieDetail.name,
              pathParameters: {
                'id': widget.movies?[index].id.toString() ?? '0',
              },
              extra: widget.movies?[index],
            ),
            // child: Hero(tag: tag, child: OldMovieCard(movie: movies?[index])),
            child: Hero(
              tag: tag,
              child: Container(
                margin: const EdgeInsets.only(right: Sizes.p8).w,
                child: MovieCard(
                  movie: widget.movies?[index] ?? const MovieDetailEntity(),
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
