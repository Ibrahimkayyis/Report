import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/domain/repositories/profile_repository.dart';

@lazySingleton
class DeleteProfilePictureUseCase {
  final ProfileRepository repository;

  DeleteProfilePictureUseCase(this.repository);

  /// Menjalankan perintah hapus foto profil
  Future<void> call() async {
    return await repository.deleteProfilePicture();
  }
}