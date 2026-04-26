import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_durations.dart';

/// This widget displays an icon that fills a container of given size.
/// The container can be opted to display a color animation (to, for example,
/// indicate loading status).
class NoImageIconPlaceholder extends StatefulWidget {
  final Size size;
  final bool isAnimated;
  final IconData? iconData;
  const NoImageIconPlaceholder({
    super.key,
    required this.size,
    this.isAnimated = false,
    this.iconData = AppIcons.noImage,
  });

  @override
  State<NoImageIconPlaceholder> createState() => _NoImageIconPlaceholderState();
}

class _NoImageIconPlaceholderState extends State<NoImageIconPlaceholder>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<Color?>? _animation;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    if (_animation == null) return Container();

    return AnimatedBuilder(
        animation: _animation!,
        builder: (BuildContext context, Widget? child) {
          return Container(
            width: widget.size.width,
            height: widget.size.height,
            color: _animation!.value,
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.noImageIconPadding),
              child: FittedBox(
                fit: BoxFit.cover,
                child: Icon(
                  widget.iconData,
                  color: colors.tertiary,
                ),
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    if (!widget.isAnimated) return;

    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.placeholderPulse,
    );

    // Note: We need to do this async trick to get hold of the context
    // to be able to access the color scheme of our app's theme.
    Future.delayed(Duration.zero, () {
      if (!mounted) return;
      final colors = Theme.of(context).colorScheme;

      _animation = ColorTween(
        begin: colors.surface,
        end: colors.onTertiary,
      ).animate(_controller!)
        ..addListener(() {
          setState(() {});
        });

      _controller!.repeat(reverse: true);
    });
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
