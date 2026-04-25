import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/environment/app_environment.dart';

class EnvironmentScope extends InheritedWidget {
  final Environment environment;

  const EnvironmentScope({
    super.key,
    required this.environment,
    required super.child,
  });

  static Environment of(BuildContext context) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<EnvironmentScope>();
    assert(scope != null, 'No EnvironmentScope found in widget tree');
    return scope!.environment;
  }

  @override
  bool updateShouldNotify(EnvironmentScope oldWidget) =>
      environment != oldWidget.environment;
}
