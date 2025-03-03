import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

class Modal extends StatelessWidget {
  const Modal({
    required this.child,
    super.key,
    this.title,
  });
  static const Radius _borderRadius = Radius.circular(Sizes.p8);

  final String? title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: _borderRadius,
          topRight: _borderRadius,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _RowTitle(title),
          child,
        ],
      ),
    );
  }
}

class _RowTitle extends StatelessWidget {
  const _RowTitle(this.text);

  final String? text;

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return const SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.p12,
        horizontal: Sizes.p16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text ?? '',
            style: context.appTheme.typographies.heading.copyWith(
              color: context.appTheme.colors.textOnPrimary,
            ),
          ),
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              width: Sizes.p32,
              height: Sizes.p32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[700],
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
