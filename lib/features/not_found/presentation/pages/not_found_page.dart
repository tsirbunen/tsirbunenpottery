import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tsirbunenpottery/bootstrap/router/route_enum.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/utils/app_gaps.dart';
import 'package:tsirbunenpottery/widgets/page_base/page_base.dart';

class NotFoundPage extends StatelessWidget {
  final String? path;

  const NotFoundPage({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return PageBase(
      pageBody: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppGaps.v50,
            Text(
              context.local(Translation.pageNotFound),
              style: textTheme.headlineSmall?.copyWith(color: colors.primary),
            ),
            if (path != null) ...[
              AppGaps.v25,
              Text(
                path!,
                style: textTheme.bodySmall?.copyWith(
                  color: colors.secondary,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            AppGaps.v50,
            ElevatedButton(
              onPressed: () => context.go(RouteEnum.home.path()),
              child: Text(context.local(Translation.goHome)),
            ),
            AppGaps.v50,
          ],
        ),
      ),
    );
  }
}
