import 'package:equatable/equatable.dart';

class OpdModel extends Equatable {
  final String opdId;
  final String opdName;
  final String description;
  final String? filePath;

  const OpdModel({
    required this.opdId,
    required this.opdName,
    required this.description,
    this.filePath,
  });

  @override
  List<Object?> get props => [opdId, opdName, description, filePath];
}
