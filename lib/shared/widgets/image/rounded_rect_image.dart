import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared.dart';

class RoundedRectImage extends StatelessWidget {
  const RoundedRectImage({
    super.key,
    this.imageURL = '',
    this.width,
    this.height,
    this.borderRadius,
  });

  final String? imageURL;
  final double? width, height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageURL ?? '',
        width: width,
        height: height,
        fit: BoxFit.fill,
        placeholder: (BuildContext context, String url) =>
            const LoadingIndicator(),
        errorWidget: (BuildContext context, String url, dynamic error) =>
            ErrorImage(size: width),
      ),
    );
  }
}
