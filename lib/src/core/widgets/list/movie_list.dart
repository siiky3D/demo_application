import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';

class MoviesList extends StatefulWidget {
  const MoviesList({
    required this.scrollController,
    required this.onLoadMore,
    required this.onMoviePress,
    required this.itemBuilder,
    required this.itemCount,
    this.itemHeight = 0.15,
    this.itemWidth = 0.3,
    super.key,
  });

  final ScrollController scrollController;
  final void Function() onLoadMore;
  final void Function(MovieDetailEntity) onMoviePress;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;
  final double itemHeight;
  final double itemWidth;

  @override
  State<MoviesList> createState() => _MovieListState();
}

class _MovieListState extends State<MoviesList> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return SizedBox(
      height: size.height * 0.15.h,
      child: ListView.builder(
        itemCount: widget.itemCount,
        controller: widget.scrollController,
        scrollDirection: Axis.horizontal,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
