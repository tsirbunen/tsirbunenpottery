import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_event.dart';
import 'package:tsirbunenpottery/localization/languages.dart';
import 'package:tsirbunenpottery/theme/app_icons.dart';
import 'package:tsirbunenpottery/widgets/action_button/action_button.dart';

class AppBarRightActions extends StatelessWidget {
  const AppBarRightActions({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionButton(
      onPressed: () {
        final current = context.read<LanguageBloc>().state.language;
        context.read<LanguageBloc>().add(ChangeLanguage(_newLanguage(current)));
      },
      iconData: AppIcons.language,
    );
  }

  Language _newLanguage(Language current) =>
      current == Language.en ? Language.fi : Language.en;
}
