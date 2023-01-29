class Asset {
  const Asset({
    required this.type,
    required this.path,
  });

  final AssetType type;
  final String path;
}

enum AssetType {
  picture,
  video,
}
