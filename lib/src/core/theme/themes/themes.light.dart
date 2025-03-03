import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/themes.dart';

class LightAppTheme extends AppTheme {
  const LightAppTheme()
      : super(
          name: 'light',
          brightness: Brightness.light,
          colors: const AppThemeColors(
            primarySwatch: Colors.red,
            primary: Color(0xFFDB0000),
            secondary: Color(0xFF43465E),
            accent: Color(0xFFF57C00),
            background: Color(0xFFFFFFFF),
            backgroundDark: Color(0xFFF5F5F5),
            disabled: Color(0x64303943),
            information: Color(0xFF6C79DB),
            success: Color(0xFF78C850),
            alert: Color(0xFFF6C747),
            warning: Color(0xFFFF9D5C),
            error: Color(0xFFFA6555),
            text: Color(0xFF303943),
            textOnPrimary: Color(0xFFFFFFFF),
            border: Color(0xFFEBEBEB),
            hint: Color(0x99303943),
          ),
        );
}
