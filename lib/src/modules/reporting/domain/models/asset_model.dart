import 'package:equatable/equatable.dart';

class AssetModel extends Equatable {
  final int id;
  final String kodeBmd;
  final String namaAsset;
  final String? nomorSeri;
  final String kategori;
  final String jenis;
  final AssetUnitKerja? unitKerja;
  final AssetBarang? assetBarang;

  const AssetModel({
    required this.id,
    required this.kodeBmd,
    required this.namaAsset,
    this.nomorSeri,
    required this.kategori,
    required this.jenis,
    this.unitKerja,
    this.assetBarang,
  });

  @override
  List<Object?> get props => [
        id,
        kodeBmd,
        namaAsset,
        nomorSeri,
        kategori,
        jenis,
        unitKerja,
        assetBarang,
      ];
}

class AssetUnitKerja extends Equatable {
  final int id;
  final String nama;

  const AssetUnitKerja({
    required this.id,
    required this.nama,
  });

  @override
  List<Object?> get props => [id, nama];
}

class AssetBarang extends Equatable {
  final int id;
  final AssetSubKategori? subKategori;
  final AssetLokasi? lokasi;

  const AssetBarang({
    required this.id,
    this.subKategori,
    this.lokasi,
  });

  @override
  List<Object?> get props => [id, subKategori, lokasi];
}

class AssetSubKategori extends Equatable {
  final int id;
  final String nama;

  const AssetSubKategori({
    required this.id,
    required this.nama,
  });

  @override
  List<Object?> get props => [id, nama];
}

class AssetLokasi extends Equatable {
  final int id;
  final String nama;
  final String? alamat;

  const AssetLokasi({
    required this.id,
    required this.nama,
    this.alamat,
  });

  @override
  List<Object?> get props => [id, nama, alamat];
}