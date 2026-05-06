import 'package:flutter/material.dart';
import 'package:tsirbunenpottery/features/pieces/presentation/single_piece_view/photo_carousel_indicator.dart';
import 'package:tsirbunenpottery/utils/app_dimensions.dart';
import 'package:tsirbunenpottery/utils/app_image_refs.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo.dart';
import 'package:tsirbunenpottery/widgets/photo_with_fallback/photo_with_fallback.dart';

class PiecePhotos extends StatefulWidget {
  final List<String> photoNames;

  const PiecePhotos({super.key, required this.photoNames});

  @override
  State<PiecePhotos> createState() => _PiecePhotosState();
}

class _PiecePhotosState extends State<PiecePhotos> {
  late final List<Photo> photos;
  PageController? _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    photos = _photos(widget.photoNames);
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: AppDimensions.piecePhotoSize.height + AppDimensions.spacing10,
          width: AppDimensions.piecePhotoSize.width + AppDimensions.spacing10,
          child: PageView.builder(
            controller: _controller,
            physics: const ClampingScrollPhysics(),
            itemCount: photos.length,
            onPageChanged: (index) => setState(() => currentIndex = index),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimensions.spacing5),
                child: PhotoWithFallback(
                  photo: photos[index],
                  size: AppDimensions.piecePhotoSize,
                  zoomOnHover: false,
                ),
              );
            },
          ),
        ),
        if (photos.length > 1)
          PhotoCarouselIndicator(
            currentIndex: currentIndex,
            photosCount: photos.length,
          ),
      ],
    );
  }

  List<Photo> _photos(List<String> photoNames) {
    return photoNames.map((photoName) {
      final url = '$photoBaseUrl$photoName';
      return Photo(id: photoName, url: url);
    }).toList();
  }
}
