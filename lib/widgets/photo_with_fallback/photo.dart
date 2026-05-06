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
