import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/common_widgets/image/base_network_image.dart';
import 'package:netflix_clone/src/features/movies/domain/entities/movie_detail/movie_detail_entity.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, this.movie});
  final MovieDetailEntity? movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Stack(
        children: [
          BaseNetworkImage.originalImageSize(movie?.posterPath),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Align(
              //   alignment: Alignment.topRight,
              //   child: BlocBuilder<GetSavedMoviesCubit, GetSavedMoviesState>(
              //     builder: (context, state) {
              //       if (state is GetSavedMoviesLoaded) {
              //         return BookmarkButton(
              //           movieDetailEntity: movie,
              //         );
              //       }

              //       return const SizedBox.shrink();
              //     },
              //   ),
              // ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 10),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: 1.sw,
                    height: 60,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                    child: Text(
                      movie?.title ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
