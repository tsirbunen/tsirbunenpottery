import 'package:flutter/material.dart';
import 'package:madmudmobile/features/contact/presentation/contact_email_with_copy_option.dart';
import 'package:madmudmobile/localization/app_locale.dart';
import 'package:madmudmobile/localization/translation.dart';
import 'package:madmudmobile/widgets/company/company.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

const Size photoSize = Size(275.0, 275.0);
// FIXME: Change this temporary base URL once real URLs are available
const baseUrl =
    'https://raw.githubusercontent.com/tsirbunen/madmudmobile/main/assets/';

class PhotoAndInfo extends StatelessWidget {
  const PhotoAndInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final storyOnContactPage = context.local(Translation.storyOnContactPage);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PhotoWithFallback(
          photo: _photo(),
          size: photoSize,
          zoomOnHover: false,
          isShadeMasked: true,
        ),
        const SizedBox(height: 20.0),
        SizedBox(
          width: photoSize.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Company(isDark: false),
              const SizedBox(height: 10.0),
              Text(
                storyOnContactPage,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                softWrap: true,
                style: _storyStyle(context),
              ),
              const SizedBox(height: 20.0),
              const ContactEmailWithCopyOption()
            ],
          ),
        ),
      ],
    );
  }

  Photo _photo() {
    const photo = 'espresso.png';
    const url = '$baseUrl$photo';
    return const Photo(id: '0', url: url);
  }

  TextStyle _storyStyle(BuildContext context) {
    return Theme.of(context).textTheme.labelMedium!.copyWith(
        overflow: TextOverflow.ellipsis,
        color: Theme.of(context).colorScheme.secondary);
  }
}
