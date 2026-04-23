import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/theme/colors.dart' as app_colors;

class FirebaseErrorApp extends StatelessWidget {
  const FirebaseErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: app_colors.background,
        body: const Center(
          child: Text(
            'Could not connect. Please refresh and try again.',
            style: TextStyle(color: app_colors.medium, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
