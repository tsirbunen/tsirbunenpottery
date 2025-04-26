import 'dart:math';
import 'package:flutter/material.dart';
import 'package:madmudmobile/features/products/domain/models/piece/piece.dart';
import 'package:madmudmobile/features/products/presentation/design_view/photo_carousel_indicator.dart';
import 'package:madmudmobile/widgets/photo_with_fallback/photo_with_fallback.dart';

// FIXME: Change this temporary base URL once real URLs are available
const baseUrl =
    'https://raw.githubusercontent.com/tsirbunen/madmudmobile/main/assets/';

const double photoMinWidth = 300.0;
const Size photoSize = Size(photoMinWidth, photoMinWidth);

class DesignPhotos extends StatefulWidget {
  final List<Piece> pieces;

  const DesignPhotos({super.key, required this.pieces});

  @override
  State<DesignPhotos> createState() => _DesignPhotosState();
}

class _DesignPhotosState extends State<DesignPhotos> {
  late final List<Photo> photos;
  late final PageController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    photos = _photos(widget.pieces);
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: photoSize.height + 10.0,
          width: photoSize.width + 10.0,
          child: PageView.builder(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            itemCount: photos.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: PhotoWithFallback(
                  photo: photos[index],
                  size: photoSize,
                  zoomOnHover: false,
                ),
              );
            },
          ),
        ),
        PhotoCarouselIndicator(
          currentIndex: currentIndex,
          photosCount: photos.length,
        ),
      ],
    );
  }

  List<Photo> _photos(List<Piece> pieces) {
    // FIXME: Change this temporary base URL once real URLs are available
    final photoUrls = [
      'espresso.png',
      'plants.png',
      'espresso.png',
      'soap.png',
      'soap.png'
    ];

    return pieces.map((piece) {
      final randomIndexBetween0and2 = Random().nextInt(5);
      final url = '$baseUrl${photoUrls[randomIndexBetween0and2]}';
      return Photo(id: piece.id, url: url);
    }).toList();
  }
}
