class User {
  final String email;
  final String firstName;
  final String lastName;
  final List<String> roles;
  final String? phoneNumber;
  final String? birthDate;
  final String? address;

  User({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.roles,
    this.phoneNumber,
    this.birthDate,
    this.address,
  });

  /// Parse dari JSON response API
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      roles: (json['roles'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      phoneNumber: json['phone_number'] as String?,
      birthDate: json['birth_date'] as String?,
      address: json['address'] as String?,
    );
  }

  /// Convert ke JSON (jika diperlukan untuk caching)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'roles': roles,
      if (phoneNumber != null) 'phone_number': phoneNumber,
      if (birthDate != null) 'birth_date': birthDate,
      if (address != null) 'address': address,
    };
  }

  /// Helper untuk mendapatkan role utama (role pertama dalam list)
  String get primaryRole => roles.isNotEmpty ? roles.first : 'masyarakat';

  /// Helper untuk mendapatkan nama lengkap
  String get fullName => '$firstName $lastName';

  /// Helper untuk check apakah user memiliki role tertentu
  bool hasRole(String role) => roles.contains(role);
}