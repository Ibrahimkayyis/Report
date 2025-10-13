import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/service_request/domain/models/service_type.dart';

/// 🧭 A centralized text dictionary for all Service Request forms.
/// Each [ServiceType] has its own localized labels, hints, and titles.
class ServiceRequestTexts {
  final String title;
  final String problemLabel;
  final String problemHint;
  final String priorityLabel;
  final String attachFileLabel;
  final String additionalInfoLabel;

  /// Dynamic field labels (custom dropdowns / inputs)
  final String? field1Label;
  final String? field2Label;
  final String? field3Label; // optional (e.g., device count)

  const ServiceRequestTexts({
    required this.title,
    required this.problemLabel,
    required this.problemHint,
    required this.priorityLabel,
    required this.attachFileLabel,
    required this.additionalInfoLabel,
    this.field1Label,
    this.field2Label,
    this.field3Label,
  });

  /// Get the proper text set based on [ServiceType]
  factory ServiceRequestTexts.of(ServiceType type, Translations t) {
    switch (type) {
      case ServiceType.resetPassword:
        return ServiceRequestTexts(
          title: t.app.service_reset_password_title,
          problemLabel: t.app.service_reset_password_problem_label,
          problemHint: t.app.service_reset_password_problem_hint,
          priorityLabel: t.app.service_reset_password_priority_label,
          attachFileLabel: t.app.attach_file_label,
          additionalInfoLabel: t.app.additional_info_label,
          field1Label: t.app.select_device_label,
        );

      case ServiceType.systemAccess:
        return ServiceRequestTexts(
          title: t.app.service_system_access_title,
          problemLabel: t.app.service_system_access_problem_label,
          problemHint: t.app.service_system_access_problem_hint,
          priorityLabel: t.app.service_system_access_priority_label,
          attachFileLabel: t.app.attach_file_label,
          additionalInfoLabel: t.app.additional_info_label,
          field1Label: t.app.select_system_label,
          field2Label: t.app.select_access_type_label,
        );

      case ServiceType.deviceRequest:
        return ServiceRequestTexts(
          title: t.app.service_device_request_title,
          problemLabel: t.app.service_device_request_problem_label,
          problemHint: t.app.service_device_request_problem_hint,
          priorityLabel: t.app.service_device_request_priority_label,
          attachFileLabel: t.app.attach_file_label,
          additionalInfoLabel: t.app.additional_info_label,
          field1Label: t.app.select_device_type_label,
          field3Label: t.app.device_count_label,
        );
    }
  }
}
