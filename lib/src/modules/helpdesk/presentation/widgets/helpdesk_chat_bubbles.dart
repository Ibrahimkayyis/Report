import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:shimmer/shimmer.dart';
import 'helpdesk_chat_types.dart';

class HelpdeskMessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final MessageStatus? status;
  final File? attachedFile;
  final bool isImage;
  final String? fileUrl;
  final String? time;

  const HelpdeskMessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    this.status,
    this.attachedFile,
    this.isImage = false,
    this.fileUrl,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    final hasFile = attachedFile != null || (fileUrl != null && fileUrl!.isNotEmpty);
    final hasText = message.isNotEmpty && message != '📎 File attached';

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) ...[
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Colors.grey.shade200,
              backgroundImage: AssetImage(Assets.images.helpdeskAvatar.path),
            ),
            SizedBox(width: 8.w),
          ],
          
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: IntrinsicWidth(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: hasFile ? 8.w : 12.w,
                  vertical: hasFile ? 8.w : 8.w,
                ),
                decoration: BoxDecoration(
                  color: isUser ? ColorName.primary : Colors.grey.shade200,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
                    topRight: Radius.circular(14.r),
                    bottomLeft: isUser ? Radius.circular(14.r) : Radius.circular(0),
                    bottomRight: isUser ? Radius.circular(0) : Radius.circular(14.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasFile) ...[
                      _buildFileView(),
                      if (hasText) SizedBox(height: 8.h),
                    ],
                    
                    if (hasText)
                      _buildMessageWithStatus()
                    else if (hasFile && isUser && (status != null || time != null))
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 4.h),
                          child: _buildTimeAndStatus(),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),

          if (isUser) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: ColorName.primary.withValues(alpha: 0.2),
              backgroundImage: AssetImage(Assets.images.userAvatar.path),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageWithStatus() {
    final showMeta = isUser && (status != null || time != null);
    
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: showMeta ? 50.w : 0,
            bottom: showMeta ? 2.h : 0,
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUser ? ColorName.onPrimary : ColorName.textPrimary,
              fontSize: 14.sp,
            ),
          ),
        ),
        
        if (showMeta)
          Positioned(
            right: 0,
            bottom: 0,
            child: _buildTimeAndStatus(),
          ),
      ],
    );
  }

  Widget _buildTimeAndStatus() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (time != null) ...[
          Text(
            time!,
            style: TextStyle(
              fontSize: 11.sp,
              color: isUser 
                  ? Colors.white.withValues(alpha: 0.7) 
                  : Colors.grey.shade600,
            ),
          ),
          SizedBox(width: 4.w),
        ],
        if (status != null) _StatusIcon(status: status!),
      ],
    );
  }

  Widget _buildFileView() {
    if (isImage && attachedFile != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.file(attachedFile!, width: 200.w, fit: BoxFit.cover),
      );
    } else if (fileUrl != null && fileUrl!.contains(RegExp(r'\.(jpg|jpeg|png|gif)$', caseSensitive: false))) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Image.network(
          fileUrl!,
          width: 200.w,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => _buildGenericFileIcon(Colors.grey.shade300),
        ),
      );
    } else {
      return _buildGenericFileIcon(isUser ? Colors.white.withValues(alpha: 0.2) : Colors.grey.shade300);
    }
  }

  Widget _buildGenericFileIcon(Color bgColor) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(8.r)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.insert_drive_file, color: isUser ? Colors.white : ColorName.primary, size: 20.sp),
          SizedBox(width: 8.w),
          Flexible(
            child: Text(
              attachedFile?.path.split('/').last ?? 'File Attachment',
              style: TextStyle(color: isUser ? ColorName.onPrimary : ColorName.textPrimary, fontSize: 12.sp),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusIcon extends StatelessWidget {
  final MessageStatus status;
  const _StatusIcon({required this.status});

  @override
  Widget build(BuildContext context) {
    IconData icon;
    Color color = Colors.white.withValues(alpha: 0.7); 
    
    switch (status) {
      case MessageStatus.sending: icon = Icons.access_time; break;
      case MessageStatus.sent: icon = Icons.check; break;
      case MessageStatus.delivered: icon = Icons.done_all; break;
      case MessageStatus.read: icon = Icons.done_all; color = Colors.lightBlueAccent; break;
      case MessageStatus.failed: icon = Icons.error_outline; color = Colors.redAccent; break;
    }
    return Icon(icon, size: 14.sp, color: color);
  }
}

class HelpdeskFilePreview extends StatelessWidget {
  final File file;
  final bool isImage;
  final VoidCallback onRemove;

  const HelpdeskFilePreview({
    super.key,
    required this.file,
    required this.isImage,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
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
          if (isImage)
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: Image.file(file, width: 60.w, height: 60.w, fit: BoxFit.cover),
            )
          else
            Container(
              width: 60.w, height: 60.w,
              decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(8.r)),
              child: Icon(Icons.insert_drive_file, color: ColorName.primary, size: 30.sp),
            ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  file.path.split('/').last,
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  maxLines: 1, overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(isImage ? 'Gambar' : 'Dokumen', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600)),
              ],
            ),
          ),
          IconButton(
            onPressed: onRemove,
            icon: const Icon(Icons.close, color: Colors.red),
            iconSize: 20.sp,
          ),
        ],
      ),
    );
  }
}

class HelpdeskChatShimmer extends StatelessWidget {
  const HelpdeskChatShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      itemCount: 5,
      itemBuilder: (context, index) {
        final isUser = index % 2 == 0;
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Row(
              mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
              children: [
                if (!isUser) _circle(),
                if (!isUser) SizedBox(width: 8.w),
                Container(
                  width: 200.w, height: 40.h,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14.r)),
                ),
                if (isUser) SizedBox(width: 8.w),
                if (isUser) _circle(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _circle() => Container(width: 32.r, height: 32.r, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle));
}