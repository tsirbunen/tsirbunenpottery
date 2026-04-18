import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

abstract final class AppIcons {
  // Drawer navigation routes
  static const IconData home = Symbols.home_rounded;
  static const IconData pieces = Symbols.local_cafe_rounded;
  static const IconData designs = Symbols.style_rounded;
  static const IconData categories = Symbols.category_rounded;
  static const IconData collections = Symbols.collections_rounded;
  static const IconData contact = Symbols.email_rounded;

  // App bar actions
  static const IconData back = Symbols.arrow_back_rounded;
  static const IconData menu = Symbols.menu_rounded;
  static const IconData language = Symbols.language_rounded;

  // Grid / list navigation
  static const IconData forward = Symbols.arrow_forward_ios_rounded;
  static const IconData expandUp = Symbols.keyboard_arrow_up_rounded;
  static const IconData expandDown = Symbols.keyboard_arrow_down_rounded;

  // Misc
  static const IconData email = Symbols.email_rounded;
  static const IconData noImage = Symbols.grid_view_rounded;
}
