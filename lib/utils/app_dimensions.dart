import 'package:flutter/material.dart';

abstract final class AppDimensions {
  // App bar
  static const double appBarHeight = 81.0;
  static const double appBarPadding = 10.0;

  // Layout breakpoints
  static const double wideScreenBreakpoint = 800.0;
  static const double narrowScreenBreakpoint = 600.0;

  // Navigation drawer
  static const double drawerIconContainerWidth = 60.0;

  // Horizontal navigation layout estimates
  static const double navSpacerWidth = 20.0;
  static const double navTrademarkWidthEstimate = 80.0;
  static const double navItemPaddingEstimate = 25.0;

  // Trademark widget
  static const double trademarkWidth = 55.0;
  static const EdgeInsets trademarkPadding =
      EdgeInsets.only(left: 6.0, right: 6.0, bottom: 5.0, top: 1.0);

  // Border radii
  static const double circularBorderRadius = 50.0;
  static const double formBorderRadius = 25.0;

  // Borders
  static const double borderWidth = 1.0;

  // Action button / icon
  static const double actionButtonSize = 50.0;
  static const double iconSize = 30.0;

  // Hero/feature photos (home page, contact page)
  static const Size heroPhotoSize = Size(275.0, 275.0);

  // Piece photos
  static const double piecePhotoMinWidth = 300.0;
  static const Size piecePhotoSize = Size(piecePhotoMinWidth, piecePhotoMinWidth);
  static const double singlePieceViewMaxWidth = 600.0;
  static const double singlePieceViewSpacing = 20.0;

  // Grid / card
  static const double gridPhotoAspectRatio = 0.75;
  static const Size pieceCardDefaultSize = Size(200.0, 200.0 * gridPhotoAspectRatio);

  // Carousel indicator
  static const double carouselDotSize = 10.0;
  static const double carouselDotSpacing = 3.0;

  // Contact form
  static const double contactFormMaxWidth = 350.0;
  static const double contactFormButtonWidth = 150.0;
  static const double contactFormButtonHeight = 50.0;
  static const double contactFormBelowButtonSpacing = 12.0;

  // No-image placeholder
  // Padding value of 1.0 in PhotoWithFallback is a rendering workaround for
  // a hairline vertical artefact that appears in mobile browsers — do not remove.
  static const double photoEdgeCorrectionPadding = 1.0;
  static const double noImageIconPadding = 50.0;

}
