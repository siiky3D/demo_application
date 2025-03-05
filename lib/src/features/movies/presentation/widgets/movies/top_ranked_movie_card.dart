part of '../../pages/home/home_screen.dart';

class _TopRankedMovieCard extends StatefulWidget {
  const _TopRankedMovieCard();

  @override
  State<_TopRankedMovieCard> createState() => _TopRankedMovieCardState();
}

class _TopRankedMovieCardState extends State<_TopRankedMovieCard> {
  final addedFavorite = ValueNotifier<bool>(false);

  MoviesBloc get popularMovieBloc => context.read<MoviesBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      popularMovieBloc.add(
        const MoviesloadStarted(
          movieType: MovieType.popular,
        ),
      );
    });
  }

  void _onTopRankedMoviePress(MovieDetailEntity movie) {
    popularMovieBloc.add(
      MoviesSelectChanged(movieId: movie.id.toString()),
    );

    context.push(AppRoute.movieDetail.name);
  }

  @override
  Widget build(BuildContext context) {
    return MoviesStateStatusSelector((status) {
      switch (status) {
        case MovieStatus.initial:
        case MovieStatus.loading:
          return const BaseIndicator();
        case MovieStatus.success:
        case MovieStatus.loadMore:
          return _buildCard();
        case MovieStatus.failure:
          return _buildError();
      }
    });
  }

  Widget _buildCard() {
    final size = MediaQuery.sizeOf(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(right: 8).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: context.colors.border,
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: MovieSelector(
              Random().nextInt(50),
              (movie, _) {
                return InkWell(
                  onTap: () => _onTopRankedMoviePress(movie),
                  child: Stack(
                    children: [
                      _buildImage(movie, size),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: _buildButton(),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildButton() {
    final locale = AppLocalizations.of(context);
    return Container(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PrimaryButton(
              text: locale.play,
              buttonStyle: context.appTheme.styles.buttonMedium,
              textStyle: context.appTheme.typographies.headingSmall.copyWith(
                color: context.colors.background,
              ),
              prefixIcon: Icons.play_arrow,
              onPressed: () {
                final snackBar = SnackBar(
                  backgroundColor: context.colors.primary,
                  content: Text(
                    locale.sorryThisFunctionIsNotAvailable,
                    style: context.appTheme.typographies.bodyLarge.copyWith(
                      color: context.colors.textOnPrimary,
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            ),
          ),
          gapW8,
          Expanded(
            child: ValueListenableBuilder<bool>(
              valueListenable: addedFavorite,
              builder: (context, value, ___) {
                return PrimaryButton(
                  text: locale.myList,
                  buttonStyle: context.appTheme.styles.buttonSmall,
                  type: ButtonType.outline,
                  textStyle:
                      context.appTheme.typographies.headingSmall.copyWith(
                    color: context.colors.textOnPrimary,
                  ),
                  prefixIcon: value ? Icons.check : Icons.add,
                  onPressed: () {
                    addedFavorite.value = !value;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(MovieDetailEntity movie, Size size) {
    return Stack(
      children: [
        MovieImage(
          movie: movie,
          size: Size(size.width * 0.7.w, size.height * 0.45.h),
        ),
        Positioned.fill(
          top: size.height * 0.15,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.1),
                  Colors.black.withOpacity(0.3),
                  Colors.black.withOpacity(0.6),
                  Colors.black.withOpacity(0.8),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildError() {
    return Container(
      padding: const EdgeInsets.only(bottom: 28),
      alignment: Alignment.center,
      child: const Icon(
        Icons.warning_amber_rounded,
        size: 60,
        color: Colors.black26,
      ),
    );
  }
}
