import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/src/core/common_widgets/modal/profile_selection_modal.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/features/authentication/presentation/_widgets/profile_management/profile_action_card.dart';
import 'package:netflix_clone/src/features/authentication/presentation/states/profile_selection/profile_selection_cubit.dart';
import 'package:netflix_clone/src/features/movies/presentation/_widgets/movies/category_movie_list.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final myCategoryTitle = <String>[
      'My List',
      'Continue Watching',
      'Top Picks for You',
      'Popular on Netflix',
      'Trending Now',
    ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<ProfileSelectionCubit, List<String>>(
                builder: (context, state) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.white,
                      image: DecorationImage(
                        image: AssetImage(state[0]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
          BlocBuilder<ProfileSelectionCubit, List<String>>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (state[1].startsWith('assets/'))
                    Image.asset(
                      state[1],
                      width: 30,
                      height: 30,
                    )
                  else
                    Text(
                      state[1],
                      style: context.appTheme.typographies.heading.copyWith(
                        color: context.appTheme.colors.textOnPrimary,
                      ),
                    ),
                  IconButton(
                    onPressed: showProfileModal,
                    icon: SvgPicture.asset(
                      'assets/svgs/stat_minus_1.svg',
                      height: size.height * 0.03,
                    ),
                  ),
                ],
              );
            },
          ),
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
          gapH24,
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return CategoryMovieList(
                categoryTitle: myCategoryTitle[index],
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
