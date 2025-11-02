import 'package:equatable/equatable.dart';

class OpdModel extends Equatable {
  final String opdId;
  final String opdName;
  final String description;

  const OpdModel({required this.opdId, required this.opdName, required this.description});

  @override
  List<Object?> get props => [opdId, opdName, description];
}