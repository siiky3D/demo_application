import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/theme/extensions.dart';

enum ButtonType {
  elevated,
  outline,
}

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.text,
    required this.textStyle,
    super.key,
    this.isLoading = false,
    this.onPressed,
    this.buttonStyle,
    this.type = ButtonType.elevated,
    this.prefixIcon,
  });
  final String text;
  final bool isLoading;
  final VoidCallback? onPressed;
  final TextStyle textStyle;
  final ButtonStyle? buttonStyle;
  final ButtonType type;
  final IconData? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: type == ButtonType.elevated
          ? ElevatedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (prefixIcon != null)
                          Icon(
                            prefixIcon,
                            size: 32,
                            color: context.colors.background,
                          ),
                        Flexible(
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: textStyle,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
            )
          : OutlinedButton(
              style: buttonStyle,
              onPressed: onPressed,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (prefixIcon != null)
                          Icon(
                            prefixIcon,
                            size: 34,
                            color: context.colors.textOnPrimary,
                          ),
                        Flexible(
                          child: Text(
                            text,
                            textAlign: TextAlign.center,
                            style: textStyle,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    ),
            ),
    );
  }
}
