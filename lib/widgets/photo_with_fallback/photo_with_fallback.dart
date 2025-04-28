import 'package:flutter/material.dart';
import 'package:madmudmobile/app/app_environment/app_environment.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/no_image_icon_placeholder.dart';

const Duration fadeInDuration = Duration(milliseconds: 1500);

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
  bool _isLoading = true;
  AnimationController? _controller;
  Animation<double>? _fadeInOpacityAnimation;
  bool _noNetworkImages = false;
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

    return MouseRegion(
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
                    padding: const EdgeInsets.all(1.0),
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
                          colors.surface.withOpacity(0),
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
    );
  }

  @override
  void initState() {
    super.initState();
    if (AppEnvironment.noNetworkImages) {
      setState(() {
        _noNetworkImages = true;
        _isLoading = false;
      });
    }

    if (widget.photo == null || _noNetworkImages) return;

    _createFadeImageInAnimation();
    _animateImageFadeInOnImageUploadCompleted();
  }

  @override
  void dispose() {
    if (_controller != null) _controller!.dispose();
    // FIXME: HOW TO DISPOSE OF THE LISTENER?
    super.dispose();
  }

  void _createFadeImageInAnimation() {
    _controller = AnimationController(
      value: 0.0,
      vsync: this,
      duration: fadeInDuration,
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
        debugPrint('Image load failed: $exception');
        setState(() {
          _isLoading = false;
          _image = null; // don't try to show a broken image
        });
      },
    );

    _image = NetworkImage(widget.photo!.url);
    _image?.resolve(const ImageConfiguration()).addListener(listener);
  }

  _shaderCallback() {
    return (Rect bounds) {
      return const RadialGradient(
        center: Alignment.center,
        radius: 0.5,
        colors: [
          Colors.black,
          Colors.black,
          Colors.transparent,
        ],
        stops: [0.0, 0.2, 1.0],
      ).createShader(bounds);
    };
  }
}
