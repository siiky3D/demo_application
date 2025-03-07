/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/bulbasaur.png
  AssetGenImage get bulbasaur =>
      const AssetGenImage('assets/images/bulbasaur.png');

  /// File path: assets/images/chikorita.png
  AssetGenImage get chikorita =>
      const AssetGenImage('assets/images/chikorita.png');

  /// File path: assets/images/google_logo.png
  AssetGenImage get googleLogo =>
      const AssetGenImage('assets/images/google_logo.png');

  /// File path: assets/images/login_icon.png
  AssetGenImage get loginIcon =>
      const AssetGenImage('assets/images/login_icon.png');

  /// File path: assets/images/movie_posters.jpg
  AssetGenImage get moviePosters =>
      const AssetGenImage('assets/images/movie_posters.jpg');

  /// File path: assets/images/netflix_contract.png
  AssetGenImage get netflixContract =>
      const AssetGenImage('assets/images/netflix_contract.png');

  /// File path: assets/images/netflix_devices.png
  AssetGenImage get netflixDevices =>
      const AssetGenImage('assets/images/netflix_devices.png');

  /// File path: assets/images/netflix_download.png
  AssetGenImage get netflixDownload =>
      const AssetGenImage('assets/images/netflix_download.png');

  /// File path: assets/images/netflix_logo.png
  AssetGenImage get netflixLogo =>
      const AssetGenImage('assets/images/netflix_logo.png');

  /// File path: assets/images/netflix_profile_1.jpg
  AssetGenImage get netflixProfile1 =>
      const AssetGenImage('assets/images/netflix_profile_1.jpg');

  /// File path: assets/images/netflix_profile_2.jpg
  AssetGenImage get netflixProfile2 =>
      const AssetGenImage('assets/images/netflix_profile_2.jpg');

  /// File path: assets/images/netflix_profile_3.jpg
  AssetGenImage get netflixProfile3 =>
      const AssetGenImage('assets/images/netflix_profile_3.jpg');

  /// File path: assets/images/netflix_profile_4.jpg
  AssetGenImage get netflixProfile4 =>
      const AssetGenImage('assets/images/netflix_profile_4.jpg');

  /// File path: assets/images/netflix_profile_5.jpg
  AssetGenImage get netflixProfile5 =>
      const AssetGenImage('assets/images/netflix_profile_5.jpg');

  /// File path: assets/images/netflix_ribbon.jpg
  AssetGenImage get netflixRibbon =>
      const AssetGenImage('assets/images/netflix_ribbon.jpg');

  /// File path: assets/images/netflix_symbol.png
  AssetGenImage get netflixSymbol =>
      const AssetGenImage('assets/images/netflix_symbol.png');

  /// File path: assets/images/onboard.jpg
  AssetGenImage get onboard => const AssetGenImage('assets/images/onboard.jpg');

  /// File path: assets/images/placeholder.png
  AssetGenImage get placeholder =>
      const AssetGenImage('assets/images/placeholder.png');

  /// File path: assets/images/snivy.png
  AssetGenImage get snivy => const AssetGenImage('assets/images/snivy.png');

  /// File path: assets/images/top10_logo.png
  AssetGenImage get top10Logo =>
      const AssetGenImage('assets/images/top10_logo.png');

  /// File path: assets/images/treecko.png
  AssetGenImage get treecko => const AssetGenImage('assets/images/treecko.png');

  /// File path: assets/images/turtwig.png
  AssetGenImage get turtwig => const AssetGenImage('assets/images/turtwig.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        bulbasaur,
        chikorita,
        googleLogo,
        loginIcon,
        moviePosters,
        netflixContract,
        netflixDevices,
        netflixDownload,
        netflixLogo,
        netflixProfile1,
        netflixProfile2,
        netflixProfile3,
        netflixProfile4,
        netflixProfile5,
        netflixRibbon,
        netflixSymbol,
        onboard,
        placeholder,
        snivy,
        top10Logo,
        treecko,
        turtwig
      ];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/netflix_splash.json
  String get netflixSplash => 'assets/lotties/netflix_splash.json';

  /// List of all assets
  List<String> get values => [netflixSplash];
}

class $AssetsMockGen {
  const $AssetsMockGen();

  /// File path: assets/mock/movie_listings_dummy_data.json
  String get movieListingsDummyData =>
      'assets/mock/movie_listings_dummy_data.json';

  /// List of all assets
  List<String> get values => [movieListingsDummyData];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/image_placeholder.svg
  String get imagePlaceholder => 'assets/svgs/image_placeholder.svg';

  /// File path: assets/svgs/stat_minus_1.svg
  String get statMinus1 => 'assets/svgs/stat_minus_1.svg';

  /// List of all assets
  List<String> get values => [imagePlaceholder, statMinus1];
}

class Assets {
  const Assets._();

  static const String aEnv = '.env';
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
  static const $AssetsMockGen mock = $AssetsMockGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();

  /// List of all assets
  static List<String> get values => [aEnv];
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
