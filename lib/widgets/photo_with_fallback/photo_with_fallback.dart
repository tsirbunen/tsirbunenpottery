import 'dart:math';

import 'package:flutter/material.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/no_image_icon_placeholder.dart';

const Duration fadeInDuration = Duration(milliseconds: 1500);

class Photo {
  final int id;
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
  const PhotoWithFallback({super.key, this.photo, required this.size});

  @override
  State<PhotoWithFallback> createState() => _PhotoWithFallbackState();
}

class _PhotoWithFallbackState extends State<PhotoWithFallback>
    with SingleTickerProviderStateMixin {
  NetworkImage? _image;
  bool _isLoading = true;
  AnimationController? _controller;
  Animation<double>? _fadeInOpacityAnimation;

  @override
  Widget build(BuildContext context) {
    // Note: While loading the recipe image from the internet,
    // we show an icon as a placeholder and once the image data
    // is available, we fade it slowly in.
    return Stack(children: <Widget>[
      if (_isLoading)
        NoImageIconPlaceholder(
          size: widget.size,
          isAnimated: true,
        ),
      if (!_isLoading && _fadeInOpacityAnimation != null)
        AnimatedBuilder(
          animation: _fadeInOpacityAnimation!,
          builder: (BuildContext context, Widget? child) {
            final opacity = _fadeInOpacityAnimation!.value;
            return Opacity(opacity: opacity, child: child!);
          },
          child: Image(
            image: _image!,
            fit: BoxFit.cover,
            width: widget.size.width,
            height: widget.size.height,
          ),
        ),
    ]);
  }

  @override
  void initState() {
    super.initState();
    // FIXME: Bring back once real URLs are available
    // if (widget.photo == null) return;

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

    final listener = ImageStreamListener((ImageInfo info, bool syncCall) {
      if (mounted == false) return;
      setState(() {
        _isLoading = false;
      });

      _controller!.forward();
    });

    // FIXME: Remove this temporary base URL once real URLs are available
    const temporaryBaseUrl =
        'https://raw.githubusercontent.com/tsirbunen/madmudmobile/main/assets/';
    final photoUrls = ['espresso.png', 'plants.png', 'soap.png'];
    final randomIndexBetween0and2 = Random().nextInt(3);
    final photo = Photo(
        id: 0, url: '$temporaryBaseUrl${photoUrls[randomIndexBetween0and2]}');

    _image = NetworkImage(photo.url);

    _image?.resolve(const ImageConfiguration()).addListener(listener);
  }
}
