import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/common_widgets/modal/modal.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/authentication/data/profile_managements.dart';
import 'package:netflix_clone/src/features/authentication/domain/entities/profile_management/profile_detail.dart';
import 'package:netflix_clone/src/features/authentication/presentation/_widgets/selection_card.dart';
import 'package:netflix_clone/src/features/authentication/presentation/states/profile_selection/profile_selection_cubit.dart';

class ProfileSelectionModal extends StatelessWidget {
  const ProfileSelectionModal({super.key});

  Widget _buildProfileSelectionCard(ProfileDetailEntity profiles) {
    return ProfileSelectionCard(profiles);
  }

  Widget _buildProfiles(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.15,
          child: Center(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(profiles.length, (index) {
                return GestureDetector(
                  onTap: () {
                    context.read<ProfileSelectionCubit>().updateProfile(
                          profiles[index].image,
                          profiles[index].name,
                        );

                    context.goNamed(AppRoute.home.name);
                  },
                  child: _buildProfileSelectionCard(profiles[index]),
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
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    return Modal(
      title: locale.switchProfile,
      child: _buildProfiles(context),
    );
  }
}
