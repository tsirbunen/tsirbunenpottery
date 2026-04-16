import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_bloc.dart';
import 'package:tsirbunenpottery/core/state/language_bloc/language_state.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_bloc.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/home_state.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/constants.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo_with_fallback.dart';

const Size photoSize = Size(275.0, 275.0);

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageBase(
      pageBody: BlocBuilder<LanguageBloc, LanguageState>(
          builder: (BuildContext context, LanguageState _) {
        return BlocBuilder<HomeBloc, HomeState>(
            builder: (BuildContext context, HomeState homeState) {
          final imageFileName = homeState.homePageImageFileName;

          return BlocStatusView(
            status: homeState.blocStatus,
            child: Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(context.local(Translation.homeTitle), style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 10.0),
                  Text(
                    context.local(Translation.appShortDescription),
                    softWrap: true,
                    style: _subTitleStyle(context),
                  ),
                  const SizedBox(height: 30.0),
                  Text(
                    context.local(Translation.homeDescription),
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: _mainDescriptionStyle(context),
                  ),
                  const SizedBox(height: 20.0),
                  PhotoWithFallback(
                    photo: _photo(imageFileName),
                    size: photoSize,
                    zoomOnHover: false,
                    isShadeMasked: true,
                  ),
                ],
              ),
            ),
          ));
        });
      }),
    );
  }

  Photo? _photo(String? fileName) {
    if (fileName == null) return null;
    return Photo(id: homePageImageDocId, url: '$photoBaseUrl$fileName');
  }

  TextStyle _subTitleStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle _mainDescriptionStyle(BuildContext context) {
    // Center the text
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.w400);
  }
}
