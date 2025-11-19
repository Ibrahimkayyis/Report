import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:report/src/modules/reporting/domain/models/opd_model.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_cubit.dart';
import 'package:report/src/modules/helpdesk/presentation/cubits/helpdesk_chat_state.dart';
import 'package:shimmer/shimmer.dart';

/// ✅ Message status enum (WhatsApp style)
enum MessageStatus {
  sending,
  sent,
  delivered,
  read,
  failed,
}

/// ✅ Temporary message model for pending messages
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

  // ✅ Map untuk menyimpan chatId per OPD
  final Map<String, String> _chatIdsByOpd = {};

  // ✅ List untuk temporary pending messages
  final List<TempMessage> _pendingMessages = [];

  // ✅ Selected file for preview
  File? _selectedFile;
  bool _isImage = false;

  // ✅ Current active chat ID
  String? get _currentChatId =>
      _selectedOpd != null ? _chatIdsByOpd[_selectedOpd!.opdId] : null;

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  /// ✅ Handle OPD selection change
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

  /// ✅ Pick image from camera
  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _selectedFile = File(image.path);
          _isImage = true;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal mengambil foto: $e')),
      );
    }
  }

  /// ✅ Pick image from gallery
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );

      if (image != null) {
        setState(() {
          _selectedFile = File(image.path);
          _isImage = true;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memilih foto: $e')),
      );
    }
  }

  /// ✅ Pick file (documents, etc)
  Future<void> _pickFile() async {
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal memilih file: $e')),
      );
    }
  }

  /// ✅ Show options for camera/gallery/file
  void _showAttachmentOptions() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) => Container(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Pilih Sumber',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.h),
            ListTile(
              leading: const Icon(Icons.camera_alt, color: ColorName.primary),
              title: const Text('Kamera'),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromCamera();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library, color: ColorName.primary),
              title: const Text('Galeri'),
              onTap: () {
                Navigator.pop(context);
                _pickImageFromGallery();
              },
            ),
            ListTile(
              leading: const Icon(Icons.attach_file, color: ColorName.primary),
              title: const Text('Dokumen'),
              onTap: () {
                Navigator.pop(context);
                _pickFile();
              },
            ),
          ],
        ),
      ),
    );
  }

  /// ✅ Fungsi kirim pesan dengan file (instant UI update)
  void _onSendPressed(BuildContext context) {
    final message = _messageController.text.trim();
    
    // Allow send if has message OR file
    if (message.isEmpty && _selectedFile == null) return;

    if (_selectedOpd == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Silakan pilih OPD tujuan terlebih dahulu')),
      );
      return;
    }

    // ✅ Create temporary message with file
    final tempMsg = TempMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: message.isNotEmpty ? message : '📎 File attached',
      timestamp: DateTime.now(),
      status: MessageStatus.sending,
      attachedFile: _selectedFile,
      isImage: _isImage,
    );

    // ✅ Add to pending messages (instant UI update)
    setState(() {
      _pendingMessages.insert(0, tempMsg);
      _selectedFile = null;
      _isImage = false;
    });

    _messageController.clear();

    // ✅ Send to API with file
    final cubit = context.read<HelpdeskChatCubit>();
    final chatId = _currentChatId;

    // Simulate status updates
    _simulateMessageStatusUpdates(tempMsg.id);

    if (chatId == null) {
      // 🔹 Kirim pesan pertama dengan file
      cubit.sendMessage(
        opdId: _selectedOpd!.opdId,
        message: message.isNotEmpty ? message : 'File attached',
        filePath: tempMsg.attachedFile?.path, // ✅ Pass file path as string
      );
    } else {
      // 🔹 Kirim balasan dengan file
      cubit.sendReply(
        chatId: chatId,
        message: message.isNotEmpty ? message : 'File attached',
        filePath: tempMsg.attachedFile?.path, // ✅ Pass file path as string
      );
    }
  }

  /// ✅ Simulate message status updates
  void _simulateMessageStatusUpdates(String messageId) {
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted && _pendingMessages.isNotEmpty) {
        setState(() {
          try {
            final msg = _pendingMessages.firstWhere(
              (m) => m.id == messageId,
            );
            msg.status = MessageStatus.sent;
          } catch (e) {
            // Message already cleared, ignore
          }
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 1000), () {
      if (mounted && _pendingMessages.isNotEmpty) {
        setState(() {
          try {
            final msg = _pendingMessages.firstWhere(
              (m) => m.id == messageId,
            );
            msg.status = MessageStatus.delivered;
          } catch (e) {
            // Message already cleared, ignore
          }
        });
      }
    });

    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted && _pendingMessages.isNotEmpty) {
        setState(() {
          try {
            final msg = _pendingMessages.firstWhere(
              (m) => m.id == messageId,
            );
            msg.status = MessageStatus.read;
          } catch (e) {
            // Message already cleared, ignore
          }
        });
      }
    });
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
                  for (var msg in _pendingMessages) {
                    msg.status = MessageStatus.failed;
                  }
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              } else if (state is HelpdeskChatMessageSent) {
                if (_selectedOpd != null) {
                  setState(() {
                    _chatIdsByOpd[_selectedOpd!.opdId] = state.chatId;
                  });
                }
                context
                    .read<HelpdeskChatCubit>()
                    .fetchChatHistory(state.chatId);
              } else if (state is HelpdeskChatLoaded) {
                if (_pendingMessages.isNotEmpty) {
                  setState(() {
                    _pendingMessages.clear();
                  });
                }
              }
            },
            child: Scaffold(
              backgroundColor: ColorName.background,
              appBar: AppPrimaryBar(title: t.app.helpdesk_title),
              body: SafeArea(
                child: Column(
                  children: [
                    // 🧠 Bagian atas: intro + dropdown
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 12.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.app.helpdesk_intro_text,
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 12.h),

                          BlocBuilder<OpdCubit, OpdState>(
                            builder: (context, state) {
                              if (state is OpdLoading) {
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    height: 42.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                  ),
                                );
                              } else if (state is OpdLoaded) {
                                final opdList = state.opdList;

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      flex: 3,
                                      child: Text(
                                        t.app.destination_opd,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: ColorName.textPrimary,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),

                                    Flexible(
                                      flex: 7,
                                      child: CustomDropdown<OpdModel>.search(
                                        hintText: t.app.select_opd,
                                        items: opdList,
                                        initialItem: _selectedOpd,
                                        onChanged: (value) =>
                                            _onOpdChanged(context, value),
                                        listItemBuilder: (context, opd,
                                            isSelected, onItemSelect) {
                                          return Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 14.r,
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                backgroundImage:
                                                    (opd.filePath ?? '')
                                                            .isNotEmpty
                                                        ? NetworkImage(
                                                            opd.filePath!)
                                                        : null,
                                                child: (opd.filePath ?? '')
                                                        .isEmpty
                                                    ? Icon(
                                                        Icons.account_balance,
                                                        size: 16.sp,
                                                        color: Colors
                                                            .grey.shade600,
                                                      )
                                                    : null,
                                              ),
                                              SizedBox(width: 8.w),
                                              Expanded(
                                                child: Text(
                                                  opd.opdName,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color:
                                                        ColorName.textPrimary,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        headerBuilder:
                                            (context, opd, isSelected) {
                                          return Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 14.r,
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                                backgroundImage:
                                                    (opd.filePath ?? '')
                                                            .isNotEmpty
                                                        ? NetworkImage(
                                                            opd.filePath!)
                                                        : null,
                                                child: (opd.filePath ?? '')
                                                        .isEmpty
                                                    ? Icon(
                                                        Icons.account_balance,
                                                        size: 16.sp,
                                                        color: Colors
                                                            .grey.shade600,
                                                      )
                                                    : null,
                                              ),
                                              SizedBox(width: 8.w),
                                              Expanded(
                                                child: Text(
                                                  opd.opdName,
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        ColorName.textPrimary,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        decoration: CustomDropdownDecoration(
                                          closedFillColor: ColorName.white,
                                          closedBorder: Border.all(
                                              color: Colors.grey.shade400),
                                          closedBorderRadius:
                                              BorderRadius.circular(10.r),
                                          expandedBorderRadius:
                                              BorderRadius.circular(10.r),
                                          closedShadow: [
                                            BoxShadow(
                                              color: ColorName.black
                                                  .withValues(alpha: 0.1),
                                              blurRadius: 8,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              } else if (state is OpdError) {
                                return Text(
                                  state.message,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 13.sp),
                                );
                              }

                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    ),

                    Divider(height: 24.h, color: Colors.grey.shade300),

                    // 💬 Area chat
                    Expanded(
                      child: BlocBuilder<HelpdeskChatCubit, HelpdeskChatState>(
                        builder: (context, state) {
                          if (state is HelpdeskChatLoading &&
                              _pendingMessages.isEmpty) {
                            return _buildShimmerLoading();
                          }

                          final messages = state is HelpdeskChatLoaded
                              ? state.chatHistory.messages
                              : [];

                          if (messages.isEmpty && _pendingMessages.isEmpty) {
                            return Center(
                              child: Text(
                                t.app.helpdesk_empty_chat,
                                style: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontSize: 13.sp,
                                ),
                              ),
                            );
                          }

                          return ListView.builder(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            reverse: true,
                            itemCount: messages.length + _pendingMessages.length,
                            itemBuilder: (context, index) {
                              if (index < _pendingMessages.length) {
                                final pendingMsg = _pendingMessages[index];
                                return _buildMessageBubble(
                                  message: pendingMsg.text,
                                  isUser: true,
                                  status: pendingMsg.status,
                                  attachedFile: pendingMsg.attachedFile,
                                  isImage: pendingMsg.isImage,
                                );
                              }

                              final msgIndex = index - _pendingMessages.length;
                              final msg =
                                  messages[messages.length - 1 - msgIndex];
                              final isUser = msg.role == 'user';

                              return _buildMessageBubble(
                                message: msg.message ?? '',
                                isUser: isUser,
                                status: isUser ? MessageStatus.read : null,
                                fileUrl: msg.fileUrl, // ✅ Use fileUrl from ChatMessageModel
                              );
                            },
                          );
                        },
                      ),
                    ),

                    // ✅ File preview (if selected)
                    if (_selectedFile != null) _buildFilePreview(),

                    // 📨 Input bar
                    Padding(
                      padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                color: ColorName.white,
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorName.black
                                        .withValues(alpha: 0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _messageController,
                                      decoration: InputDecoration(
                                        hintText: t.app.write_message,
                                        border: InputBorder.none,
                                        hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: _showAttachmentOptions,
                                    icon: Icon(
                                      _selectedFile != null
                                          ? Icons.attach_file
                                          : Icons.add_circle_outline,
                                      color: _selectedFile != null
                                          ? Colors.green
                                          : ColorName.primary,
                                    ),
                                    iconSize: 22.sp,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Container(
                            width: 44.w,
                            height: 44.w,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorName.primary,
                            ),
                            child: IconButton(
                              onPressed: () => _onSendPressed(context),
                              icon: const Icon(Icons.send_rounded,
                                  color: ColorName.onPrimary),
                              iconSize: 22.sp,
                            ),
                          ),
                        ],
                      ),
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

  /// ✅ Build file preview widget
  Widget _buildFilePreview() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          // Preview thumbnail
          if (_isImage && _selectedFile != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(
                _selectedFile!,
                width: 60.w,
                height: 60.w,
                fit: BoxFit.cover,
              ),
            )
          else
            Container(
              width: 60.w,
              height: 60.w,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                Icons.insert_drive_file,
                color: ColorName.primary,
                size: 30.sp,
              ),
            ),
          SizedBox(width: 12.w),
          
          // File name
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _selectedFile!.path.split('/').last,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  _isImage ? 'Gambar' : 'Dokumen',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          
          // Remove button
          IconButton(
            onPressed: () {
              setState(() {
                _selectedFile = null;
                _isImage = false;
              });
            },
            icon: const Icon(Icons.close, color: Colors.red),
            iconSize: 20.sp,
          ),
        ],
      ),
    );
  }

  /// ✅ Build shimmer loading
  Widget _buildShimmerLoading() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        final isUser = index % 2 == 0;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!isUser)
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
              if (!isUser) SizedBox(width: 8.w),
              Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                ),
              ),
              if (isUser) SizedBox(width: 8.w),
              if (isUser)
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: CircleAvatar(
                    radius: 16.r,
                    backgroundColor: Colors.grey.shade300,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  /// ✅ Build status icon
  Widget _buildStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.sending:
        return Icon(
          Icons.access_time,
          size: 14.sp,
          color: Colors.grey.shade400,
        );
      case MessageStatus.sent:
        return Icon(
          Icons.check,
          size: 14.sp,
          color: Colors.grey.shade400,
        );
      case MessageStatus.delivered:
        return Icon(
          Icons.done_all,
          size: 14.sp,
          color: Colors.grey.shade400,
        );
      case MessageStatus.read:
        return Icon(
          Icons.done_all,
          size: 14.sp,
          color: Colors.blue,
        );
      case MessageStatus.failed:
        return Icon(
          Icons.error_outline,
          size: 14.sp,
          color: Colors.red,
        );
    }
  }

  /// ✅ Build message bubble with file support
  Widget _buildMessageBubble({
    required String message,
    required bool isUser,
    MessageStatus? status,
    File? attachedFile,
    bool isImage = false,
    String? fileUrl,
  }) {
    final hasFile = attachedFile != null || (fileUrl != null && fileUrl.isNotEmpty);
    
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser)
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: Colors.grey.shade200,
                backgroundImage: AssetImage(
                  Assets.images.helpdeskAvatar.path,
                ),
              ),
            ),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(hasFile ? 8.w : 14.w),
              decoration: BoxDecoration(
                color: isUser ? ColorName.primary : Colors.grey.shade200,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14.r),
                  topRight: Radius.circular(14.r),
                  bottomLeft:
                      isUser ? Radius.circular(14.r) : Radius.circular(0),
                  bottomRight:
                      isUser ? Radius.circular(0) : Radius.circular(14.r),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // File/Image preview
                  if (hasFile) ...[
                    if (isImage && attachedFile != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.file(
                          attachedFile,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      )
                    else if (fileUrl != null && fileUrl.contains(RegExp(r'\.(jpg|jpeg|png|gif)$', caseSensitive: false)))
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          fileUrl,
                          width: 200.w,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 200.w,
                            height: 100.h,
                            color: Colors.grey.shade300,
                            child: const Icon(Icons.broken_image),
                          ),
                        ),
                      )
                    else
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: isUser 
                              ? Colors.white.withValues(alpha: 0.2)
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              color: isUser ? Colors.white : ColorName.primary,
                              size: 20.sp,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              attachedFile != null
                                  ? attachedFile.path.split('/').last
                                  : 'File',
                              style: TextStyle(
                                color: isUser
                                    ? ColorName.onPrimary
                                    : ColorName.textPrimary,
                                fontSize: 12.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    if (message.isNotEmpty && message != '📎 File attached')
                      SizedBox(height: 8.h),
                  ],
                  
                  // Message text (if not just file)
                  if (message.isNotEmpty && message != '📎 File attached')
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Flexible(
                          child: Text(
                            message,
                            style: TextStyle(
                              color: isUser
                                  ? ColorName.onPrimary
                                  : ColorName.textPrimary,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                        if (isUser && status != null) ...[
                          SizedBox(width: 6.w),
                          _buildStatusIcon(status),
                        ],
                      ],
                    )
                  else if (isUser && status != null)
                    // Status for file-only messages
                    Padding(
                      padding: EdgeInsets.only(top: 4.h),
                      child: _buildStatusIcon(status),
                    ),
                ],
              ),
            ),
          ),
          if (isUser)
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: CircleAvatar(
                radius: 16.r,
                backgroundColor: ColorName.primary.withValues(alpha: 0.2),
                backgroundImage: AssetImage(
                  Assets.images.userAvatar.path,
                ),
              ),
            ),
        ],
      ),
    );
  }
}