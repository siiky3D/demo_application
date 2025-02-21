import 'package:auto_route/auto_route.dart';
import 'package:demo_app_temp/src/core/config/routes/app_router.gr.dart';
import 'package:demo_app_temp/src/core/theme/cubit/theme_cubit.dart';
import 'package:demo_app_temp/src/features/movies/presentation/states/movie/get_popular_movies/bloc/get_popular_movies_bloc.dart';
import 'package:demo_app_temp/src/features/movies/presentation/states/movie/get_top_rated_movies/get_top_rated_movies_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final bloc = GetIt.I<GetPopularMoviesBloc>()
              ..add(const FetchPopularMovies());
            return bloc;
          },
        ),
        BlocProvider(
          create: (context) {
            final bloc = GetIt.I<GetTopRatedMoviesBloc>()
              ..add(const FetchTopRatedMovies());
            return bloc;
          },
        ),
      ],
      child: AutoTabsScaffold(
        resizeToAvoidBottomInset: true,
        lazyLoad: false,
        animationDuration: const Duration(milliseconds: 100),
        navigatorObservers: () => [HeroController()],
        appBarBuilder: (context, tabsRouter) {
          return AppBar(
            title: Text(tabsRouter.current.title.call(context)),
            actions: [
              IconButton(
                onPressed: () => context
                    .read<ThemeCubit>()
                    .toggleTheme(brightness: Theme.of(context).brightness),
                icon: Icon(
                  Theme.of(context).brightness == Brightness.dark
                      ? Icons.light_mode_outlined
                      : Icons.dark_mode_outlined,
                ),
              ),
            ],
            elevation: 0,
          );
        },
        routes: const [
          MoviesListingRoute(),
          GamesRoute(),
          NewAndHotRoute(),
          ProfileSelectionRoute(),
        ],
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            onTap: tabsRouter.setActiveIndex,
            currentIndex: tabsRouter.activeIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.videogame_asset),
                label: 'Games',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.whatshot),
                label: 'New & Hot',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
