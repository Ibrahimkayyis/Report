abstract class Failure implements Exception {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}

class ValidationFailure extends Failure {
  /// detail bisa berupa map field -> messages atau string
  final Map<String, List<String>>? fieldErrors;
  ValidationFailure(String message, {this.fieldErrors}) : super(message);
}
class UnknownFailure extends Failure {
  UnknownFailure(String message) : super(message);
}