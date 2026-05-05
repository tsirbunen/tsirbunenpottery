import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';

abstract final class AppGaps {
  // Vertical gaps
  static const Widget v5 = SizedBox(height: AppDimensions.spacing5);
  static const Widget v10 = SizedBox(height: AppDimensions.spacing10);
  static const Widget v15 = SizedBox(height: AppDimensions.spacing15);
  static const Widget v20 = SizedBox(height: AppDimensions.spacing20);
  static const Widget v25 = SizedBox(height: AppDimensions.spacing25);
  static const Widget v50 = SizedBox(height: AppDimensions.spacing50);

  // Horizontal gaps
  static const Widget h5 = SizedBox(width: AppDimensions.spacing5);
  static const Widget h10 = SizedBox(width: AppDimensions.spacing10);
  static const Widget h15 = SizedBox(width: AppDimensions.spacing15);
  static const Widget h20 = SizedBox(width: AppDimensions.spacing20);
  static const Widget h25 = SizedBox(width: AppDimensions.spacing25);
  static const Widget h50 = SizedBox(width: AppDimensions.spacing50);
}
