/// Utility class untuk operasi tanggal
class DateUtils {
  DateUtils._();

  /// Mengkonversi format tanggal dari DD-MM-YYYY ke YYYY-MM-DD (ISO format)
  /// 
  /// Contoh:
  /// - "25-12-2024" → "2024-12-25"
  /// - "2024-12-25" → "2024-12-25" (sudah ISO, tidak berubah)
  /// - null atau "" → ""
  static String normalizeToIso(String? date) {
    if (date == null || date.isEmpty) return '';

    // Sudah dalam format ISO (YYYY-MM-DD)
    final isoPattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (isoPattern.hasMatch(date)) return date;

    // Format DD-MM-YYYY → YYYY-MM-DD
    final parts = date.split('-');
    if (parts.length == 3) {
      final day = parts[0];
      final month = parts[1];
      final year = parts[2];
      return '$year-$month-$day';
    }

    return date;
  }

  /// Mengkonversi format tanggal dari YYYY-MM-DD ke DD-MM-YYYY (display format)
  static String normalizeToDisplay(String? date) {
    if (date == null || date.isEmpty) return '';

    // Format DD-MM-YYYY (sudah display format)
    final displayPattern = RegExp(r'^\d{2}-\d{2}-\d{4}$');
    if (displayPattern.hasMatch(date)) return date;

    // Format ISO YYYY-MM-DD → DD-MM-YYYY
    final parts = date.split('-');
    if (parts.length == 3 && parts[0].length == 4) {
      final year = parts[0];
      final month = parts[1];
      final day = parts[2];
      return '$day-$month-$year';
    }

    return date;
  }
}