import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';
import 'package:netflix_clone/src/core/widgets/image/profile_image.dart';
import 'package:netflix_clone/src/features/auth/domain/entities/export_entities.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
    this.profile, {
    required this.size,
    this.onPress,
    super.key,
  });

  final ProfileDetailEntity profile;
  final void Function()? onPress;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width.w,
          height: size.height.h,
          margin: const EdgeInsets.only(right: 8).w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.grey[300],
              child: InkWell(
                onTap: onPress,
                splashColor: Colors.white10,
                highlightColor: Colors.white10,
                child: Stack(
                  children: [
                    _buildProfile(),
                  ],
                ),
              ),
            ),
          ),
        ),
        gapH12,
        Text(
          profile.name ?? '',
          style: context.appTheme.typographies.captionLarge.copyWith(
            color: AppColors.lightGray,
          ),
        ),
      ],
    );
  }

  Widget _buildProfile() {
    return Positioned.fill(
      child: ProfileImage(
        profile: profile,
        size: Size(size.width, size.height),
      ),
    );
  }
}
