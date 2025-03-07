import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/core/widgets/modal/profile_selection_modal.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_selector.dart';
import 'package:netflix_clone/src/features/auth/presentation/widgets/profile_management/profile_action_card.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final locale = AppLocalizations.of(context);

    void showProfileModal() {
      if (context.mounted) {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: AppColors.darkOliveGreen,
          builder: (context) => const ProfileSelectionModal(),
        );
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          CurrentProfilesSelector((profile) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppColors.white,
                    image: DecorationImage(
                      image: AssetImage(
                        profile.image ?? Assets.images.netflixProfile1.path,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            );
          }),
          CurrentProfilesSelector((profile) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  profile.name ?? 'John doe',
                  style: context.appTheme.typographies.heading.copyWith(
                    color: context.appTheme.colors.textOnPrimary,
                  ),
                ),
                IconButton(
                  onPressed: showProfileModal,
                  icon: SvgPicture.asset(
                    Assets.images.netflixProfile1.path,
                    height: size.height * 0.03,
                  ),
                ),
              ],
            );
          }),
          gapH16,
          ProfileActionCard(
            isViewAll: true,
            size: size,
            title: locale.notifications,
            onPressed: showProfileModal,
            prefixIcon: Icons.notifications,
            suffixIcon: Icons.arrow_forward_ios,
          ),
          gapH24,
          ProfileActionCard(
            isDescription: true,
            size: size,
            title: locale.downloaded,
            desc: locale.downloadedDesc,
            onPressed: showProfileModal,
            prefixIcon: Icons.download,
            suffixIcon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
