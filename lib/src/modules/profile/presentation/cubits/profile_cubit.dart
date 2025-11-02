import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/profile/domain/usecase/get_profile_usecase.dart';
import 'package:report/src/modules/profile/domain/usecase/update_profile_usecase.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  final GetProfileUsecase getProfileUsecase;
  final UpdateProfileUsecase updateProfileUsecase;

  ProfileCubit(
    this.getProfileUsecase,
    this.updateProfileUsecase,
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
      emit(ProfileUpdated(updatedProfile));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
