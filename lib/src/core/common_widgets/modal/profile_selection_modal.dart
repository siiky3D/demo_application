import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/common_widgets/modal/modal.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/features/authentication/data/profile_managements.dart';
import 'package:netflix_clone/src/features/authentication/domain/entities/profile_management/profile_detail.dart';
import 'package:netflix_clone/src/features/authentication/presentation/_widgets/selection_card.dart';

class ProfileSelectionModal extends StatelessWidget {
  const ProfileSelectionModal({super.key});

  Widget _buildProfileSelectionCard(ProfileDetailEntity profiles) {
    return ProfileSelectionCard(profiles);
  }

  Widget _buildProfiles(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(profiles.length, (index) {
              return _buildProfileSelectionCard(profiles[index]);
            }),
          ),
        ),
        gapH24,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.edit_square,
              size: Sizes.p32,
              color: Colors.white,
            ),
            gapW4,
            Text(
              'จัดการโปรไฟล์',
              style: TextStyle(
                fontSize: Sizes.p20,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Modal(
      title: 'Switch Profile',
      child: _buildProfiles(context),
    );
  }
}
