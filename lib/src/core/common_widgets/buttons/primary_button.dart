import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/app_sizes.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

/// Primary button based on [ElevatedButton]. Useful for CTAs in the app.
class PrimaryButton extends StatelessWidget {
  /// Create a PrimaryButton.
  /// if [isLoading] is true, a loading indicator will be displayed instead of
  /// the text.
  const PrimaryButton({
    required this.text,
    super.key,
    this.isLoading = false,
    this.onPressed,
  });
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.p48,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                text,
                textAlign: TextAlign.center,
                style: context.appTheme.typographies.headingSmall.copyWith(
                  color: context.appTheme.colors.error,
                ),
              ),
      ),
    );
  }
}
