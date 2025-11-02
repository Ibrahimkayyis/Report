import 'package:report/src/modules/profile/domain/models/profile_model.dart';

class ProfileMapper {
  /// 🔹 Konversi dari JSON (GET /profile)
  static ProfileModel fromJson(Map<String, Object?> json) {
    return ProfileModel(
      id: json['id'] as String? ?? '',
      email: json['email'] as String? ?? '',
      firstName: json['first_name'] as String? ?? '',
      lastName: json['last_name'] as String? ?? '',
      phoneNumber: json['phone_number'] as String? ?? '',
      birthDate: json['birth_date'] as String? ?? '',
      address: json['address'] as String? ?? '',
      jabatan: json['jabatan'] as String? ?? '',
      startDate: json['start_date'] as String? ?? '',
      profileUrl: json['profile_url'] as String? ?? '',
      roles: (json['roles'] as List?)?.map((e) => e.toString()).toList() ?? [],
      opdId: json['opd_id'] as String? ?? '',
      noEmployee: json['no_employee'] as String? ?? '',
      division: json['division'] as String? ?? '',
    );
  }

  /// 🔹 Konversi ke Map (PUT /profile)
  static Map<String, Object?> toMap(ProfileModel model) {
    return {
      'first_name': model.firstName.isEmpty ? null : model.firstName,
      'last_name': model.lastName.isEmpty ? null : model.lastName,
      'phone_number': model.phoneNumber.isEmpty ? null : model.phoneNumber,
      'birth_date': model.birthDate.isEmpty ? null : model.birthDate,
      'address': model.address.isEmpty ? null : model.address,
      // file dihandle terpisah melalui multipart
    };
  }
}
