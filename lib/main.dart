import 'package:flutter/material.dart';
import 'package:madmudmobile/app/blocs/blocs.dart';
import 'package:madmudmobile/app/tsirbunen_pottery_app/tsirbunen_pottery_app.dart';
import 'package:madmudmobile/theme/app_status_bar_color.dart';

void main() async {
  setAppStatusBarColor();
  WidgetsFlutterBinding.ensureInitialized();

  // Note: We use the getIt service locator to help us manage our dependencies and
  // to make bloc-to-bloc communication easier.
  prepareBlocs();

  runApp(const TsirbunenPotteryApp());
}
