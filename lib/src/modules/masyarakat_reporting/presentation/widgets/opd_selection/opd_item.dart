part of '../../screens/opd_selection_screen.dart';

class OpdItem {
  final String name;
  final Color color;
  final String? iconUrl; // ✅ URL icon dari API
  final IconData fallbackIcon; // ✅ fallback jika tidak ada iconUrl

  OpdItem({
    required this.name,
    required this.color,
    this.iconUrl,
    this.fallbackIcon = Icons.apartment_rounded,
  });
}
