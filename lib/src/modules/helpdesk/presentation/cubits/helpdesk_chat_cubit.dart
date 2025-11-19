import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:report/src/modules/helpdesk/domain/usecase/get_chat_history_use_case.dart';
import 'package:report/src/modules/helpdesk/domain/usecase/send_message_use_case.dart';
import 'package:report/src/modules/helpdesk/domain/usecase/send_reply_use_case.dart';
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_state.dart';

@injectable
class HelpdeskChatCubit extends Cubit<HelpdeskChatState> {
  final SendMessageUseCase _sendMessageUseCase;
  final SendReplyUseCase _sendReplyUseCase;
  final GetChatHistoryUseCase _getChatHistoryUseCase;

  HelpdeskChatCubit(
    this._sendMessageUseCase,
    this._sendReplyUseCase,
    this._getChatHistoryUseCase,
  ) : super(HelpdeskChatInitial());

  Future<void> sendMessage({
    required String opdId,
    String? message,
    String? filePath,
  }) async {
    emit(HelpdeskChatLoading());

    try {
      final chatId = await _sendMessageUseCase(
        opdId: opdId,
        message: message,
        filePath: filePath,
      );

      emit(HelpdeskChatMessageSent(chatId));
    } catch (e) {
      emit(HelpdeskChatError('Gagal mengirim pesan: $e'));
    }
  }

  Future<void> sendReply({
    required String chatId,
    String? message,
    String? filePath,
  }) async {
    emit(HelpdeskChatLoading());

    try {
      await _sendReplyUseCase(
        chatId: chatId,
        message: message,
        filePath: filePath,
      );

      final updatedHistory = await _getChatHistoryUseCase(chatId);
      emit(HelpdeskChatLoaded(updatedHistory));
    } catch (e) {
      emit(HelpdeskChatError('Gagal mengirim balasan: $e'));
    }
  }

  Future<void> fetchChatHistory(String chatId) async {
    emit(HelpdeskChatLoading());

    try {
      final chatHistory = await _getChatHistoryUseCase(chatId);
      emit(HelpdeskChatLoaded(chatHistory));
    } catch (e) {
      emit(HelpdeskChatError('Gagal mengambil riwayat chat: $e'));
    }
  }

  void reset() => emit(HelpdeskChatInitial());
  void clearChat() {
  emit(HelpdeskChatInitial());
}
}
