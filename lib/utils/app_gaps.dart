import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_spacing.dart';

abstract final class AppGaps {
  // Vertical gaps
  static const Widget v5 = SizedBox(height: AppSpacing.spacing5);
  static const Widget v10 = SizedBox(height: AppSpacing.spacing10);
  static const Widget v15 = SizedBox(height: AppSpacing.spacing15);
  static const Widget v20 = SizedBox(height: AppSpacing.spacing20);
  static const Widget v25 = SizedBox(height: AppSpacing.spacing25);
  static const Widget v50 = SizedBox(height: AppSpacing.spacing50);

  // Horizontal gaps
  static const Widget h5 = SizedBox(width: AppSpacing.spacing5);
  static const Widget h10 = SizedBox(width: AppSpacing.spacing10);
  static const Widget h15 = SizedBox(width: AppSpacing.spacing15);
  static const Widget h20 = SizedBox(width: AppSpacing.spacing20);
  static const Widget h25 = SizedBox(width: AppSpacing.spacing25);
  static const Widget h50 = SizedBox(width: AppSpacing.spacing50);
}
