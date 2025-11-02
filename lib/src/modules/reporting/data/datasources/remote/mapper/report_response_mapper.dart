import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

class ReportResponseMapper {
  static ReportResponseModel fromJson(Map<String, dynamic> json) {
    return ReportResponseModel(
      message: json['message'] ?? '',
      ticketId: json['ticket_id'] ?? '',
      status: json['status'] ?? '',
      ticketStage: json['ticket_stage'] ?? '',
      fileUrl: json['file_url'],
    );
  }
}
