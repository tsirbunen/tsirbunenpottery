import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/theme/colors.dart' as app_colors;

abstract final class _Dim {
  static const double borderRadius = 25.0;
  static const double maxWidth = 350.0;
  static const Color inputBackground = app_colors.inputFieldBackground;
  static const double largeSpacerHeight = 50.0;
  static const double buttonWidth = 150.0;
  static const double buttonHeight = 50.0;
  static const double belowButtonSpacing = 12.0;
  static const double fieldTopPadding = 20.0;
  static const double fieldInnerPadding = 15.0;
  static const double titleFontSize = 20.0;
  static const double inputFontSize = 16.0;
  static const double buttonFontSize = 18.0;
}

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
        constraints: const BoxConstraints(maxWidth: _Dim.maxWidth),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: _Dim.largeSpacerHeight),
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
            const SizedBox(height: _Dim.largeSpacerHeight),
            SizedBox(
              width: _Dim.buttonWidth,
              height: _Dim.buttonHeight,
              child: ElevatedButton(
                // FIXME: Add functionality once mail service available
                onPressed: null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary.withValues(alpha: 0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(_Dim.borderRadius),
                  ),
                ),
                child: Text(submitLabel, style: _textStyle(textTheme, colors)),
              ),
            ),
            const SizedBox(height: _Dim.belowButtonSpacing),
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
      padding: const EdgeInsets.only(top: _Dim.fieldTopPadding),
      child: Container(
        decoration: BoxDecoration(
          color: _Dim.inputBackground,
          borderRadius: BorderRadius.circular(_Dim.borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(_Dim.fieldInnerPadding),
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
      fillColor: _Dim.inputBackground,
      border: _inputBorder(),
      hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: _Dim.inputFontSize,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.secondary,
          ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(_Dim.borderRadius),
      borderSide: BorderSide.none,
    );
  }

  TextStyle _titleStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.headlineMedium?.copyWith(
          fontSize: _Dim.titleFontSize,
          color: colors.primary,
        ) ??
        const TextStyle();
  }

  TextStyle _inputTextStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.bodyMedium?.copyWith(
          fontSize: _Dim.inputFontSize,
          fontWeight: FontWeight.w500,
          color: colors.primary,
        ) ??
        const TextStyle();
  }

  TextStyle _textStyle(TextTheme textTheme, ColorScheme colors) {
    return textTheme.titleMedium?.copyWith(
          fontSize: _Dim.buttonFontSize,
          color: colors.surface,
        ) ??
        const TextStyle();
  }
}
