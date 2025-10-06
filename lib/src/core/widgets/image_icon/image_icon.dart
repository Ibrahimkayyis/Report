import 'package:flutter/material.dart';

/// Wrapper untuk menampilkan PNG icon secara konsisten.
/// - Bisa diatur ukuran dan warna tint.
/// - Otomatis fallback jika gambar gagal dimuat.
class ImageIconWidget extends StatelessWidget {
  final String assetName;
  final double size;
  final Color? color;
  final BoxFit fit;

  const ImageIconWidget({
    super.key,
    required this.assetName,
    required this.size,
    this.color,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetName,
      width: size,
      height: size,
      fit: fit,
      color: color,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.broken_image_outlined,
        size: size,
        color: Colors.grey.shade400,
      ),
    );
  }
}
