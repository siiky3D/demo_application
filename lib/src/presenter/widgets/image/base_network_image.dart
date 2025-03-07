import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/core/config/constants/image_constants.dart';
import 'package:netflix_clone/src/presenter/widgets/indicator/base_indicator.dart';

class BaseNetworkImage extends StatelessWidget {
  const BaseNetworkImage(this.url, {super.key, this.hasRadius = true});

  BaseNetworkImage.originalImageSize(
    String? targetUrl, {
    super.key,
    this.hasRadius = true,
  }) : url = ImageConstants.originalImage(targetUrl);

  final String? url;
  final bool hasRadius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url ?? '',
      errorWidget: (_, __, ___) => const BaseIndicator(),
      imageBuilder: (context, imageProvider) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: hasRadius ? BorderRadius.circular(8) : null,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
