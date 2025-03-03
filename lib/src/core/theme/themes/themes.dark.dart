import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/theme/colors.dart';
import 'package:netflix_clone/src/core/theme/styles.dart';
import 'package:netflix_clone/src/core/theme/themes.dart';

class DarkAppTheme extends AppTheme {
  const DarkAppTheme()
      : super(
          name: 'dark',
          brightness: Brightness.dark,
          colors: const AppThemeColors(
            primarySwatch: Colors.red,
            primary: Color(0xFFDB0000),
            secondary: Color(0xFF43465E),
            accent: Color(0xFFC1071E),
            background: Color(0xFF131834),
            backgroundDark: Color(0xFF0B0000),
            disabled: Color(0x64303943),
            information: Color(0xFF6C79DB),
            success: Color(0xFF78C850),
            alert: Color(0xFFF6C747),
            warning: Color(0xFFFF9D5C),
            error: Color(0xFFFA6555),
            text: Color(0xFFFFFFFF),
            textOnPrimary: Color(0xFFFFFFFF),
            border: Color(0x33FFFFFF),
            hint: Color(0x99FFFFFF),
          ),
          styles: const AppThemeStyles(
            cardShadow: [
              BoxShadow(
                color: Color(0x4D000000),
                offset: Offset(0, 8),
                blurRadius: 23,
              ),
            ],
          ),
        );
}
