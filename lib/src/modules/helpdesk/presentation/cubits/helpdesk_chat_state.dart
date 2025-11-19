import 'package:equatable/equatable.dart';
import 'package:report/src/modules/helpdesk/domain/models/chat_history_model.dart';

abstract class HelpdeskChatState extends Equatable {
  const HelpdeskChatState();

  @override
  List<Object?> get props => [];
}

class HelpdeskChatInitial extends HelpdeskChatState {}

class HelpdeskChatLoading extends HelpdeskChatState {}

class HelpdeskChatLoaded extends HelpdeskChatState {
  final ChatHistoryModel chatHistory;

  const HelpdeskChatLoaded(this.chatHistory);

  @override
  List<Object?> get props => [chatHistory];
}

class HelpdeskChatMessageSent extends HelpdeskChatState {
  final String chatId;

  const HelpdeskChatMessageSent(this.chatId);

  @override
  List<Object?> get props => [chatId];
}

class HelpdeskChatError extends HelpdeskChatState {
  final String message;

  const HelpdeskChatError(this.message);

  @override
  List<Object?> get props => [message];
}
