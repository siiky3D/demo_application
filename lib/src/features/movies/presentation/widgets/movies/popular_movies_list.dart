part of '../../pages/home/home_screen.dart';

class _MovieList extends StatefulWidget {
  const _MovieList({required this.movieType});

  final MovieType movieType;

  @override
  State<_MovieList> createState() => _MovieListState();
}

class _MovieListState extends State<_MovieList> {
  final ScrollController _scrollController = ScrollController();
  MoviesBloc get movieBloc => context.read<MoviesBloc>();

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() {
      movieBloc.add(
        MoviesloadStarted(
          movieType: widget.movieType,
        ),
      );
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
      movieBloc.add(
        MoviesloadStarted(
          movieType: widget.movieType,
        ),
      );
    }
  }

  void _onMoviePress(MovieDetailEntity movie) {
    movieBloc.add(
      MoviesSelectChanged(movieId: movie.id.toString()),
    );
    context.push(AppRoute.movieDetail.name);
  }

  @override
  Widget build(BuildContext context) {
    return MoviesStateStatusSelector(
      (status) {
        switch (status) {
          case MovieStatus.initial:
          case MovieStatus.loading:
            return const BaseIndicator();
          case MovieStatus.success:
          case MovieStatus.loadMore:
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
          onLoadMore: () => movieBloc.add(
            MoviesloadStarted(
              movieType: widget.movieType,
            ),
          ),
          onMoviePress: _onMoviePress,
          itemCount: numberOfPopularMovies,
          itemBuilder: (context, index) {
            return MovieSelector(
              index,
              (movie, _) {
                return SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  child: MovieCard(movie, onPress: () => _onMoviePress(movie)),
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
