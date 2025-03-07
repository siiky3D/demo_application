import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/constants/const.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/presenter/widgets/modal/modal.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/profile_detail/profile_detail.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_selector.dart';
import 'package:netflix_clone/src/features/auth/presentation/widgets/profile_selection/profile_card.dart';

class ProfileSelectionModal extends StatelessWidget {
  const ProfileSelectionModal({super.key});

  Widget _buildProfileSelectionCard(ProfileDetailEntity profiles, Size size) {
    return ProfileCard(
      profiles,
      size: const Size(60, 60),
      margin: const EdgeInsets.only(right: 12),
    );
  }

  Widget _buildListProfiles(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final profileBloc = context.read<ProfilesBloc>();

    void onProfilePress(ProfileDetailEntity profile) {
      profileBloc.add(ProfilesSelectedChange(profileId: profile.id ?? 0));

      context.pushNamed(AppRoute.movieDetail.name);
    }

    return NumberOfProfilesSelector((numberOfProfiles) {
      return Column(
        children: [
          SizedBox(
            height: size.height * 0.15,
            child: Center(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(numberOfProfiles, (index) {
                  return GestureDetector(
                    onTap: () => onProfilePress,
                    child: _buildProfileSelectionCard(
                      profiles[index],
                      Size(size.width * 0.18, size.height * 0.08),
                    ),
                  );
                }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: Sizes.p16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(
                  Icons.edit,
                  size: Sizes.p32,
                  color: AppColors.white,
                ),
                gapW6,
                Text(
                  locale.manageProfile,
                  style: context.appTheme.typographies.headingSmall.copyWith(
                    color: context.appTheme.colors.textOnPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Modal(
      title: locale.switchProfile,
      child: _buildListProfiles(context),
    );
  }
}
