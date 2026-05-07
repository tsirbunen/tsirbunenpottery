import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/theme/colors.dart' as app_colors;
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_typography.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final titleController = TextEditingController();
  final messageController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contactUsLabel = context.local(Translation.contactUs);
    final titlePlaceholder = context.local(Translation.contactTitlePlaceholder);
    final messagePlaceholder =
        context.local(Translation.contactMessagePlaceholder);
    final submitLabel = context.local(Translation.submitLabel);
    final comingSoonLabel = context.local(Translation.comingSoon);

    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppDimensions.contactFormMaxWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppGaps.v50,
            Text(contactUsLabel, style: _titleStyle(textTheme, colors)),
            _buildTextField(
              colors,
              titleController,
              titlePlaceholder,
              2,
              textTheme,
            ),
            _buildTextField(
              colors,
              messageController,
              messagePlaceholder,
              8,
              textTheme,
            ),
            AppGaps.v50,
            SizedBox(
              width: AppDimensions.contactFormButtonWidth,
              height: AppDimensions.contactFormButtonHeight,
              child: ElevatedButton(
                // FIXME: Add functionality once mail service available
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary.withValues(alpha: 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimensions.formBorderRadius),
                  ),
                ),
                child: Text(submitLabel, style: _textStyle(textTheme, colors)),
              ),
            ),
            const SizedBox(height: AppDimensions.contactFormBelowButtonSpacing),
            Text(
              comingSoonLabel,
              style: textTheme.bodySmall?.copyWith(
                color: colors.secondary,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextField(
    ColorScheme colors,
    TextEditingController controller,
    String hintText,
    int maxLines,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.spacing20),
      child: Container(
        decoration: BoxDecoration(
          color: app_colors.inputFieldBackground,
          borderRadius: BorderRadius.circular(AppDimensions.formBorderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.spacing15),
          child: TextField(
            controller: controller,
            decoration: _inputDecoration(hintText),
            maxLines: maxLines,
            style: _inputTextStyle(textTheme, colors),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      filled: true,
      fillColor: app_colors.inputFieldBackground,
      border: _inputBorder(),
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: AppTypography.drawerItemFontSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppDimensions.formBorderRadius),
      borderSide: BorderSide.none,
    );
  }

  TextStyle _titleStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.titleMedium?.copyWith(
          color: colors.primary,
        ) ??
        const TextStyle();
  }

  TextStyle _inputTextStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.bodyMedium?.copyWith(
          fontSize: AppTypography.drawerItemFontSize,
          fontWeight: FontWeight.w500,
          color: colors.primary,
        ) ??
        const TextStyle();
  }

  TextStyle _textStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.titleMedium?.copyWith(
          color: colors.surface,
        ) ??
        const TextStyle();
  }
}
