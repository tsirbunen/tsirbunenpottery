import 'package:flutter/material.dart';
import 'package:madmudmobile/app/mad_mud_app.dart';
import 'package:madmudmobile/theme/app_status_bar_color.dart';

void main() async {
  setAppStatusBarColor();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MadMudApp());
}
