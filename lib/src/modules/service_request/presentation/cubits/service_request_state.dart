import 'package:equatable/equatable.dart';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

enum ServiceRequestStatus { initial, loading, success, failure }
enum SubmissionStatus { initial, submitting, success, error }

class ServiceRequestState extends Equatable {
  // State untuk Fetching Data Awal (Sub Categories)
  final ServiceRequestStatus status;
  final List<AssetSubCategoryModel> subCategories;
  final String? errorMessage;

  // State untuk Submission Form
  final SubmissionStatus submissionStatus;
  final ServiceRequestResponseModel? submitResult;
  final String? submissionError;

  const ServiceRequestState({
    this.status = ServiceRequestStatus.initial,
    this.subCategories = const [],
    this.errorMessage,
    this.submissionStatus = SubmissionStatus.initial,
    this.submitResult,
    this.submissionError,
  });

  ServiceRequestState copyWith({
    ServiceRequestStatus? status,
    List<AssetSubCategoryModel>? subCategories,
    String? errorMessage,
    SubmissionStatus? submissionStatus,
    ServiceRequestResponseModel? submitResult,
    String? submissionError,
  }) {
    return ServiceRequestState(
      status: status ?? this.status,
      subCategories: subCategories ?? this.subCategories,
      errorMessage: errorMessage,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      submitResult: submitResult ?? this.submitResult,
      submissionError: submissionError,
    );
  }

  @override
  List<Object?> get props => [
        status,
        subCategories,
        errorMessage,
        submissionStatus,
        submitResult,
        submissionError,
      ];
}