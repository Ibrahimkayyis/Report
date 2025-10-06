import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Small wrapper to keep svg usage consistent:
/// - set width/height
/// - optional tint via color
/// - placeholder while loading / if missing
class SvgIcon extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;
  final BoxFit fit;

  const SvgIcon({
    super.key,
    required this.assetName,
    required this.size,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    // colorFilter will tint the whole svg (useful for single-color icons)
    final colorFilter = color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null;

    return SvgPicture.asset(
      assetName,
      width: size,
      height: size,
      fit: fit,
      colorFilter: colorFilter,
      // placeholder (in case of slow network or error, but for local assets it's fast)
      placeholderBuilder: (context) => SizedBox(
        width: size,
        height: size,
        child: Center(
          child: Icon(Icons.image, size: size * 0.6, color: Colors.grey.shade400),
        ),
      ),
    );
  }
}
