import 'package:flutter/material.dart';
import 'package:sneakers/domain/entities/asset.dart';

class AssetsComponent extends StatelessWidget {
  const AssetsComponent({
    required this.assets,
    super.key,
  });

  final List<Asset> assets;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < assets.length && i < 4; i++)
            Flexible(child: _factory(assets[i])),
        ],
      ),
    );
  }

  Widget _factory(Asset asset) {
    switch (asset.type) {
      case AssetType.picture:
        return _PictureAssetWidget(asset.path);
      case AssetType.video:
        return _VideoAssetWidget(asset.path);
    }
  }
}

class _AssetWidget extends StatelessWidget {
  const _AssetWidget(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      constraints: const BoxConstraints(
        maxHeight: 60,
        minWidth: 100,
      ),
      child: Image.asset(path),
    );
  }
}

class _PictureAssetWidget extends StatelessWidget {
  const _PictureAssetWidget(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return _AssetWidget(path);
  }
}

class _VideoAssetWidget extends StatelessWidget {
  const _VideoAssetWidget(this.path);

  final String path;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _AssetWidget(path),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[400]?.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            child: Icon(
              Icons.play_circle_filled_outlined,
              color: Colors.grey[100],
              size: 30,
            ),
          ),
        ),
      ],
    );
  }
}
