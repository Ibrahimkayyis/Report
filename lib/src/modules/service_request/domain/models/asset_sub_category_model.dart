import 'package:equatable/equatable.dart';

class AssetSubCategoryModel extends Equatable {
  final int id;
  final String nama;

  const AssetSubCategoryModel({
    required this.id,
    required this.nama,
  });

  @override
  List<Object?> get props => [id, nama];
}