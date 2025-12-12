import 'package:equatable/equatable.dart';

class TicketAssetModel extends Equatable {
  final int? assetId;
  final String? namaAsset;
  final String? kodeBmd;
  final String? nomorSeri;
  final String? kategori;
  final int? subkategoriId;
  final String? subkategoriNama;
  final String? jenisAsset;
  final String? lokasiAsset;
  final int? opdIdAsset;

  const TicketAssetModel({
    this.assetId,
    this.namaAsset,
    this.kodeBmd,
    this.nomorSeri,
    this.kategori,
    this.subkategoriId,
    this.subkategoriNama,
    this.jenisAsset,
    this.lokasiAsset,
    this.opdIdAsset,
  });

  @override
  List<Object?> get props => [
        assetId,
        namaAsset,
        kodeBmd,
        nomorSeri,
        kategori,
        subkategoriId,
        subkategoriNama,
        jenisAsset,
        lokasiAsset,
        opdIdAsset,
      ];
}