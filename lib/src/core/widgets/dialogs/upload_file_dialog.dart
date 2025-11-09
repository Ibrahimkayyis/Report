import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

// Model untuk file yang akan diupload
class FileUploadModel {
  final String fileName;
  final String filePath;
  final int fileSize;
  double progress;
  FileUploadStatus status;
  String? errorMessage;
  File? uploadedFile; // Store the uploaded file

  FileUploadModel({
    required this.fileName,
    required this.filePath,
    required this.fileSize,
    this.progress = 0.0,
    this.status = FileUploadStatus.waiting,
    this.errorMessage,
    this.uploadedFile,
  });

  String get formattedSize {
    const suffixes = ['B', 'KB', 'MB', 'GB'];
    var i = 0;
    var size = fileSize.toDouble();
    while (size >= 1024 && i < suffixes.length - 1) {
      size /= 1024;
      i++;
    }
    return '${size.toStringAsFixed(1)} ${suffixes[i]}';
  }
}

enum FileUploadStatus { waiting, uploading, complete, error }

class UploadFileDialog extends StatefulWidget {
  final String? uploadUrl;
  final Map<String, String>? headers;
  final Function(List<File>)? onFilesSelected;
  final int maxFileSize;
  final int maxTotalSize;

  const UploadFileDialog({
    super.key,
    this.uploadUrl,
    this.headers,
    this.onFilesSelected,
    this.maxFileSize = 5 * 1024 * 1024,
    this.maxTotalSize = 20 * 1024 * 1024,
  });

  static Future<bool?> show(
    BuildContext context, {
    String? uploadUrl,
    Map<String, String>? headers,
    Function(List<File>)? onFilesSelected,
    int? maxFileSize,
    int? maxTotalSize,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => UploadFileDialog(
        uploadUrl: uploadUrl,
        headers: headers,
        onFilesSelected: onFilesSelected,
        maxFileSize: maxFileSize ?? 5 * 1024 * 1024,
        maxTotalSize: maxTotalSize ?? 20 * 1024 * 1024,
      ),
    );
  }

  @override
  State<UploadFileDialog> createState() => _UploadFileDialogState();
}

