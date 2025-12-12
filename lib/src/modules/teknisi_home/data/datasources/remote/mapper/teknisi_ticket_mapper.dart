import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';

class TeknisiTicketMapper {
  static TeknisiTicketResponse fromResponse(Map<String, dynamic> json) {
    return TeknisiTicketResponse(
      total: json['total'] as int? ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  static TeknisiTicketModel fromJson(Map<String, dynamic> json) {
    return TeknisiTicketModel(
      id: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '-',
      title: json['title'] as String? ?? 'Tanpa Judul',
      description: json['description'] as String? ?? '-',
      priority: json['priority'] as String? ?? 'Low',
      status: json['status'] as String? ?? 'Unknown',
      source: json['ticket_source'] as String? ?? '-',
      statusTeknisi: json['status_ticket_teknisi'] as String? ?? 'Draft',
      createdAt: json['created_at'] as String? ?? '',
      
      // ✅ MAP REQUEST TYPE
      requestType: json['request_type'] as String? ?? 'pelaporan_online',

      pengerjaanAwal: json['pengerjaan_awal'] as String? ?? '',
      pengerjaanAkhir: json['pengerjaan_akhir'] as String? ?? '',
      pengerjaanAwalTeknisi: json['pengerjaan_awal_teknisi'] as String?,
      pengerjaanAkhirTeknisi: json['pengerjaan_akhir_teknisi'] as String?,
      
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
          
      creator: _mapCreator(json['creator']),
      asset: _mapAsset(json['asset']),
    );
  }

  static TeknisiCreatorModel _mapCreator(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return const TeknisiCreatorModel(
        userId: '',
        fullName: 'Unknown User',
        email: '-',
      );
    }
    return TeknisiCreatorModel(
      userId: json['user_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? 'Unknown User',
      email: json['email'] as String? ?? '-',
      profileUrl: json['profile'] as String?,
    );
  }

  static TeknisiAssetModel? _mapAsset(dynamic json) {
    if (json is! Map<String, dynamic>) return null;
    
    if (json['asset_id'] == null) return null;

    return TeknisiAssetModel(
      assetId: json['asset_id'] is int 
          ? json['asset_id'] 
          : int.tryParse(json['asset_id'].toString()),
      namaAsset: json['nama_asset'] as String? ?? '-',
      kodeBmd: json['kode_bmd'] as String? ?? '-',
      nomorSeri: json['nomor_seri'] as String? ?? '-',
      kategori: json['kategori'] as String? ?? '-',
      subkategoriNama: json['subkategori_nama'] as String?,
      jenisAsset: json['jenis_asset'] as String? ?? '-',
      lokasi: json['lokasi_asset'] as String?,
    );
  }
}