import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/core/types/bloc_status/bloc_status.dart';
import 'package:tsirbunenpottery/localization/app_locale.dart';
import 'package:tsirbunenpottery/localization/translation.dart';
import 'package:tsirbunenpottery/widgets/progress_indicator/progress_indicator_xl.dart';

class BlocStatusView extends StatelessWidget {
  final BlocStatus status;
  final Widget child;

  const BlocStatusView({
    super.key,
    required this.status,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (status.isLoading) {
      return const Center(child: ProgressIndicatorXL());
    }

    if (status.isError) {
      getIt<AppLogger>().logError(
        'BlocStatusView error: ${status.message}',
        error: status.message ?? 'unknown error',
        tag: 'BlocStatusView',
      );
      return Center(
        child: Text(
          context.local(Translation.dataLoadError),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      );
    }

    return child;
  }
}
