import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';
import 'package:report/src/modules/service_request/domain/repositories/service_request_repository.dart';

@lazySingleton
class CreateServiceRequestUseCase {
  final ServiceRequestRepository repository;

  CreateServiceRequestUseCase(this.repository);

  Future<ServiceRequestResponseModel> call({
    required int subCategoryId,
    required String title,
    String? location,
    required String description,
    String? expectedResolution,
    List<File>? files,
  }) {
    return repository.createServiceRequest(
      subCategoryId: subCategoryId,
      title: title,
      location: location,
      description: description,
      expectedResolution: expectedResolution,
      files: files,
    );
  }
}