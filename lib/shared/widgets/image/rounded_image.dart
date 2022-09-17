import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../shared.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.size = 56,
    this.imageURL = '',
    this.border,
  });

  final double size;
  final String? imageURL;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: size,
      height: size,
      imageUrl: imageURL ?? '',
      fit: BoxFit.cover,
      imageBuilder:
          (BuildContext context, ImageProvider<Object> imageProvider) {
        return Container(
          decoration: BoxDecoration(
            border: border,
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            backgroundImage: imageProvider,
          ),
        );
      },
      placeholder: (BuildContext context, String url) =>
          const LoadingIndicator(),
      errorWidget: (BuildContext context, String url, dynamic error) =>
          ErrorImage(
        size: size,
        isRounded: true,
      ),
    );
  }
}
