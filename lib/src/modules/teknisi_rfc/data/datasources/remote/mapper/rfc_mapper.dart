import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';

class RfcMapper {
  /// Mengubah JSON Map menjadi RfcModel
  static RfcModel fromJson(Map<String, dynamic> json, {required RfcType type}) {
    
    // Helper function to safely parse status_trace
    String? parseStatusTrace(dynamic value) {
      if (value == null) return null;
      if (value is List) {
        // If it's a list, take the last status (most recent) or join them.
        if (value.isEmpty) return null;
        return value.last.toString(); 
      }
      return value.toString();
    }

    // Helper function to safely parse lampiran
    String? parseLampiran(dynamic value) {
      if (value == null) return null;
      if (value is List) {
        if (value.isEmpty) return null;
        return value.join(', '); 
      }
      return value.toString();
    }

    return RfcModel(
      type: type,
      localRfcId: json['local_rfc_id'] ?? '',
      traceRfcId: json['trace_rfc_id'], 
      judulPerubahan: json['judul_perubahan'] ?? '-',
      kategoriAset: json['kategori_aset'] ?? '-',
      idAset: json['id_aset'] ?? 0,
      deskripsiAset: json['deskripsi_aset'] ?? '-',
      alasanPerubahan: json['alasan_perubahan'] ?? '-',
      dampakPerubahan: json['dampak_perubahan'] ?? '-',
      dampakJikaTidak: json['dampak_jika_tidak'] ?? '-',
      biayaEstimasi: json['biaya_estimasi'] ?? 0,
      namaPemohon: json['nama_pemohon'] ?? '-',
      opdPemohon: json['opd_pemohon'] ?? '-',
      riskScoreAset: json['risk_score_aset'] ?? 0,
      createdAt: json['created_at'] ?? '',
      
      // ✅ FIX: Use helper function for status_trace
      statusTrace: parseStatusTrace(json['status_trace']),
      
      rencanaImplementasi: json['rencana_implementasi'],
      alasanPenolakan: json['alasan_penolakan'],
      rencanaRollback: json['rencana_rollback'],
      
      // Used helper 
      lampiran: parseLampiran(json['lampiran']),

      // Field Khusus Change Request (Nullable)
      ticketId: json['ticket_id'],
      ticketCode: json['ticket_code'],
      ticketStatus: json['ticket_status'],
    );
  }
}