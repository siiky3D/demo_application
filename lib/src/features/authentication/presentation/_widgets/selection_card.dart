import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/authentication/domain/entities/export_entities.dart';

class ProfileSelectionCard extends StatelessWidget {
  const ProfileSelectionCard(this.profiles, {super.key});

  final ProfileDetailEntity profiles;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size.width * 0.18,
          height: size.height * 0.08,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: Sizes.p6),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(profiles.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        gapH12,
        Text(
          profiles.name,
          style: context.appTheme.typographies.captionLarge.copyWith(
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }
}
