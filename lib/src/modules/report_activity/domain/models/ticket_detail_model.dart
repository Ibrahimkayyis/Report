import 'package:equatable/equatable.dart';
import 'ticket_asset_model.dart';
import 'ticket_creator_model.dart';
import 'ticket_rating_model.dart';

class TicketDetailModel extends Equatable {
  final String ticketId;
  final String ticketCode;
  final String title;
  final String description;
  final String priority;
  final String status;
  final String createdAt;
  final String? lokasiKejadian;
  final String? expectedResolution;
  final String? pengerjaanAwal;
  final String? pengerjaanAkhir;
  final String? statusTicketPengguna;
  final String? statusTicketSeksi;
  final String? statusTicketTeknisi;
  
  // Nested Objects
  final TicketRatingModel? rating;
  final TicketCreatorModel? creator;
  final TicketAssetModel? asset;
  final List<String> files;

  const TicketDetailModel({
    required this.ticketId,
    required this.ticketCode,
    required this.title,
    required this.description,
    required this.priority,
    required this.status,
    required this.createdAt,
    this.lokasiKejadian,
    this.expectedResolution,
    this.pengerjaanAwal,
    this.pengerjaanAkhir,
    this.statusTicketPengguna,
    this.statusTicketSeksi,
    this.statusTicketTeknisi,
    this.rating,
    this.creator,
    this.asset,
    this.files = const [],
  });

  @override
  List<Object?> get props => [
        ticketId,
        ticketCode,
        title,
        description,
        priority,
        status,
        createdAt,
        lokasiKejadian,
        expectedResolution,
        pengerjaanAwal,
        pengerjaanAkhir,
        statusTicketPengguna,
        statusTicketSeksi,
        statusTicketTeknisi,
        rating,
        creator,
        asset,
        files,
      ];
}