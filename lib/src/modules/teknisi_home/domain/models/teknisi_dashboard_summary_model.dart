import 'package:equatable/equatable.dart';

class TeknisiDashboardSummaryModel extends Equatable {
  final String teknisiId;
  final int opdId;
  final int totalTickets;
  final int inProgress;
  final int reopen;
  final int deadline;

  const TeknisiDashboardSummaryModel({
    required this.teknisiId,
    required this.opdId,
    required this.totalTickets,
    required this.inProgress,
    required this.reopen,
    required this.deadline,
  });

  /// Factory untuk nilai default (kosong) agar UI aman saat loading/error
  factory TeknisiDashboardSummaryModel.empty() {
    return const TeknisiDashboardSummaryModel(
      teknisiId: '',
      opdId: 0,
      totalTickets: 0,
      inProgress: 0,
      reopen: 0,
      deadline: 0,
    );
  }

  @override
  List<Object?> get props => [
        teknisiId,
        opdId,
        totalTickets,
        inProgress,
        reopen,
        deadline,
      ];
}