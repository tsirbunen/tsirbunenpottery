import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_durations.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';

class ContactEmailWithCopyOption extends StatelessWidget {
  const ContactEmailWithCopyOption({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final contactEmaiLabel = context.local(Translation.contactEmail);
    final emailCopiedToClipboardLabel =
        context.local(Translation.emailCopiedToClipboard);
    final tapToCopyEmailLabel = context.local(Translation.tapToCopyEmail);

    return GestureDetector(
      onTap: () async {
        final messenger = ScaffoldMessenger.of(context);
        try {
          await Clipboard.setData(ClipboardData(text: contactEmaiLabel));
          messenger.showSnackBar(
            SnackBar(
              content: Text(emailCopiedToClipboardLabel),
              duration: AppDurations.snackBar,
              backgroundColor: colors.primary,
            ),
          );
        } catch (_) {}
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Tooltip(
          message: tapToCopyEmailLabel,
          decoration: _tooltipDecoration(colors),
          textStyle: _tooltipTextStyle(colors),
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.spacing10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                AppIcons.email,
                color: colors.secondary,
                weight: AppTypography.defaultIconWeight,
              ),
              AppGaps.h5,
              Flexible(
                child: Text(
                  contactEmaiLabel,
                  style: _emailTextStyle(colors),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _tooltipDecoration(ColorScheme colors) {
    return BoxDecoration(
      color: colors.primary.withValues(alpha: 0.8),
      borderRadius: BorderRadius.circular(AppDimensions.formBorderRadius),
    );
  }

  TextStyle _tooltipTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: AppTypography.descriptionFontSize,
      color: colors.surface,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _emailTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: AppTypography.descriptionFontSize,
      color: colors.secondary,
      fontWeight: FontWeight.w700,
    );
  }
}
