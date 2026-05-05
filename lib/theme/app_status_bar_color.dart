import 'package:flutter/services.dart';
import 'package:tsirbunenpottery/theme/colors.dart';

// Called before runApp() — no BuildContext or theme available, so colors must be raw constants.
void setAppStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: pale,
      systemNavigationBarColor: pale,
    ),
  );
}