class _UploadFileDialogState extends State<UploadFileDialog> {
  final List<FileUploadModel> _files = [];
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 500.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: ColorName.background,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          t.app.upload_dialog_title,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.textPrimary,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'File akan langsung diproses setelah dipilih',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: _isProcessing
                        ? null
                        : () => Navigator.of(context).pop(false),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    iconSize: 24.sp,
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              // Upload Area
              InkWell(
                onTap: _isProcessing ? null : _pickAndUploadFiles,
                borderRadius: BorderRadius.circular(8.r),
                child: CustomPaint(
                  painter: DashedBorderPainter(
                    color: _isProcessing
                        ? Colors.grey.shade200
                        : Colors.grey.shade300,
                    strokeWidth: 2,
                    dashWidth: 8,
                    dashSpace: 4,
                    borderRadius: 8.r,
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(32.w),
                    child: Column(
                      children: [
                        Icon(
                          Icons.cloud_upload_outlined,
                          size: 48.sp,
                          color: _isProcessing
                              ? Colors.grey
                              : ColorName.primary,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          _isProcessing
                              ? 'Memproses file...'
                              : t.app.upload_dialog_choose_file,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: _isProcessing
                                ? Colors.grey
                                : ColorName.primary,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          'PDF, JPG, PNG (Max ${(widget.maxFileSize / (1024 * 1024)).toInt()}MB per file)',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.h),

              // File List
              if (_files.isNotEmpty) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'File Terpilih (${_files.length})',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    Flexible(
                      child: Text(
                        _getOverallStatus(),
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: _getOverallStatusColor(),
                          fontWeight: FontWeight.w500,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                ...List.generate(
                  _files.length,
                  (index) => Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: _buildFileItem(_files[index]),
                  ),
                ),
              ],

              SizedBox(height: 24.h),

              // Tombol "Hapus Semua" (hanya muncul jika ada file)
              if (_files.isNotEmpty && !_isProcessing)
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _clearAllFiles,
                    icon: Icon(Icons.clear_all, size: 18.sp),
                    label: const Text('Hapus Semua'),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 10.h,
                      ),
                    ),
                  ),
                ),

              // Divider halus di antara tombol atas dan bawah
              if (_files.isNotEmpty && !_isProcessing) ...[
                SizedBox(height: 8.h),
                Divider(thickness: 0.6, color: Colors.grey.shade300),
                SizedBox(height: 8.h),
              ],

              // Tombol bawah: Batalkan & Selesai
              Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120.w,
                        child: TextButton(
                          onPressed: _isProcessing
                              ? null
                              : () => Navigator.of(context).pop(false),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.h,
                            ),
                            foregroundColor: _isProcessing
                                ? Colors.grey.shade400
                                : Colors.grey.shade700,
                            backgroundColor: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            t.app.upload_dialog_cancel,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16.w),
                      SizedBox(
                        width: 120.w,
                        child: ElevatedButton(
                          onPressed: _canConfirm() ? _confirmAndClose : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorName.primary,
                            foregroundColor: ColorName.background,
                            padding: EdgeInsets.symmetric(
                              horizontal: 20.w,
                              vertical: 12.h,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text(
                            'Selesai',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Pick files and immediately start uploading
  Future<void> _pickAndUploadFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: true,
      );

      if (result != null) {
        setState(() {
          _isProcessing = true;
        });

        for (PlatformFile file in result.files) {
          if (file.path != null) {
            final fileSize = file.size;

            // Validasi ukuran file
            if (fileSize > widget.maxFileSize) {
              _showSnackBar(
                'File ${file.name} terlalu besar (Max ${(widget.maxFileSize / (1024 * 1024)).toInt()}MB)',
                isError: true,
              );
              continue;
            }

            // Validasi total ukuran
            final currentTotalSize = _files.fold<int>(
              0,
              (sum, f) => sum + f.fileSize,
            );
            if (currentTotalSize + fileSize > widget.maxTotalSize) {
              _showSnackBar(
                'Total ukuran file melebihi batas maksimal',
                isError: true,
              );
              break;
            }

            // Cek duplikasi
            if (_files.any((f) => f.fileName == file.name)) {
              _showSnackBar(
                'File ${file.name} sudah ditambahkan',
                isError: true,
              );
              continue;
            }

            // Add file to list with uploading status
            final fileModel = FileUploadModel(
              fileName: file.name,
              filePath: file.path!,
              fileSize: fileSize,
              status: FileUploadStatus.uploading,
            );

            setState(() {
              _files.add(fileModel);
            });

            // Start upload immediately
            _uploadSingleFile(fileModel);
          }
        }

        setState(() {
          _isProcessing = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProcessing = false;
      });
      _showSnackBar('Error memilih file: $e', isError: true);
    }
  }

  // Upload single file dengan progress
  Future<void> _uploadSingleFile(FileUploadModel fileModel) async {
    try {
      // Jika tidak ada URL, simulasi upload
      if (widget.uploadUrl == null) {
        // Simulasi upload dengan delay dan progress
        for (int i = 0; i <= 100; i += 5) {
          await Future.delayed(const Duration(milliseconds: 50));
          if (mounted) {
            setState(() {
              fileModel.progress = i / 100;
            });
          }
        }
      } else {
        // Upload sebenarnya menggunakan HTTP
        final file = File(fileModel.filePath);
        final uri = Uri.parse(widget.uploadUrl!);

        final request = http.MultipartRequest('POST', uri);

        // Add headers jika ada
        if (widget.headers != null) {
          request.headers.addAll(widget.headers!);
        }

        // Add file
        final stream = http.ByteStream(file.openRead());
        final length = await file.length();

        final multipartFile = http.MultipartFile(
          'file',
          stream,
          length,
          filename: fileModel.fileName,
          contentType: _getMediaType(fileModel.fileName),
        );

        request.files.add(multipartFile);

        // Send request
        final response = await request.send();

        if (response.statusCode == 200 || response.statusCode == 201) {
          // Success
          if (mounted) {
            setState(() {
              fileModel.progress = 1.0;
            });
          }
        } else {
          throw Exception('Upload failed with status: ${response.statusCode}');
        }
      }

      // Mark as complete
      if (mounted) {
        setState(() {
          fileModel.status = FileUploadStatus.complete;
          fileModel.progress = 1.0;
          fileModel.uploadedFile = File(fileModel.filePath);
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          fileModel.status = FileUploadStatus.error;
          fileModel.errorMessage = e.toString();
        });
      }
    }
  }

  // Helper untuk mendapatkan media type
  MediaType _getMediaType(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return MediaType('application', 'pdf');
      case 'jpg':
      case 'jpeg':
        return MediaType('image', 'jpeg');
      case 'png':
        return MediaType('image', 'png');
      default:
        return MediaType('application', 'octet-stream');
    }
  }

  // Widget untuk menampilkan file item
  Widget _buildFileItem(FileUploadModel fileModel) {
    Color statusColor;
    String statusText;
    IconData statusIcon;

    switch (fileModel.status) {
      case FileUploadStatus.waiting:
        statusColor = Colors.blue;
        statusText = 'Menunggu';
        statusIcon = Icons.schedule;
        break;
      case FileUploadStatus.uploading:
        statusColor = Colors.orange;
        statusText = 'Memproses...';
        statusIcon = Icons.upload;
        break;
      case FileUploadStatus.complete:
        statusColor = ColorName.primary;
        statusText = 'Selesai';
        statusIcon = Icons.check_circle;
        break;
      case FileUploadStatus.error:
        statusColor = Colors.red;
        statusText = 'Gagal';
        statusIcon = Icons.error;
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: fileModel.status == FileUploadStatus.complete
            ? ColorName.background
            : fileModel.status == FileUploadStatus.error
            ? Colors.red.shade50
            : ColorName.background,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: fileModel.status == FileUploadStatus.uploading
              ? ColorName.primary.withValues(alpha:0.5)
              : Colors.transparent,
          width: fileModel.status == FileUploadStatus.uploading ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (fileModel.status == FileUploadStatus.uploading)
                SizedBox(
                  width: 24.sp,
                  height: 24.sp,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    value: fileModel.progress > 0 ? fileModel.progress : null,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      ColorName.primary,
                    ),
                  ),
                )
              else
                Icon(
                  _getFileIcon(fileModel.fileName),
                  size: 24.sp,
                  color: fileModel.status == FileUploadStatus.complete
                      ? ColorName.primary
                      : fileModel.status == FileUploadStatus.error
                      ? Colors.red
                      : ColorName.primary,
                ),
              SizedBox(width: 12.w),

              // Kolom teks dan status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileModel.fileName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorName.textPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 4.h),

                    // Gunakan Wrap agar otomatis pindah baris saat sempit
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 6.w,
                      runSpacing: 4.h,
                      children: [
                        Text(
                          fileModel.status == FileUploadStatus.uploading
                              ? '${(fileModel.progress * fileModel.fileSize / 1024).toInt()} KB / ${(fileModel.fileSize / 1024).toInt()} KB'
                              : fileModel.formattedSize,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: statusColor.withValues(alpha:0.1),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(statusIcon, size: 12.sp, color: statusColor),
                              SizedBox(width: 4.w),
                              Text(
                                fileModel.status == FileUploadStatus.uploading
                                    ? '${(fileModel.progress * 100).toInt()}%'
                                    : statusText,
                                style: TextStyle(
                                  fontSize: 10.sp,
                                  color: statusColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    if (fileModel.errorMessage != null)
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          fileModel.errorMessage!,
                          style: TextStyle(fontSize: 10.sp, color: Colors.red),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),

              SizedBox(width: 8.w),

              IconButton(
                onPressed:
                    (_isProcessing ||
                        fileModel.status == FileUploadStatus.uploading)
                    ? null
                    : () => _removeFile(fileModel),
                icon: Icon(
                  Icons.close,
                  color:
                      (_isProcessing ||
                          fileModel.status == FileUploadStatus.uploading)
                      ? Colors.grey
                      : Colors.red.shade400,
                ),
                iconSize: 20.sp,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),

          if (fileModel.status == FileUploadStatus.uploading) ...[
            SizedBox(height: 12.h),
            ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: LinearProgressIndicator(
                value: fileModel.progress,
                backgroundColor: Colors.grey.shade200,
                valueColor: AlwaysStoppedAnimation<Color>(ColorName.primary),
                minHeight: 6.h,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Helper untuk mendapatkan icon berdasarkan tipe file
  IconData _getFileIcon(String fileName) {
    final extension = fileName.split('.').last.toLowerCase();
    switch (extension) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      default:
        return Icons.insert_drive_file;
    }
  }

  // Remove file from list
  void _removeFile(FileUploadModel fileModel) {
    setState(() {
      _files.remove(fileModel);
    });
  }

  // Clear all files
  void _clearAllFiles() {
    setState(() {
      _files.clear();
    });
  }

  // Check if can confirm (at least one file uploaded successfully)
  bool _canConfirm() {
    return _files.isNotEmpty &&
        !_isProcessing &&
        _files.any((f) => f.status == FileUploadStatus.complete);
  }


  // Get overall status text
  String _getOverallStatus() {
    final uploading = _files
        .where((f) => f.status == FileUploadStatus.uploading)
        .length;
    final completed = _files
        .where((f) => f.status == FileUploadStatus.complete)
        .length;
    final error = _files
        .where((f) => f.status == FileUploadStatus.error)
        .length;

    if (uploading > 0) {
      return 'Memproses $uploading file...';
    } else if (error > 0 && completed == 0) {
      return 'Semua gagal';
    } else if (error > 0) {
      return '$completed berhasil, $error gagal';
    } else if (completed > 0) {
      return 'Semua berhasil';
    }
    return '';
  }

  // Get overall status color
  Color _getOverallStatusColor() {
    final hasError = _files.any((f) => f.status == FileUploadStatus.error);
    final hasUploading = _files.any(
      (f) => f.status == FileUploadStatus.uploading,
    );
    final allComplete = _files.every(
      (f) => f.status == FileUploadStatus.complete,
    );

    if (hasUploading) return Colors.orange;
    if (allComplete) return Colors.green;
    if (hasError) return Colors.red;
    return Colors.grey;
  }

  // Confirm and close dialog
  void _confirmAndClose() {
    final completedFiles = _files
        .where((f) => f.status == FileUploadStatus.complete)
        .map((f) => File(f.filePath))
        .toList();

    if (completedFiles.isNotEmpty) {
      widget.onFilesSelected?.call(completedFiles);
      Navigator.of(context).pop(true);
      _showSnackBar(
        '${completedFiles.length} file berhasil ditambahkan',
        isError: false,
      );
    }
  }

  // Show snackbar
  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

// Custom Painter for Dashed Border (tetap sama)
class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashWidth,
    required this.dashSpace,
    required this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path()
      ..addRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, size.width, size.height),
          Radius.circular(borderRadius),
        ),
      );

    final dashPath = _createDashedPath(path, dashWidth, dashSpace);
    canvas.drawPath(dashPath, paint);
  }

  Path _createDashedPath(Path source, double dashWidth, double dashSpace) {
    final Path dest = Path();
    for (final PathMetric metric in source.computeMetrics()) {
      double distance = 0.0;
      bool draw = true;
      while (distance < metric.length) {
        final double length = draw ? dashWidth : dashSpace;
        if (distance + length > metric.length) {
          if (draw) {
            dest.addPath(
              metric.extractPath(distance, metric.length),
              Offset.zero,
            );
          }
          break;
        } else {
          if (draw) {
            dest.addPath(
              metric.extractPath(distance, distance + length),
              Offset.zero,
            );
          }
        }
        distance += length;
        draw = !draw;
      }
    }
    return dest;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
