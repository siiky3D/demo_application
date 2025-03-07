import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/gen/assets.gen.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/config/constants/const.dart';
import 'package:netflix_clone/src/core/config/routes/app_router.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/presenter/widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_bloc.dart';
import 'package:netflix_clone/src/features/auth/presentation/states/profiles/profiles_selector.dart';
import 'package:netflix_clone/src/features/auth/presentation/widgets/profile_selection/profile_card.dart';

class ProfileSelectionScreen extends StatelessWidget {
  const ProfileSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final size = MediaQuery.sizeOf(context);
    final profileBloc = context.read<ProfilesBloc>()
      ..add(ProfilesLoadStarted());

    Widget buildProfileSelectionCard(ProfileDetailEntity profiles, Size size) {
      return ProfileCard(
        profiles,
        size: const Size(90, 80),
      );
    }

    void onProfilePress(ProfileDetailEntity profile) {
      if (profile.id == null) return;
      profileBloc.add(ProfilesSelectedChange(profileId: profile.id!));
      context.pushNamed(AppRoute.home.name);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: context.colors.backgroundDark,
        appBar: AppBar(
          centerTitle: true,
          title: Assets.images.netflixLogo.image(
            width: MediaQuery.sizeOf(context).width / 2.8,
            fit: BoxFit.cover,
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.edit),
            ),
          ],
        ),
        body: ProfilesStateStatusSelector((status) {
          switch (status) {
            case ProfilesStatus.initial:
            case ProfilesStatus.loading:
              return const BaseIndicator();
            case ProfilesStatus.success:
              return _buildProfiles(
                locale,
                context,
                size,
                buildProfileSelectionCard,
                onProfilePress,
              );
            case ProfilesStatus.failure:
              return const BaseIndicator();
          }
        }),
      ),
    );
  }

  Center _buildProfiles(
    AppLocalizations locale,
    BuildContext context,
    Size size,
    Widget Function(ProfileDetailEntity profiles, Size size)
        buildProfileSelectionCard,
    void Function(ProfileDetailEntity profile) onProfilePress,
  ) {
    return Center(
      child: Column(
        children: [
          //TODO: delete spacer later
          const Spacer(),
          Text(
            locale.selectProfile,
            style: context.typographies.bodyExtraLarge,
          ),
          gapH12,
          NumberOfProfilesSelector((numberOfProfiles) {
            if (numberOfProfiles == 0) return const BaseIndicator();
            return SizedBox(
              height: size.height / 2.1,
              width: size.width / 1.3,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(20),
                itemCount: numberOfProfiles,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return ProfileSelector(index, (profile, _) {
                    return InkWell(
                      child: buildProfileSelectionCard(
                        profiles[index],
                        Size(size.width * 0.25, size.height * 0.1),
                      ),
                      onTap: () => onProfilePress(profile),
                    );
                  });
                },
              ),
            );
          }),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
