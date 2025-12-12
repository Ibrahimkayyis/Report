import 'package:report/src/modules/reporting/domain/models/asset_model.dart';

class AssetMapper {
  static AssetModel fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id'].toString()) ?? 0,
      kodeBmd: json['kode_bmd'] as String? ?? '',
      namaAsset: json['nama_asset'] as String? ?? '',
      nomorSeri: json['nomor_seri'] as String?,
      kategori: json['kategori'] as String? ?? '',
      jenis: json['jenis'] as String? ?? '',
      
      // Mapping Nested Objects
      unitKerja: json['unit_kerja'] != null
          ? _mapUnitKerja(json['unit_kerja'] as Map<String, dynamic>)
          : null,
      assetBarang: json['asset_barang'] != null
          ? _mapAssetBarang(json['asset_barang'] as Map<String, dynamic>)
          : null,
    );
  }

  static AssetUnitKerja _mapUnitKerja(Map<String, dynamic> json) {
    return AssetUnitKerja(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id'].toString()) ?? 0,
      nama: json['nama'] as String? ?? '',
    );
  }

  static AssetBarang _mapAssetBarang(Map<String, dynamic> json) {
    return AssetBarang(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id'].toString()) ?? 0,
      
      // Handle potential null sub_kategori inside asset_barang
      subKategori: json['sub_kategori'] != null
          ? _mapSubKategori(json['sub_kategori'] as Map<String, dynamic>)
          : null,
          
      // Handle potential null lokasi inside asset_barang
      lokasi: json['lokasi'] != null
          ? _mapLokasi(json['lokasi'] as Map<String, dynamic>)
          : null,
    );
  }

  static AssetSubKategori _mapSubKategori(Map<String, dynamic> json) {
    return AssetSubKategori(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id'].toString()) ?? 0,
      nama: json['nama'] as String? ?? '',
    );
  }

  static AssetLokasi _mapLokasi(Map<String, dynamic> json) {
    return AssetLokasi(
      id: json['id'] is int 
          ? json['id'] 
          : int.tryParse(json['id'].toString()) ?? 0,
      nama: json['nama'] as String? ?? '',
      alamat: json['alamat'] as String?,
    );
  }
}