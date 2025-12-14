import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String id;
  final String email;
  final String fullName;
  
  final String? firstName; 
  final String? lastName;
  
  final String? roleName; 
  final String? profileUrl; 
  
  // Field Khusus Pegawai/Teknisi
  final int? roleId;
  final String? usernameAsset;
  final String? dinasName; // Nama Dinas / OPD
  final String? dinasId;
  final String? unitKerja; // ✅ Field Baru (Bidang/Unit)

  // Field Khusus Masyarakat
  final String? phoneNumber;
  final String? address;
  final String? nik;
  final String? birthDate;

  const ProfileModel({
    required this.id,
    required this.email,
    required this.fullName,
    this.firstName,
    this.lastName,
    this.roleName,
    this.profileUrl,
    this.roleId,
    this.usernameAsset,
    this.dinasName,
    this.dinasId,
    this.unitKerja, // ✅
    this.phoneNumber,
    this.address,
    this.nik,
    this.birthDate,
  });

  /// ✅ METHOD COPYWITH DITAMBAHKAN DI SINI
  /// Berfungsi untuk menyalin objek saat ini dengan mengubah beberapa field tertentu
  ProfileModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? firstName,
    String? lastName,
    String? roleName,
    String? profileUrl,
    int? roleId,
    String? usernameAsset,
    String? dinasName,
    String? dinasId,
    String? unitKerja,
    String? phoneNumber,
    String? address,
    String? nik,
    String? birthDate,
  }) {
    return ProfileModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      roleName: roleName ?? this.roleName,
      profileUrl: profileUrl ?? this.profileUrl,
      roleId: roleId ?? this.roleId,
      usernameAsset: usernameAsset ?? this.usernameAsset,
      dinasName: dinasName ?? this.dinasName,
      dinasId: dinasId ?? this.dinasId,
      unitKerja: unitKerja ?? this.unitKerja,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      nik: nik ?? this.nik,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  List<Object?> get props => [
        id, email, fullName, firstName, lastName, roleName, 
        profileUrl, roleId, usernameAsset, dinasName, dinasId, unitKerja,
        phoneNumber, address, nik, birthDate
      ];
}