import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

class AppFormAttachFile extends StatefulWidget {
  final String? title;
  final Function(List<File>)? onFilesChanged;
  final String? uploadUrl;
  final Map<String, String>? headers;

  const AppFormAttachFile({
    super.key,
    this.title,
    this.onFilesChanged,
    this.uploadUrl,
    this.headers,
  });

  @override
  State<AppFormAttachFile> createState() => AppFormAttachFileState();
}

class AppFormAttachFileState extends State<AppFormAttachFile>
 {
  final List<File> _attachedFiles = [];

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final effectiveTitle = widget.title ?? t.app.attach_file_title;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title Section
        Text(
          effectiveTitle,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          t.app.attach_file_subtitle,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600),
        ),
        SizedBox(height: 12.h),

        // Attached Files Display
        if (_attachedFiles.isNotEmpty) ...[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'File Terlampir (${_attachedFiles.length})',
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    InkWell(
                      onTap: _clearAllFiles,
                      child: Text(
                        'Hapus Semua',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                ...List.generate(
                  _attachedFiles.length,
                  (index) => _buildAttachedFileItem(_attachedFiles[index], index),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.h),
        ],

        // Add File Button
        ElevatedButton.icon(
          onPressed: _openUploadDialog,
          icon: Icon(
            _attachedFiles.isEmpty ? Icons.attach_file : Icons.add,
            size: 18.sp,
          ),
          label: Text(
            _attachedFiles.isEmpty
                ? t.app.attach_file_button
                : 'Tambah File Lainnya',
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorName.primary,
            foregroundColor: ColorName.background,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),

        // Info Text
        if (_attachedFiles.isEmpty)
          Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Text(
              'Belum ada file yang dilampirkan',
              style: TextStyle(
                fontSize: 11.sp,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAttachedFileItem(File file, int index) {
    final fileName = file.path.split('/').last;
    final fileSize = _getFileSize(file);

    return Container(
      margin: EdgeInsets.only(bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(
            _getFileIcon(fileName),
            size: 20.sp,
            color: ColorName.primary,
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fileName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorName.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                FutureBuilder<String>(
                  future: fileSize,
                  builder: (context, snapshot) {
                    return Text(
                      snapshot.data ?? 'Calculating...',
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: Colors.grey.shade600,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _removeFile(index),
            icon: Icon(
              Icons.close,
              size: 16.sp,
              color: Colors.red.shade400,
            ),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(
              minWidth: 24.w,
              minHeight: 24.h,
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _getFileSize(File file) async {
    try {
      final bytes = await file.length();
      const suffixes = ['B', 'KB', 'MB', 'GB'];
      var i = 0;
      var size = bytes.toDouble();
      while (size >= 1024 && i < suffixes.length - 1) {
        size /= 1024;
        i++;
      }
      return '${size.toStringAsFixed(1)} ${suffixes[i]}';
    } catch (e) {
      return 'Unknown size';
    }
  }

  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      case 'doc':
      case 'docx':
        return Icons.description;
      default:
        return Icons.insert_drive_file;
    }
  }

  void _openUploadDialog() async {
    final result = await UploadFileDialog.show(
      context,
      uploadUrl: widget.uploadUrl,
      headers: widget.headers,
      onFilesSelected: (List<File> files) {
        setState(() {
          _attachedFiles.addAll(files);
        });
        widget.onFilesChanged?.call(_attachedFiles);
      },
    );

    if (result == true) {
      // Files were successfully added
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('File berhasil ditambahkan'),
          backgroundColor: Colors.green,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  void _removeFile(int index) {
    setState(() {
      _attachedFiles.removeAt(index);
    });
    widget.onFilesChanged?.call(_attachedFiles);
  }

  void _clearAllFiles() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Hapus Semua File?'),
        content: const Text(
          'Apakah Anda yakin ingin menghapus semua file yang telah dilampirkan?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _attachedFiles.clear();
              });
              widget.onFilesChanged?.call(_attachedFiles);
              Navigator.of(context).pop();
            },
            child: const Text(
              'Hapus',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  // Public method untuk mendapatkan attached files
  List<File> getAttachedFiles() => _attachedFiles;
}