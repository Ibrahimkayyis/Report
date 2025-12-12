import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';

class TeknisiTicketDetailMapper {
  static TeknisiTicketDetailModel fromJson(Map<String, dynamic> json) {
    return TeknisiTicketDetailModel(
      id: json['ticket_id'] as String? ?? '',
      ticketCode: json['ticket_code'] as String? ?? '-',
      title: json['title'] as String? ?? 'Tanpa Judul',
      description: json['description'] as String? ?? '-',
      priority: json['priority'] as String? ?? 'Low',
      status: json['status'] as String? ?? 'Unknown',
      ticketSource: json['ticket_source'] as String? ?? '-',
      createdAt: json['created_at'] as String? ?? '',
      
      // Status View
      statusTicketPengguna: json['status_ticket_pengguna'] as String? ?? '-',
      statusTicketSeksi: json['status_ticket_seksi'] as String? ?? '-',
      statusTicketTeknisi: json['status_ticket_teknisi'] as String? ?? 'Draft',

      // Jadwal
      pengerjaanAwal: json['pengerjaan_awal'] as String? ?? '',
      pengerjaanAkhir: json['pengerjaan_akhir'] as String? ?? '',
      pengerjaanAwalTeknisi: json['pengerjaan_awal_teknisi'] as String?,
      pengerjaanAkhirTeknisi: json['pengerjaan_akhir_teknisi'] as String?,

      // Data Tambahan
      lokasiKejadian: json['lokasi_kejadian'] as String?,
      expectedResolution: json['expected_resolution'] as String?,

      // Risiko & Dampak
      kategoriRisikoId: json['kategori_risiko_id_asset'] as int?,
      kategoriRisikoNama: json['kategori_risiko_nama_asset'] as String?,
      
      // ✅ FIX: Konversi int ke String dengan aman
      kategoriRisikoSeleraNegatif: json['kategori_risiko_selera_negatif']?.toString(),
      kategoriRisikoSeleraPositif: json['kategori_risiko_selera_positif']?.toString(),
      
      areaDampakId: json['area_dampak_id_asset'] as int?,
      areaDampakNama: json['area_dampak_nama_asset'] as String?,
      deskripsiPengendalian: json['deskripsi_pengendalian_bidang'] as String?,

      // Nested Objects
      creator: _mapCreator(json['creator']),
      asset: _mapAsset(json['asset']),
      files: (json['files'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  static TicketCreatorModel _mapCreator(dynamic json) {
    if (json is! Map<String, dynamic>) {
      return const TicketCreatorModel(
        userId: '',
        fullName: 'Unknown User',
        email: '-',
      );
    }
    return TicketCreatorModel(
      userId: json['user_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? 'Unknown User',
      email: json['email'] as String? ?? '-',
      profileUrl: json['profile'] as String?,
    );
  }

  static TicketAssetModel? _mapAsset(dynamic json) {
    if (json is! Map<String, dynamic>) return null;
    
    // Jika asset_id null, berarti tidak ada aset
    if (json['asset_id'] == null) return null;

    return TicketAssetModel(
      assetId: json['asset_id'] is int 
          ? json['asset_id'] 
          : int.tryParse(json['asset_id'].toString()),
      namaAsset: json['nama_asset'] as String? ?? '-',
      kodeBmd: json['kode_bmd'] as String? ?? '-',
      nomorSeri: json['nomor_seri'] as String? ?? '-',
      kategori: json['kategori'] as String? ?? '-',
      subkategoriId: json['subkategori_id'] is int 
          ? json['subkategori_id'] 
          : int.tryParse(json['subkategori_id'].toString()),
      subkategoriNama: json['subkategori_nama'] as String? ?? '-',
      jenisAsset: json['jenis_asset'] as String? ?? '-',
      lokasiAsset: json['lokasi_asset'] as String?,
      opdIdAsset: json['opd_id_asset'] is int
          ? json['opd_id_asset']
          : int.tryParse(json['opd_id_asset'].toString()),
    );
  }
}