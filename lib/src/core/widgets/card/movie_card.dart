import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/src/core/widgets/image/movie_image.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard(
    this.movie, {
    this.onPress,
    this.isNetflix = false,
    super.key,
  });

  static const double _symbolFraction = 0.2;

  final MovieDetailEntity movie;
  final void Function()? onPress;
  final bool isNetflix;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemHeight = constraints.maxHeight;
        return Container(
          margin: const EdgeInsets.only(right: 8).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.grey[300],
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildMovie(),
                    if (isNetflix) _buildSymbolDecoration(height: itemHeight),
                    // others coming soon...
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSymbolDecoration({required double height}) {
    final symbolSize = height * _symbolFraction;

    return Positioned(
      top: 5,
      left: 5,
      child: Image(
        image: AssetImage(Assets.images.netflixSymbol.path),
        width: symbolSize,
        height: symbolSize,
      ),
    );
  }

  Widget _buildMovie() {
    return Positioned.fill(
      child: MovieImage(
        movie: movie,
        size: const Size(270, 360),
      ),
    );
  }
}
