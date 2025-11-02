import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';
import 'package:report/src/modules/profile/domain/repositories/profile_repository.dart';

@injectable
class GetProfileUsecase {
  final ProfileRepository repository;

  GetProfileUsecase(this.repository);

  Future<ProfileModel> call() {
    return repository.getProfile();
  }
}
