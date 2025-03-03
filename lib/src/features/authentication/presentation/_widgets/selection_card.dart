import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Image.asset(profiles.image),
          ),
        ),
        gapH12,
        Text(
          profiles.name,
          style: const TextStyle(
            fontSize: Sizes.p16,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
