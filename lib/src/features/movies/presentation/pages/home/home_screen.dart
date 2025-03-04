import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/injector.dart';
import 'package:netflix_clone/src/core/common_widgets/buttons/retry_button.dart';
import 'package:netflix_clone/src/core/config/constants/app_constants.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/category_movie_list.dart';
import 'package:netflix_clone/src/features/movies/presentation/states/movie/export_movie_blocs.dart';
import 'package:shimmer/shimmer.dart';

part '../../_widgets/movies/ranked_movie_card.dart';
part '../../_widgets/movies/shimmer_movie_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categoryTitle = [
    'Netflix Originals',
    'Top 10 in Nigeria Today',
    'New Releases',
    'Trending Now',
    'Action Movies',
    'Comedy Movies',
    'Horror Movies',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetPopularMoviesBloc>(
          create: (context) => injector<GetPopularMoviesBloc>()
            ..add(
              const FetchPopularMovies(),
            ),
        ),
        BlocProvider<GetTopRatedMoviesBloc>(
          create: (context) => injector<GetTopRatedMoviesBloc>()
            ..add(
              const FetchTopRatedMovies(),
            ),
        ),
      ],
      child: SingleChildScrollView(
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
                return BlocBuilder<GetPopularMoviesBloc, GetPopularMoviesState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return switch (state) {
                      GetPopularMoviesInitial() => CategoryMovieList(
                          categoryTitle: categoryTitle[index],
                          movies: null,
                          whenScrollBottom: () {},
                          hasReachedMax: false,
                        ),
                      GetPopularMoviesLoading() => CategoryMovieList(
                          categoryTitle: categoryTitle[index],
                          movies: null,
                          whenScrollBottom: () {},
                          hasReachedMax: false,
                        ),
                      GetPopularMoviesError() => Padding(
                          padding: const EdgeInsets.all(12).r,
                          child: RetryButton(
                            text: state.message,
                            retryAction: () => context
                                .read<GetPopularMoviesBloc>()
                                .add(const FetchPopularMovies()),
                          ),
                        ),
                      GetPopularMoviesLoaded() => CategoryMovieList(
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
      ),
    );
  }
}
