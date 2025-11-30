import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_cubit.dart';
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_state.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';
import '../widgets/helpdesk_chat_bubbles.dart';
import '../widgets/helpdesk_chat_header.dart';
import '../widgets/helpdesk_chat_types.dart';
import '../widgets/helpdesk_input_bar.dart';

@RoutePage()
class HelpdeskChatScreen extends StatefulWidget {
  const HelpdeskChatScreen({super.key});

  @override
  State<HelpdeskChatScreen> createState() => _HelpdeskChatScreenState();
}

class _HelpdeskChatScreenState extends State<HelpdeskChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  
  OpdModel? _selectedOpd;
  final Map<String, String> _chatIdsByOpd = {};
  final List<TempMessage> _pendingMessages = [];
  File? _selectedFile;
  bool _isImage = false;

  String? get _currentChatId =>
      _selectedOpd != null ? _chatIdsByOpd[_selectedOpd!.opdId] : null;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _onOpdChanged(BuildContext context, OpdModel? newOpd) {
    if (newOpd == null) return;

    setState(() {
      _selectedOpd = newOpd;
      _pendingMessages.clear();
      _selectedFile = null;
    });

    final cubit = context.read<HelpdeskChatCubit>();
    final existingChatId = _chatIdsByOpd[newOpd.opdId];

    if (existingChatId != null) {
      cubit.fetchChatHistory(existingChatId);
    } else {
      cubit.clearChat();
    }
  }

  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Pilih Sumber', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: ColorName.primary),
              title: const Text('Kamera'),
              onTap: () { Navigator.pop(context); _pickImage(ImageSource.camera); },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: ColorName.primary),
              title: const Text('Galeri'),
              onTap: () { Navigator.pop(context); _pickImage(ImageSource.gallery); },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file, color: ColorName.primary),
              title: const Text('Dokumen'),
              onTap: () { Navigator.pop(context); _pickDocument(); },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(source: source, imageQuality: 80);
      if (image != null) {
        setState(() {
          _selectedFile = File(image.path);
          _isImage = true;
        });
      }
    } catch (e) {
      _showSnack('Gagal mengambil foto: $e');
    }
  }

  Future<void> _pickDocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'txt'],
      );
      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFile = File(result.files.single.path!);
          _isImage = false;
        });
      }
    } catch (e) {
      _showSnack('Gagal memilih file: $e');
    }
  }

  void _onSendPressed(BuildContext context) {
    final message = _messageController.text.trim();
    if (message.isEmpty && _selectedFile == null) return;

    if (_selectedOpd == null) {
      _showSnack('Silakan pilih OPD tujuan terlebih dahulu');
      return;
    }

    final tempMsg = TempMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.isNotEmpty ? message : '📎 File attached',
      timestamp: DateTime.now(),
      status: MessageStatus.sending,
      attachedFile: _selectedFile,
      isImage: _isImage,
    );

    setState(() {
      _pendingMessages.insert(0, tempMsg);
      _selectedFile = null;
      _isImage = false;
    });

    _messageController.clear();
    _simulateMessageStatusUpdates(tempMsg.id);

    final cubit = context.read<HelpdeskChatCubit>();
    final chatId = _currentChatId;
    final msgText = message.isNotEmpty ? message : 'File attached';
    final filePath = tempMsg.attachedFile?.path;

    if (chatId == null) {
      cubit.sendMessage(opdId: _selectedOpd!.opdId, message: msgText, filePath: filePath);
    } else {
      cubit.sendReply(chatId: chatId, message: msgText, filePath: filePath);
    }
  }

  void _simulateMessageStatusUpdates(String messageId) {
    void updateStatus(MessageStatus status, int delayMs) {
      Future.delayed(Duration(milliseconds: delayMs), () {
        if (!mounted) return;
        setState(() {
          try {
            final msg = _pendingMessages.firstWhere((m) => m.id == messageId);
            msg.status = status;
          } catch (_) {}
        });
      });
    }
    updateStatus(MessageStatus.sent, 500);
    updateStatus(MessageStatus.delivered, 1000);
    updateStatus(MessageStatus.read, 2000);
  }

  void _showSnack(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<OpdCubit>()..fetchOpdList()),
        BlocProvider(create: (_) => sl<HelpdeskChatCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<HelpdeskChatCubit, HelpdeskChatState>(
            listener: (context, state) {
              if (state is HelpdeskChatError) {
                setState(() {
                  for (var msg in _pendingMessages) msg.status = MessageStatus.failed;
                });
                _showSnack(state.message);
              } else if (state is HelpdeskChatMessageSent) {
                if (_selectedOpd != null) {
                  setState(() => _chatIdsByOpd[_selectedOpd!.opdId] = state.chatId);
                }
                context.read<HelpdeskChatCubit>().fetchChatHistory(state.chatId);
              } else if (state is HelpdeskChatLoaded) {
                if (_pendingMessages.isNotEmpty) {
                  setState(() => _pendingMessages.clear());
                }
              }
            },
            child: Scaffold(
              backgroundColor: ColorName.background,
              appBar: AppPrimaryBar(title: t.app.helpdesk_title),
              body: SafeArea(
                child: Column(
                  children: [
                    BlocBuilder<OpdCubit, OpdState>(
                      builder: (context, state) {
                        final isLoading = state is OpdLoading;
                        final opdList = state is OpdLoaded ? state.opdList : <OpdModel>[];
                        final errorMsg = state is OpdError ? state.message : null;

                        return HelpdeskChatHeader(
                          introText: t.app.helpdesk_intro_text,
                          labelText: t.app.destination_opd,
                          hintText: t.app.select_opd,
                          opdList: opdList,
                          selectedOpd: _selectedOpd,
                          isLoading: isLoading,
                          errorMessage: errorMsg,
                          onOpdChanged: (value) => _onOpdChanged(context, value),
                        );
                      },
                    ),

                    Divider(height: 24.h, color: Colors.grey.shade300),

                    Expanded(
                      child: BlocBuilder<HelpdeskChatCubit, HelpdeskChatState>(
                        builder: (context, state) {
                          if (state is HelpdeskChatLoading && _pendingMessages.isEmpty) {
                            return const HelpdeskChatShimmer();
                          }

                          final messages = state is HelpdeskChatLoaded ? state.chatHistory.messages : [];

                          if (messages.isEmpty && _pendingMessages.isEmpty) {
                            return Center(
                              child: Text(
                                t.app.helpdesk_empty_chat,
                                style: TextStyle(color: Colors.grey.shade500, fontSize: 13.sp),
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                            reverse: true,
                            itemCount: messages.length + _pendingMessages.length,
                            itemBuilder: (context, index) {
                              if (index < _pendingMessages.length) {
                                final pendingMsg = _pendingMessages[index];
                                return HelpdeskMessageBubble(
                                  message: pendingMsg.text,
                                  isUser: true,
                                  status: pendingMsg.status,
                                  attachedFile: pendingMsg.attachedFile,
                                  isImage: pendingMsg.isImage,
                                );
                              }

                              final msgIndex = index - _pendingMessages.length;
                              final msg = messages[messages.length - 1 - msgIndex];
                              final isUser = msg.role == 'user';

                              return HelpdeskMessageBubble(
                                message: msg.message ?? '',
                                isUser: isUser,
                                status: isUser ? MessageStatus.read : null,
                                fileUrl: msg.fileUrl,
                              );
                            },
                          );
                        },
                      ),
                    ),

                    if (_selectedFile != null)
                      HelpdeskFilePreview(
                        file: _selectedFile!,
                        isImage: _isImage,
                        onRemove: () => setState(() {
                          _selectedFile = null;
                          _isImage = false;
                        }),
                      ),

                    HelpdeskInputBar(
                      controller: _messageController,
                      hintText: t.app.write_message,
                      isFileSelected: _selectedFile != null,
                      onAttachPressed: _showAttachmentOptions,
                      onSendPressed: () => _onSendPressed(context),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}