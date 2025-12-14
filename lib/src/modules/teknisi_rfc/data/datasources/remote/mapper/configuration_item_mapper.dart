import '../../../../domain/models/configuration_item_model.dart';

class ConfigurationItemMapper {
  /// Mengubah JSON Response menjadi List [ConfigurationItemModel]
  static List<ConfigurationItemModel> mapToListResponse(Map<String, dynamic> json) {
    // Berdasarkan dokumentasi, list ada di dalam key "items"
    final List<dynamic> data = json['items'] ?? [];

    return data.map((e) {
      final item = e as Map<String, dynamic>;
      
      return ConfigurationItemModel(
        id: item['id'] as int? ?? 0,
        assetId: item['asset_id'] as String? ?? '',
        name: item['name'] as String? ?? '-',
        status: item['status'] as String? ?? 'active',
      );
    }).toList();
  }
}