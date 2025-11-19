import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/domain/repositories/helpdesk_repository.dart';

@injectable
class SendMessageUseCase {
  final HelpdeskRepository repository;

  SendMessageUseCase(this.repository);

  Future<String> call({
    required String opdId,
    String? message,
    String? filePath,
  }) async {
    try {
      return await repository.sendMessage(
        opdId: opdId,
        message: message,
        filePath: filePath,
      );
    } catch (e) {
      throw Exception('Gagal mengirim pesan ke Helpdesk: $e');
    }
  }
}
