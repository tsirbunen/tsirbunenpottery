import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/theme/colors.dart';

class AppTheme {
  const AppTheme();

  ThemeData get themeData {
    return ThemeData(
      fontFamily: 'Quicksand',
      textTheme: _textTheme(),
      colorScheme: _colorScheme(),
    );
  }

  TextTheme _textTheme() {
    return const TextTheme(
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: background,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: veryDark,
      ),
      headlineSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: veryDark,
      ),
      labelMedium: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: veryDark,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: veryDark,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: veryDark,
      ),
    );
  }

  ColorScheme _colorScheme() {
    return ColorScheme.fromSeed(
      surface: background,
      seedColor: veryDark,
      primary: veryDark,
      secondary: medium,
      tertiary: pale,
      onTertiary: extremelyPale,
    );
  }
}
