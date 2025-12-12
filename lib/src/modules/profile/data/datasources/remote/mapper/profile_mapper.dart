import 'package:report/src/modules/profile/domain/models/profile_model.dart';

class ProfileMapper {
  
  // --- MASYARAKAT (Tetap sama) ---
  static ProfileModel fromMasyarakatJson(Map<String, dynamic> json) {
    final fullName = json['full_name'] as String? ?? '';
    final nameParts = _splitName(fullName);

    return ProfileModel(
      id: json['id']?.toString() ?? '',
      email: json['email'] as String? ?? '',
      fullName: fullName,
      firstName: nameParts['first'],
      lastName: nameParts['last'],
      phoneNumber: json['phone_number'] as String?,
      address: json['address'] as String?,
      roleName: json['role_name'] as String?,
      profileUrl: json['profile_url'] as String?,
      nik: json['nik'] as String?,
      roleId: null, 
    );
  }

  // --- INTERNAL (PEGAWAI/TEKNISI) - UPDATED STRUKTUR BARU ---
  static ProfileModel fromInternalJson(Map<String, dynamic> json) {
    // 1. Ambil object 'user' pembungkus
    final userWrapper = json['user'] as Map<String, dynamic>? ?? {};
    
    // 2. Ambil object 'user' asli di dalamnya
    final userData = userWrapper['user'] as Map<String, dynamic>? ?? {};
    
    // 3. Ambil object 'opd' (jika ada) untuk data dinas yang lebih lengkap
    final opdData = json['opd'] as Map<String, dynamic>? ?? {};

    final fullName = userData['name'] as String? ?? '';
    final nameParts = _splitName(fullName);

    // Parsing Role ID
    final roleId = userData['role_id'] is int 
        ? userData['role_id'] as int 
        : int.tryParse(userData['role_id']?.toString() ?? '0') ?? 0;

    // Prioritaskan nama role dari API ('role': 'opd'), jika null pakai mapping manual
    String roleName = userData['role'] as String? ?? '';
    if (roleName.isEmpty) {
       if (roleId == 1) roleName = 'diskominfo';
       else if (roleId == 2) roleName = 'opd';
       else if (roleId == 6) roleName = 'teknisi';
       else roleName = 'pegawai';
    }

    // Ambil Data Dinas & Unit Kerja (Prioritas dari object OPD, fallback ke User)
    final dinasName = opdData['opd_nama'] as String? ?? userData['dinas'] as String?;
    final unitKerja = opdData['unit_kerja_nama'] as String? ?? userData['unit_kerja'] as String?;
    final dinasId = opdData['opd_id']?.toString() ?? userData['unit_kerja_id']?.toString();

    return ProfileModel(
      id: userData['id']?.toString() ?? '',
      email: userData['email'] as String? ?? '',
      fullName: fullName,
      firstName: nameParts['first'],
      lastName: nameParts['last'],
      
      roleName: roleName,
      roleId: roleId,
      
      usernameAsset: userData['username'] as String?,
      
      // ✅ Mapping Baru
      dinasName: dinasName, 
      unitKerja: unitKerja,
      dinasId: dinasId,
      
      address: userData['alamat'] as String?, 
      profileUrl: userData['profile'] as String? ?? userData['avatar'] as String?, // Cek profile atau avatar
      
      phoneNumber: null,
      nik: null,
    );
  }

  static Map<String, String> _splitName(String fullName) {
    if (fullName.trim().isEmpty) return {'first': '', 'last': ''};
    final parts = fullName.trim().split(' ');
    if (parts.length == 1) return {'first': parts[0], 'last': ''};
    
    final first = parts[0];
    final last = parts.sublist(1).join(' ');
    return {'first': first, 'last': last};
  }
}