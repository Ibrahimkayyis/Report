import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/domain/usecase/delete_profile_picture_usecase.dart'; // ✅ Import UseCase baru
import 'package:report/src/modules/profile/domain/usecase/get_profile_usecase.dart';
import 'package:report/src/modules/profile/domain/usecase/update_profile_usecase.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  final UpdateProfileUsecase updateProfileUsecase;
  final DeleteProfilePictureUseCase deleteProfilePictureUsecase; // ✅ Inject

  ProfileCubit(
    this.getProfileUsecase,
    this.updateProfileUsecase,
    this.deleteProfilePictureUsecase,
  ) : super(ProfileInitial());

  /// 🔹 Ambil profil pengguna
  Future<void> fetchProfile() async {
    emit(ProfileLoading());
    try {
      final profile = await getProfileUsecase();
      emit(ProfileLoaded(profile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  /// 🔹 Update profil pengguna
  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? birthDate,
    String? address,
    String? filePath,
  }) async {
    // 1. Simpan data role dari state saat ini sebelum loading
    String? currentRoleName;
    if (state is ProfileLoaded) {
      currentRoleName = (state as ProfileLoaded).profile.roleName;
    } else if (state is ProfileUpdated) {
      currentRoleName = (state as ProfileUpdated).profile.roleName;
    }

    emit(ProfileLoading());
    
    try {
      final updatedProfile = await updateProfileUsecase(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        birthDate: birthDate,
        address: address,
        filePath: filePath,
      );

      // 2. Jika API tidak mengembalikan roleName, gunakan yang lama
      final fixedProfile = updatedProfile.copyWith(
        roleName: updatedProfile.roleName ?? currentRoleName,
      );

      emit(ProfileUpdated(fixedProfile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
  /// 🔹 Hapus foto profil (Khusus Masyarakat)
  Future<void> deletePhoto() async {
    emit(ProfileLoading());
    try {
      // 1. Panggil API Delete
      await deleteProfilePictureUsecase();
      
      // 2. Fetch ulang profil terbaru (tanpa foto) agar state sinkron
      final updatedProfile = await getProfileUsecase();
      
      emit(ProfilePhotoDeleted(updatedProfile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}