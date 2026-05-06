import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';

const EdgeInsets _textWithoutArrowPadding = EdgeInsets.symmetric(
    horizontal: AppDimensions.spacing25, vertical: AppDimensions.spacing10);
const EdgeInsets _textWithArrowPadding = EdgeInsets.symmetric(
    horizontal: AppDimensions.spacing15, vertical: AppDimensions.spacing10);

class TitleWithHoverEffect extends StatefulWidget {
  final String title;
  final void Function(BuildContext) onTap;
  final bool showEffect;

  const TitleWithHoverEffect({
    super.key,
    required this.title,
    required this.onTap,
    required this.showEffect,
  });

  @override
  State<TitleWithHoverEffect> createState() => _TitleWithHoverEffectState();
}

class _TitleWithHoverEffectState extends State<TitleWithHoverEffect> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    if (!widget.showEffect) {
      return Padding(
        padding: _textWithoutArrowPadding,
        child: Text(
          widget.title,
          overflow: TextOverflow.ellipsis,
          softWrap: false,
          style: _titleStyle(context),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        margin: const EdgeInsets.only(left: AppDimensions.spacing10),
        child: GestureDetector(
          onTap: () => widget.onTap(context),
          child: Padding(
            padding: _textWithArrowPadding,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                    child: Text(widget.title,
                        style: _titleStyle(context),
                        overflow: TextOverflow.ellipsis,
                        softWrap: false)),
                AppGaps.h10,
                Icon(
                  AppIcons.forward,
                  color: color,
                  weight: _isHovered
                      ? AppTypography.hoveredIconWeight
                      : AppTypography.defaultIconWeight,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _titleStyle(BuildContext context) {
 final textTheme = Theme.of(context).textTheme;
       return textTheme.titleMedium?.copyWith(
          fontWeight: _isHovered ? FontWeight.w700 : FontWeight.w500,
          color: Theme.of(context).colorScheme.primary,
        ) ??
        const TextStyle();
  }
}
