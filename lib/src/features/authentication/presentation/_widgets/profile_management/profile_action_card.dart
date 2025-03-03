import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/l10n/l10n.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

class ProfileActionCard extends StatelessWidget {
  const ProfileActionCard({
    required this.size,
    required this.title,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
    this.desc,
    this.isDescription = false,
    this.isViewAll = false,
    super.key,
  });

  final Size size;
  final String title;
  final String? desc;
  final void Function() onPressed;
  final bool isDescription;
  final bool isViewAll;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    return Container(
      width: size.width / 1.25,
      // height: size.height / 14,
      decoration: BoxDecoration(
        color: AppColors.brightRed,
        borderRadius: BorderRadius.circular(Sizes.p6),
        border: Border.all(
          color: AppColors.lightGray.withOpacity(0.5),
        ),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (prefixIcon != null)
                    Icon(
                      prefixIcon,
                      size: Sizes.p32,
                      color: AppColors.white,
                    ),
                  gapW4,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: Sizes.p20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      if (isDescription)
                        LayoutBuilder(
                          builder: (context, constraints) => ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: constraints.maxWidth,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  desc ?? '',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: context.appTheme.typographies.caption
                                      .copyWith(
                                    color: Colors.grey[200],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  if (isViewAll)
                    Text(
                      locale.viewAll,
                      style: TextStyle(
                        fontSize: Sizes.p16,
                        fontWeight: FontWeight.w900,
                        color: Colors.grey[200],
                      ),
                    ),
                  if (suffixIcon != null)
                    IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        suffixIcon,
                        color: AppColors.white,
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
