import 'package:flutter/material.dart';

extension TextStyleEmphasis on TextStyle {
  TextStyle get emphasized => copyWith(fontWeight: AppTypography.selectedPageFontWeight);
}

abstract final class AppTypography {
  static const double tradeNameFontSize = 15.0;
  static const FontWeight tradeNameFontWeight = FontWeight.w900;
  static const double descriptionFontSize = 12.0;
  static const FontWeight descriptionFontWeight = FontWeight.w500;
  static const FontWeight selectedPageFontWeight = FontWeight.w800;
  static const double drawerItemFontSize = 16.0;
  static const double defaultIconWeight = 300.0;
  static const double hoveredIconWeight = 600.0;
  static const double selectedIconWeight = 500.0;
}
