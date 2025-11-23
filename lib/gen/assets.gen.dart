// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsColorGen {
  const $AssetsColorGen();

  /// File path: assets/color/colors.xml
  String get colors => 'assets/color/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $AssetsI18nGen {
  const $AssetsI18nGen();

  /// File path: assets/i18n/en.i18n.json
  String get enI18n => 'assets/i18n/en.i18n.json';

  /// File path: assets/i18n/id.i18n.json
  String get idI18n => 'assets/i18n/id.i18n.json';

  /// List of all assets
  List<String> get values => [enI18n, idI18n];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/app_logo.png
  AssetGenImage get appLogo => const AssetGenImage('assets/icons/app_logo.png');

  /// File path: assets/icons/device_request.png
  AssetGenImage get deviceRequest =>
      const AssetGenImage('assets/icons/device_request.png');

  /// File path: assets/icons/knowledge_base.png
  AssetGenImage get knowledgeBase =>
      const AssetGenImage('assets/icons/knowledge_base.png');

  /// File path: assets/icons/report_status.png
  AssetGenImage get reportStatus =>
      const AssetGenImage('assets/icons/report_status.png');

  /// File path: assets/icons/reset_password.png
  AssetGenImage get resetPassword =>
      const AssetGenImage('assets/icons/reset_password.png');

  /// File path: assets/icons/system_access.png
  AssetGenImage get systemAccess =>
      const AssetGenImage('assets/icons/system_access.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogo,
    deviceRequest,
    knowledgeBase,
    reportStatus,
    resetPassword,
    systemAccess,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/REPORT_LOGO.png
  AssetGenImage get reportLogo =>
      const AssetGenImage('assets/images/REPORT_LOGO.png');

  /// File path: assets/images/REPORT_TEXT.png
  AssetGenImage get reportText =>
      const AssetGenImage('assets/images/REPORT_TEXT.png');

  /// File path: assets/images/helpdesk_avatar.png
  AssetGenImage get helpdeskAvatar =>
      const AssetGenImage('assets/images/helpdesk_avatar.png');

  /// File path: assets/images/logo_text.png
  AssetGenImage get logoText =>
      const AssetGenImage('assets/images/logo_text.png');

  /// File path: assets/images/onb_chat.png
  AssetGenImage get onbChat =>
      const AssetGenImage('assets/images/onb_chat.png');

  /// File path: assets/images/onb_general.jpg
  AssetGenImage get onbGeneral =>
      const AssetGenImage('assets/images/onb_general.jpg');

  /// File path: assets/images/onb_teknisi.png
  AssetGenImage get onbTeknisi =>
      const AssetGenImage('assets/images/onb_teknisi.png');

  /// File path: assets/images/theme_dark.png
  AssetGenImage get themeDark =>
      const AssetGenImage('assets/images/theme_dark.png');

  /// File path: assets/images/theme_light.png
  AssetGenImage get themeLight =>
      const AssetGenImage('assets/images/theme_light.png');

  /// File path: assets/images/theme_system.png
  AssetGenImage get themeSystem =>
      const AssetGenImage('assets/images/theme_system.png');

  /// File path: assets/images/user_avatar.png
  AssetGenImage get userAvatar =>
      const AssetGenImage('assets/images/user_avatar.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    reportLogo,
    reportText,
    helpdeskAvatar,
    logoText,
    onbChat,
    onbGeneral,
    onbTeknisi,
    themeDark,
    themeLight,
    themeSystem,
    userAvatar,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsColorGen color = $AssetsColorGen();
  static const $AssetsI18nGen i18n = $AssetsI18nGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
