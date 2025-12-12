import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/service_request/data/datasources/remote/source/abstract/service_request_remote_data_source.dart';
import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';
import 'package:report/src/modules/service_request/domain/repositories/service_request_repository.dart';

@LazySingleton(as: ServiceRequestRepository)
class ServiceRequestRepositoryImpl implements ServiceRequestRepository {
  final ServiceRequestRemoteDataSource remoteDataSource;

  ServiceRequestRepositoryImpl(this.remoteDataSource);

  @override
  Future<ServiceRequestResponseModel> createServiceRequest({
    required int subCategoryId,
    required String title,
    String? location,
    required String description,
    String? expectedResolution,
    List<File>? files,
  }) async {
    try {
      return await remoteDataSource.createServiceRequest(
        subCategoryId: subCategoryId,
        title: title,
        location: location,
        description: description,
        expectedResolution: expectedResolution,
        files: files,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<AssetSubCategoryModel>> getSubCategories() async {
    try {
      return await remoteDataSource.getSubCategories();
    } catch (e) {
      rethrow;
    }
  }
}