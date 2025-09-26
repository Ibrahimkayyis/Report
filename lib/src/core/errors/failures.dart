// lib/src/core/errors/failures.dart

/// Base class untuk semua kegagalan (Failure)
/// 
/// Dibuat lebih fleksibel: constructor menerima [String?] lalu
/// di-normalisasi jadi [String] agar tidak ada error "String? can't be assigned".
abstract class Failure implements Exception {
  final String message;
  Failure(String? message) : message = message ?? 'Unknown error';

  @override
  String toString() => message;
}

/// Error dari sisi server (status code 4xx/5xx).
class ServerFailure extends Failure {
  ServerFailure(String? message) : super(message);
}

/// Error jaringan (misal koneksi terputus, timeout, DNS gagal).
class NetworkFailure extends Failure {
  NetworkFailure(String? message) : super(message);
}

/// Error validasi dari backend (contoh: email tidak valid, password kurang panjang).
class ValidationFailure extends Failure {
  /// Detail error per field (jika ada).
  final Map<String, List<String>>? fieldErrors;

  ValidationFailure(String? message, {this.fieldErrors}) : super(message);
}

/// Error tidak diketahui (misalnya parsing gagal, bug internal, dll).
class UnknownFailure extends Failure {
  UnknownFailure(String? message) : super(message);
}
