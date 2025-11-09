import 'package:equatable/equatable.dart';

class TagModel extends Equatable {
  final String id;
  final String name;

  const TagModel({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];
}
