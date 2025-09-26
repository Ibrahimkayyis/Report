import 'failures.dart';

String mapFailureToMessage(Object error) {
  if (error is Failure) {
    if (error is ValidationFailure) {
      return error.message;
    }
    if (error is ServerFailure) {
      return error.message.isNotEmpty ? error.message : 'Server error';
    }
    if (error is NetworkFailure) {
      return 'Tidak dapat terhubung ke server. Periksa koneksi internet Anda.';
    }
    if (error is UnknownFailure) {
      return error.message;
    }
    return error.message; // fallback
  }
  return 'Terjadi kesalahan tak dikenal';
}
