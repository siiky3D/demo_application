import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/core/widgets/buttons/retry_button.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/movie/export_movie_blocs.dart';
import 'package:netflix_clone/src/features/movies/presentation/widgets/movies/category_movie_list.dart';
import 'package:shimmer/shimmer.dart';

part '../../widgets/movies/ranked_movie_card.dart';
part '../../widgets/movies/shimmer_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categoryTitle = [
    'Popular',
    'Top Rated',
    'Now Playing',
    'Upcoming',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          RankedMovieCard(
            size: size,
            imageUrl: AppConstants.movieImage2,
          ),
          gapH16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryTitle.length,
            itemBuilder: (context, index) {
              return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                buildWhen: (previous, current) => previous != current,
                builder: (context, state) {
                  return switch (state) {
                    PopularMoviesInitial() => CategoryMovieList(
                        categoryTitle: categoryTitle[index],
                        movies: null,
                        whenScrollBottom: () {},
                        hasReachedMax: false,
                      ),
                    PopularMoviesLoading() => CategoryMovieList(
                        categoryTitle: categoryTitle[index],
                        movies: null,
                        whenScrollBottom: () {},
                        hasReachedMax: false,
                      ),
                    PopularMoviesLoadingMore() => CategoryMovieList(
                        categoryTitle: categoryTitle[index],
                        movies: null,
                        whenScrollBottom: () {},
                        hasReachedMax: false,
                      ),
                    PopularMoviesFailure() => Padding(
                        padding: const EdgeInsets.all(12).r,
                        child: RetryButton(
                          text: state.message,
                          retryAction: () => context
                              .read<PopularMoviesBloc>()
                              .add(const GetPopularMoviesloadStarted()),
                        ),
                      ),
                    PopularMoviesSuccess() => CategoryMovieList(
                        categoryTitle: categoryTitle[index],
                        movies: state.movies,
                        whenScrollBottom: () {},
                        hasReachedMax: false,
                      ),
                  };
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
