import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/en.dart';
import 'package:tsirbunenpottery/localization/fi.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/theme/app_theme.dart';

class FirebaseErrorApp extends StatelessWidget {
  const FirebaseErrorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: const AppTheme().themeData,
      home: const _FirebaseErrorApp(),
    );
  }
}

class _FirebaseErrorApp extends StatelessWidget {
  const _FirebaseErrorApp();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final fi = Fi().translate(Translation.firebaseInitError);
    final en = En().translate(Translation.firebaseInitError);
    
    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(fi, style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary)),
            Text(en, style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary)),
          ],
        ),
      ),
    );
  }
}
