import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/features/games/presentation/widgets/game_card_widget.dart';
import 'package:netflix_clone/src/features/movies/presentation/widgets/movies/list/category_movie_list.dart';

class GamesScreen extends StatelessWidget {
  GamesScreen({super.key});

  final List<String> categoryTitle = [
    'Mobile Games',
    'PC Games',
    'Console Games',
    'VR Games',
    'Board Games',
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const GameInfoCard(
            gameName: 'Puzzle Snake Escape',
            gameGenre: 'Puzzle',
            imageUrl:
                'https://images.unsplash.com/photo-1609050470944-59dd791705ac?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D ',
          ),
          gapH16,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryMovieList(
                categoryTitle: categoryTitle[index],
                movies: null,
                whenScrollBottom: () {},
                hasReachedMax: false,
              );
            },
          ),
        ],
      ),
    );
  }
}
