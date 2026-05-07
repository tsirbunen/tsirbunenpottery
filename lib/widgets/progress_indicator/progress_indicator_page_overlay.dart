import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/widgets/progress_indicator/progress_indicator_xl.dart';

const _overlayOpacity = 0.6;

class ProgressIndicatorPageOverlay extends StatelessWidget {
  final Widget child;
  final bool isSubmitting;

  const ProgressIndicatorPageOverlay({
    super.key,
    required this.child,
    required this.isSubmitting,
  });

  @override
  Widget build(BuildContext context) {
    if (!isSubmitting) return child;
    return Stack(
      children: [
        child,
        Container(
          color: Colors.black.withValues(alpha: _overlayOpacity),
          child: const Center(
            child: ProgressIndicatorXL(),
          ),
        ),
      ],
    );
  }
}
