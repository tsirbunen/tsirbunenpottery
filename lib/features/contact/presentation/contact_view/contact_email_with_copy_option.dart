import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/constants.dart';

const double descriptionFontSize = 12.0;
const Duration snackBarDuration = Duration(seconds: 2);

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
              duration: snackBarDuration,
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
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                AppIcons.email,
                color: colors.secondary,
                weight: iconWeight,
              ),
              const SizedBox(width: 5.0),
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
      borderRadius: BorderRadius.circular(25.0),
    );
  }

  TextStyle _tooltipTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: descriptionFontSize,
      color: colors.surface,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle _emailTextStyle(ColorScheme colors) {
    return TextStyle(
      fontSize: descriptionFontSize,
      color: colors.secondary,
      fontWeight: FontWeight.w700,
    );
  }
}
