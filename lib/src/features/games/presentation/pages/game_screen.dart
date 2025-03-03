import 'package:flutter/material.dart';
import 'package:netflix_clone/src/features/games/presentation/_widgets/game_card_widget.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        GameInfoCard(
          gameName: 'Puzzle Snake Escape',
          gameGenre: 'Puzzle',
          imageUrl:
              'https://images.unsplash.com/photo-1609050470944-59dd791705ac?q=80&w=1587&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D ',
        ),
      ],
    );
  }
}
