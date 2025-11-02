import 'package:equatable/equatable.dart';

class TicketCategoryModel extends Equatable {
  final String categoryId;
  final String opdId;
  final String categoryName;
  final String? description;

  const TicketCategoryModel({
    required this.categoryId,
    required this.opdId,
    required this.categoryName,
    this.description,
  });

  TicketCategoryModel copyWith({
    String? categoryId,
    String? opdId,
    String? categoryName,
    String? description,
  }) {
    return TicketCategoryModel(
      categoryId: categoryId ?? this.categoryId,
      opdId: opdId ?? this.opdId,
      categoryName: categoryName ?? this.categoryName,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [categoryId, opdId, categoryName, description];
}
