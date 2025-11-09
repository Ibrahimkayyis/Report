import 'user_model.dart';

class AuthResponse {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final User user;

  AuthResponse({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.user,
  });

  /// Parse dari JSON response API login
  /// Response format:
  /// {
  ///   "access_token": "eyJhbGci...",
  ///   "refresh_token": "e4417924-11f8-...",
  ///   "token_type": "Bearer",
  ///   "user": { ... }
  /// }
  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      tokenType: json['token_type'] as String? ?? 'Bearer',
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  /// Convert ke JSON (untuk caching jika diperlukan)
  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'token_type': tokenType,
      'user': user.toJson(),
    };
  }

  /// Helper untuk mendapatkan role utama user
  String get userRole => user.primaryRole;

  /// Helper untuk mendapatkan full name user
  String get userName => user.fullName;
}