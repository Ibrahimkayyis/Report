import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String birthDate;
  final String address;
  final String jabatan;
  final String startDate;
  final String profileUrl;
  final List<String> roles;
  final String opdId;
  final String noEmployee;
  final String division;

  const ProfileModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.birthDate,
    required this.address,
    required this.jabatan,
    required this.startDate,
    required this.profileUrl,
    required this.roles,
    required this.opdId,
    required this.noEmployee,
    required this.division,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        firstName,
        lastName,
        phoneNumber,
        birthDate,
        address,
        jabatan,
        startDate,
        profileUrl,
        roles,
        opdId,
        noEmployee,
        division,
      ];
}
