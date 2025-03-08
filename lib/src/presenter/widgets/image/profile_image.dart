import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/src/domain/entities/auth/profile_details_entity.dart';
import 'package:netflix_clone/src/presenter/widgets/indicator/base_indicator.dart';
import 'package:netflix_clone/src/presenter/widgets/shimmer/shimmer.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    required this.profile,
    required this.size,
    this.padding = EdgeInsets.zero,
    this.placeholder,
    this.tintColor,
    super.key,
  });

  static const Size _cacheMaxSize = Size(700, 700);

  final ProfileDetailEntity profile;
  final EdgeInsets padding;
  final Size size;
  final ImageProvider? placeholder;
  final Color? tintColor;

  @override
  Widget build(BuildContext context) {
    final imageProvider = profile.image?.startsWith('http') ?? false
        ? NetworkImage(profile.image ?? '')
        : AssetImage(profile.image ?? '') as ImageProvider;

    return AnimatedPadding(
      duration: const Duration(milliseconds: 600),
      padding: padding,
      child: imageProvider is NetworkImage
          ? CachedNetworkImage(
              imageUrl: profile.image ?? '',
              useOldImageOnUrlChange: true,
              maxWidthDiskCache: _cacheMaxSize.width.toInt(),
              maxHeightDiskCache: _cacheMaxSize.height.toInt(),
              fadeInDuration: const Duration(milliseconds: 120),
              fadeOutDuration: const Duration(milliseconds: 120),
              imageBuilder: (_, image) => Image(
                image: image,
                width: size.width,
                height: size.height,
                alignment: Alignment.bottomCenter,
                color: tintColor,
                fit: BoxFit.cover,
              ),
              placeholder: (_, __) => ShimmerPlaceholder(
                height: size.height,
                width: size.width,
              ),
              errorWidget: (_, __, ___) => const BaseIndicator(),
            )
          : Image(
              image: imageProvider,
              width: size.width,
              height: size.height,
              alignment: Alignment.bottomCenter,
              color: tintColor,
              fit: BoxFit.cover,
            ),
    );
  }
}
