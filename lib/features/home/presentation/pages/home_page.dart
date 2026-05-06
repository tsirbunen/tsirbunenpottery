import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tsirbunenpottery/features/home/domain/bloc/barrel.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';
import 'package:tsirbunenpottery/widgets/bloc_status_view/bloc_status_view.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo_with_fallback.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final imageFileName = context.select((HomeBloc b) => b.state.homePageImageFileName);
    final blocStatus = context.select((HomeBloc b) => b.state.blocStatus);

    return PageBase(
      pageBody: BlocStatusView(
        status: blocStatus,
        onRetry: () => context.read<HomeBloc>().add(FetchHomePageImageFileName()),
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.all(AppDimensions.spacing25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  context.local(Translation.homeTitle),
                  style: _headlineStyle(context),
                ),
                AppGaps.v10,
                Text(
                  context.local(Translation.appShortDescription),
                  softWrap: true,
                  style: _subTitleStyle(context),
                ),
                AppGaps.v25,
                Text(
                  context.local(Translation.homeDescription),
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: _mainDescriptionStyle(context),
                ),
                AppGaps.v20,
                PhotoWithFallback(
                  photo: _photo(imageFileName),
                  size: AppDimensions.heroPhotoSize,
                  zoomOnHover: false,
                  isShadeMasked: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

    TextStyle _headlineStyle(BuildContext context) {
    return (Theme.of(context).textTheme.headlineMedium) ?? const TextStyle();

  }

  Photo? _photo(String? fileName) {
    if (fileName == null) return null;
    return Photo(id: homePageImageDocId, url: '$photoBaseUrl$fileName');
  }

  TextStyle _subTitleStyle(BuildContext context) {
    return (Theme.of(context).textTheme.bodyMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w600);
  }

  TextStyle _mainDescriptionStyle(BuildContext context) {
    return (Theme.of(context).textTheme.bodyMedium ?? const TextStyle())
        .copyWith(fontWeight: FontWeight.w400);
  }
}
