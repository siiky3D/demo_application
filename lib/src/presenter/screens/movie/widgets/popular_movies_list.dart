part of '../home_screen.dart';

class _PopularMovieList extends StatefulWidget {
  const _PopularMovieList();

  @override
  State<_PopularMovieList> createState() => _PopularMovieListState();
}

class _PopularMovieListState extends State<_PopularMovieList> {
  final ScrollController _scrollController = ScrollController();
  MoviesBloc get movieBloc => context.read<MoviesBloc>();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      _scrollController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
  }

  void _onScroll() {
    final isBottom = _scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent;
    if (isBottom) {
      movieBloc.add(const MoviesLoadByType(movieType: MovieType.popular));
    }
  }

  void _onMoviePress(MovieDetailEntity movie) {
    movieBloc.add(
      MoviesSelectChanged(movieId: movie.id.toString()),
    );
    context.pushNamed(
      AppRoute.movieDetail.name,
      pathParameters: {'id': movie.id.toString()},
      extra: movie,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MoviesStateStatusSelector(
      (status) {
        switch (status) {
          case MovieStatus.initial:
          case MovieStatus.loading:
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => ShimmerPlaceholder(
                    width: MediaQuery.sizeOf(context).width * 0.3,
                    height: MediaQuery.sizeOf(context).height * 0.15,
                    margin: const EdgeInsets.only(right: 8),
                  ),
                ),
              ),
            );
          case MovieStatus.success:
            return _buildList();
          case MovieStatus.failure:
            return _buildError();
        }
      },
    );
  }

  Widget _buildList() {
    return NumberOfMoviesSelector((numberOfPopularMovies) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16).w,
        child: MoviesList(
          scrollController: _scrollController,
          onMoviePress: _onMoviePress,
          itemCount: numberOfPopularMovies,
          itemBuilder: (context, index) {
            return MovieSelector(
              index,
              (movie, _) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: MovieCard(
                    movie,
                    onPress: () => _onMoviePress(movie),
                  ),
                );
              },
            );
          },
        ),
      );
    });
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
