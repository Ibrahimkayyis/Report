import 'package:equatable/equatable.dart';

class TicketCreatorModel extends Equatable {
  final String userId;
  final String fullName;
  final String email;
  final String? profile;

  const TicketCreatorModel({
    required this.userId,
    required this.fullName,
    required this.email,
    this.profile,
  });

  @override
  List<Object?> get props => [userId, fullName, email, profile];
}