import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/contact/presentation/contact_view/contact_email_with_copy_option.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';
import 'package:tsirbunenpottery/widgets/company/company.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo_with_fallback.dart';

class PhotoAndInfo extends StatelessWidget {
  final String? imageFileName;
  const PhotoAndInfo({super.key, this.imageFileName});

  @override
  Widget build(BuildContext context) {
    final storyOnContactPage = context.local(Translation.storyOnContactPage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PhotoWithFallback(
          photo: _photo(imageFileName),
          size: AppDimensions.heroPhotoSize,
          zoomOnHover: false,
          isShadeMasked: true,
        ),
        AppGaps.v20,
        SizedBox(
          width: AppDimensions.heroPhotoSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Company(isDark: false),
              AppGaps.v10,
              Text(
                storyOnContactPage,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
                style: _storyStyle(context),
              ),
              AppGaps.v20,
              const ContactEmailWithCopyOption()
            ],
          ),
        ),
      ],
    );
  }

  Photo? _photo(String? fileName) {
    if (fileName == null) return null;
    return Photo(id: homePageImageDocId, url: '$photoBaseUrl$fileName');
  }

  TextStyle _storyStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        overflow: TextOverflow.ellipsis,
        color: Theme.of(context).colorScheme.secondary);
  }
}
