import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';
import 'package:report/src/modules/profile/domain/repositories/profile_repository.dart';

@injectable
class UpdateProfileUsecase {
  final ProfileRepository repository;

  UpdateProfileUsecase(this.repository);

  Future<ProfileModel> call({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? filePath,
  }) {
    return repository.updateProfile(
      firstName: firstName,
      lastName: lastName,
      phoneNumber: phoneNumber,
      birthDate: birthDate,
      address: address,
      filePath: filePath,
    );
  }
}
