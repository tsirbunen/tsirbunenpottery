import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/bootstrap/environment/environment_scope.dart';
import 'package:tsirbunenpottery/bootstrap/service_locator/service_locator.dart';
import 'package:tsirbunenpottery/core/logging/app_logger.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_durations.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/no_image_icon_placeholder.dart';

class Photo {
  final String id;
  final String url;
  final bool? isMainPhoto;

  const Photo({
    required this.id,
    required this.url,
    this.isMainPhoto,
  });
}

class PhotoWithFallback extends StatefulWidget {
  final Photo? photo;
  final Size size;
  // This is to optionally "zoom in" the photo when the user hovers over it
  // without changing the size of the photo.
  final bool zoomOnHover;
  // This is to optionally blur the photo edges (for example in the "Contact us" page)
  final bool isShadeMasked;

  const PhotoWithFallback({
    super.key,
    this.photo,
    required this.size,
    this.zoomOnHover = false,
    this.isShadeMasked = false,
  });

  @override
  State<PhotoWithFallback> createState() => _PhotoWithFallbackState();
}

class _PhotoWithFallbackState extends State<PhotoWithFallback>
    with SingleTickerProviderStateMixin {
  NetworkImage? _image;
  ImageStream? _imageStream;
  ImageStreamListener? _imageStreamListener;
  bool _isLoading = true;
  bool _noNetworkImages = false;
  bool _initialized = false;
  AnimationController? _controller;
  Animation<double>? _fadeInOpacityAnimation;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    // Note: While loading the recipe image from the internet,
    // we show an icon as a placeholder and once the image data
    // is available, we fade it slowly in.
    final noImage =
        _isLoading || _image == null || _fadeInOpacityAnimation == null;
    if (noImage) {
      return NoImageIconPlaceholder(
        size: widget.size,
        isAnimated: !_noNetworkImages,
      );
    }

    return FadeTransition(
      opacity: _fadeInOpacityAnimation!,
      child: MouseRegion(
        onEnter: (_) {
          if (widget.zoomOnHover) setState(() => _isHovering = true);
        },
        onExit: (_) {
          if (widget.zoomOnHover) setState(() => _isHovering = false);
        },
        child: ClipRect(
          child: SizedBox(
            width: widget.size.width,
            height: widget.size.height,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  child: AnimatedScale(
                    scale: _isHovering ? 1.1 : 1.0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOut,
                    // Note: This hack is to remove the vertical thin line
                    // that appears in mobile.
                    child: Padding(
                      padding: const EdgeInsets.all(AppDimensions.photoEdgeCorrectionPadding),
                      child: Image(
                        image: _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                if (widget.isShadeMasked)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.5,
                          colors: [
                            colors.surface.withValues(alpha: 0),
                            colors.surface,
                          ],
                          stops: [0.2, 1.0],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_initialized) return;
    _initialized = true;

    _noNetworkImages = EnvironmentScope.of(context).noNetworkImages;
    if (_noNetworkImages) {
      _isLoading = false;
      return;
    }

    if (widget.photo == null) return;
    _createFadeImageInAnimation();
    _animateImageFadeInOnImageUploadCompleted();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _removeImageListener();
    super.dispose();
  }

  void _removeImageListener() {
    if (_imageStreamListener != null) {
      _imageStream?.removeListener(_imageStreamListener!);
      _imageStream = null;
      _imageStreamListener = null;
    }
  }

  @override
  void didUpdateWidget(covariant PhotoWithFallback oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_noNetworkImages) return;

    final newUrl = widget.photo?.url;
    final oldUrl = oldWidget.photo?.url;
    if (newUrl == oldUrl) return;

    _removeImageListener();
    _controller?.dispose();
    _controller = null;
    _fadeInOpacityAnimation = null;

    if (newUrl != null && newUrl.isNotEmpty) {
      setState(() {
        _isLoading = true;
        _image = null;
      });
      _createFadeImageInAnimation();
      _animateImageFadeInOnImageUploadCompleted();
    } else {
      setState(() {
        _isLoading = false;
        _image = null;
      });
    }
  }

  void _createFadeImageInAnimation() {
    _controller = AnimationController(
      value: 0.0,
      vsync: this,
      duration: AppDurations.photoFadeIn,
    );

    _fadeInOpacityAnimation = CurvedAnimation(
      parent: _controller!,
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
    );
  }

  void _animateImageFadeInOnImageUploadCompleted() {
    if (_controller == null) return;

    final listener = ImageStreamListener(
      (ImageInfo info, bool syncCall) {
        if (mounted == false) return;
        setState(() {
          _isLoading = false;
        });

        _controller!.forward();
      },
      onError: (dynamic exception, StackTrace? stackTrace) {
        if (!mounted) return;
        getIt<AppLogger>().logWarning(
          'Image load failed: $exception',
          tag: 'PhotoWithFallback',
          error: exception,
        );
        setState(() {
          _isLoading = false;
          _image = null; // don't try to show a broken image
        });
      },
    );

    _imageStreamListener = listener;
    _image = NetworkImage(widget.photo!.url);
    _imageStream = _image!.resolve(const ImageConfiguration());
    _imageStream!.addListener(_imageStreamListener!);
  }
}
