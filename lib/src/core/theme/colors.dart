import 'package:flutter/material.dart';

class AppThemeColors {
  const AppThemeColors({
    required this.primarySwatch,
    required this.primary,
    required this.secondary,
    required this.accent,
    required this.background,
    required this.backgroundDark,
    required this.disabled,
    required this.information,
    required this.success,
    required this.alert,
    required this.warning,
    required this.error,
    required this.text,
    required this.textOnPrimary,
    required this.border,
    required this.hint,
  });
  final MaterialColor primarySwatch;
  final Color primary;
  final Color secondary;
  final Color accent;
  final Color background;
  final Color backgroundDark;
  final Color disabled;
  final Color information;
  final Color success;
  final Color alert;
  final Color warning;
  final Color error;
  final Color text;
  final Color textOnPrimary;
  final Color border;
  final Color hint;

  AppThemeColors lerp(covariant dynamic other, double t) {
    if (other is! AppThemeColors) {
      return this;
    }
    return AppThemeColors(
      primarySwatch: primarySwatch,
      primary: Color.lerp(primary, other.primary, t)!,
      secondary: Color.lerp(secondary, other.secondary, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      background: Color.lerp(background, other.background, t)!,
      backgroundDark: Color.lerp(backgroundDark, other.backgroundDark, t)!,
      disabled: Color.lerp(disabled, other.disabled, t)!,
      information: Color.lerp(information, other.information, t)!,
      success: Color.lerp(success, other.success, t)!,
      alert: Color.lerp(alert, other.alert, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      border: Color.lerp(border, other.border, t)!,
      hint: Color.lerp(hint, other.hint, t)!,
    );
  }

  AppThemeColors copyWith({
    MaterialColor? primarySwatch,
    Color? primary,
    Color? secondary,
    Color? accent,
    Color? background,
    Color? backgroundDark,
    Color? disabled,
    Color? information,
    Color? success,
    Color? alert,
    Color? warning,
    Color? error,
    Color? text,
    Color? textOnPrimary,
    Color? border,
    Color? hint,
  }) {
    return AppThemeColors(
      primarySwatch: primarySwatch ?? this.primarySwatch,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      accent: accent ?? this.accent,
      background: background ?? this.background,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      disabled: disabled ?? this.disabled,
      information: information ?? this.information,
      success: success ?? this.success,
      alert: alert ?? this.alert,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      text: text ?? this.text,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      border: border ?? this.border,
      hint: hint ?? this.hint,
    );
  }
}

class AppColors {
  static const Color primaryRed = Color(0xFFDB0000); // #db0000
  static const Color black = Color(0xFF000000); // #000000
  static const Color white = Color(0xFFFFFFFF); // #ffffff
  static const Color gray = Color(0xFF808080); // #808080
  static const Color darkGray = Color(0xFF564D4D); // #564d4d
  static const Color deepRed = Color(0xFF831010); // #831010
  static const Color brightRed = Color(0xFFDF0707); // #df0707
  static const Color mediumRed = Color(0xFFBA0C0C); // #ba0c0c
  static const Color mutedRed = Color(0xFF980A0A); // #980a0a
  static const Color darkRed = Color(0xFF780909); // #780909
  static const Color nearBlack = Color(0xFF0B0000); // #0b0000
  static const Color vibrantRed = Color(0xFFC1071E); // #c1071e
  static const Color lightGray = Color(0xFFDEDEDE); // #dedede
  static const Color steelBlue = Color(0xFF43465E); // #43465e
  static const Color navyBlue = Color(0xFF131834); // #131834
}
