import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:netflix_clone/src/core/common_widgets/modal/profile_selection_modal.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';

class ProfileManagementScreen extends StatelessWidget {
  const ProfileManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    void showProfileModal() {
      if (context.mounted) {
        showModalBottomSheet<void>(
          context: context,
          backgroundColor: Colors.grey[800],
          builder: (context) => const ProfileSelectionModal(),
        );
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/netflix_symbol.png',
              width: 50,
              height: 50,
            ),
            IconButton(
              onPressed: showProfileModal,
              icon: SvgPicture.asset(
                'assets/svgs/stat_minus_1.svg',
                height: size.height * 0.03,
              ),
            ),
          ],
        ),
        gapH16,
        Container(
          width: size.width / 1.25,
          height: size.height / 14,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(Sizes.p6),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.notifications,
                        size: Sizes.p32,
                        color: Colors.white,
                      ),
                      gapW4,
                      Text(
                        'การแจ้งเตือน',
                        style: TextStyle(
                          fontSize: Sizes.p20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        'ดูทั้งหมด',
                        style: TextStyle(
                          fontSize: Sizes.p16,
                          fontWeight: FontWeight.w900,
                          color: Colors.grey[200],
                        ),
                      ),
                      IconButton(
                        onPressed: showProfileModal,
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
