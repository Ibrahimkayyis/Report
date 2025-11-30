import 'dart:io';

enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}

class TempMessage {
  final String id;
  final String text;
  final DateTime timestamp;
  MessageStatus status;
  final File? attachedFile;
  final bool isImage;

  TempMessage({
    required this.id,
    required this.text,
    required this.timestamp,
    this.status = MessageStatus.sending,
    this.attachedFile,
    this.isImage = false,
  });
}