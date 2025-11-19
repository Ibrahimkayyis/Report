import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/domain/repositories/helpdesk_repository.dart';

@injectable
class SendReplyUseCase {
  final HelpdeskRepository repository;

  SendReplyUseCase(this.repository);

  Future<String> call({
    required String chatId,
    String? message,
    String? filePath,
  }) async {
    try {
      return await repository.sendReply(
        chatId: chatId,
        message: message,
        filePath: filePath,
      );
    } catch (e) {
      throw Exception('Gagal mengirim balasan ke Helpdesk: $e');
    }
  }
}
