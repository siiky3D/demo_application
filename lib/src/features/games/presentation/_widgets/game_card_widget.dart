import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

class GameInfoCard extends StatelessWidget {
  const GameInfoCard({
    required this.gameName,
    required this.gameGenre,
    required this.imageUrl,
    super.key,
  });
  final String gameName;
  final String gameGenre;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withOpacity(0),
                  AppColors.black.withOpacity(1),
                ],
                stops: const [0.8, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.p32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.gamepad,
                  color: context.colors.textOnPrimary,
                  size: 40,
                ),
                gapH16,
                Text(
                  gameName,
                  style: context.appTheme.typographies.headingSmall.copyWith(
                    color: context.colors.textOnPrimary,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
                gapH4,
                // Game Genre
                Text(
                  gameGenre,
                  style: context.appTheme.typographies.body.copyWith(
                    color: context.colors.textOnPrimary,
                    shadows: [
                      Shadow(
                        offset: const Offset(2, 2),
                        blurRadius: 3,
                        color: AppColors.black.withOpacity(0.5),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
