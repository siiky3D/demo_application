import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:netflix_clone/src/core/extensions/int_extensions.dart';
import 'package:netflix_clone/src/domain/entities/movie/cast_entity.dart';
import 'package:netflix_clone/src/domain/entities/movie/movie_detail_entity.dart';
import 'package:netflix_clone/src/presenter/widgets/image/base_network_image.dart';

part 'widgets/actor_card.dart';
part 'widgets/tag_container.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({
    required this.movieDetail,
    super.key,
  });

  final MovieDetailEntity? movieDetail;

  @override
  Widget build(BuildContext context) {
    return _MovieDetailView(movieDetail: movieDetail);
  }
}

class _MovieDetailView extends StatelessWidget {
  const _MovieDetailView({required this.movieDetail});

  final MovieDetailEntity? movieDetail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 500,
            collapsedHeight: kToolbarHeight,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: BaseNetworkImage.originalImageSize(
                movieDetail?.posterPath,
                hasRadius: false,
              ),
            ),
          ),

          //* Body
          SliverToBoxAdapter(
            child: SizedBox(
              height:
                  1.sh - kToolbarHeight - MediaQuery.of(context).padding.top,
              width: 1.sw,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(12).r,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //* Title
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                movieDetail?.title ?? '',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              5.verticalSpace,
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      movieDetail?.voteAverage
                                              ?.toString()
                                              .substring(0, 3) ??
                                          '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    5.horizontalSpace,
                                    const Icon(Icons.star, size: 15),
                                    10.horizontalSpace,
                                    Text(
                                      '·',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w900,
                                          ),
                                    ),
                                    10.horizontalSpace,
                                    Text(
                                      DateFormat('yyyy').format(
                                        DateTime.tryParse(
                                              movieDetail?.releaseDate ?? '',
                                            ) ??
                                            DateTime.now(),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          20.verticalSpace,

                          //* Overview
                          Flexible(
                            child: SingleChildScrollView(
                              child: Text('${movieDetail?.overview}'),
                            ),
                          ),

                          20.verticalSpace,

                          //* Backdrop
                          Flexible(
                            child: BaseNetworkImage.originalImageSize(
                              movieDetail?.backdropPath,
                            ),
                          ),

                          20.verticalSpace,
                        ],
                      ),
                    ),
                  ),

                  //* Tags
                  SizedBox(
                    height: 40,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: movieDetail?.genreIds?.length ?? 0,
                      padding: const EdgeInsets.symmetric(horizontal: 12).r,
                      itemBuilder: (context, index) {
                        return _TagContainer(
                          '${movieDetail?.genreIds?[index].getGenreFromNumber()}',
                        );
                      },
                      separatorBuilder: (context, index) => 10.horizontalSpace,
                    ),
                  ),

                  20.verticalSpace,

                  //* Cast
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ).r,
                    child: Text(
                      'Cast',
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
