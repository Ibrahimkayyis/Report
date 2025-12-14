import 'package:equatable/equatable.dart';

class ConfigurationItemModel extends Equatable {
  final int id;
  final String assetId;
  final String name;
  final String status;

  const ConfigurationItemModel({
    required this.id,
    required this.assetId,
    required this.name,
    required this.status,
  });

  @override
  List<Object?> get props => [id, assetId, name, status];
}