// lib/src/modules/service_request/presentation/screens/service_request_form_screen.dart

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class ServiceRequestFormScreen extends StatefulWidget {
  final String opdId;
  final String? opdName;
  final String? opdIconUrl;
  final Color? opdColor;

  const ServiceRequestFormScreen({
    super.key,
    required this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  @override
  State<ServiceRequestFormScreen> createState() =>
      _ServiceRequestFormScreenState();
}

class _ServiceRequestFormScreenState extends State<ServiceRequestFormScreen> {
  final _titleController = TextEditingController();
  final _problemController = TextEditingController();
  final _locationController = TextEditingController();
  final _expectedSolutionController = TextEditingController();
  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();

  String? _selectedCategory;
  String? _selectedAssetType;
  String? _selectedAssetForm;
  String? _selectedAssetData;

  List<File> _attachedFiles = [];

  // Dummy data sementara
  final List<String> _categoryOptions = [
    'Permintaan Reset Password',
    'Permintaan Akses Sistem',
    'Permintaan Perangkat Baru',
  ];
  final List<String> _assetTypeOptions = ['IT', 'Non-IT'];
  final List<String> _assetFormOptions = ['Fisik', 'Non-Fisik'];
  final List<String> _assetDataOptions = ['Asset 1', 'Asset 2', 'Asset 3'];

  @override
  void dispose() {
    _titleController.dispose();
    _problemController.dispose();
    _locationController.dispose();
    _expectedSolutionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.app.service_request_title),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // OPD Target Display
                  AppFormTargetDisplay(
                    name: widget.opdName ?? 'OPD - ${widget.opdId}',
                     imageUrl: widget.opdIconUrl,
                    color: widget.opdColor ?? ColorName.primary,
                  ),

                  SizedBox(height: 24.h),

                  // User Info Dummy
                  AppFormUserInfo(
                    name: 'Dewi Lestari',
                    nip: '198712312008102001',
                    division: 'Bidang Teknologi Informasi',
                  ),

                  SizedBox(height: 24.h),

                  // 1️⃣ Judul Permintaan
                  _buildSectionTitle(t.app.request_title_label),
                  SizedBox(height: 8.h),
                  _buildTextField(
                    controller: _titleController,
                    hint: t.app.request_title_hint,
                  ),

                  SizedBox(height: 24.h),

                  // 2️⃣ Kategori Layanan (dummy)
                  AppDropdownField(
                    label: t.app.category_label_service,
                    value: _selectedCategory,
                    items: _categoryOptions,
                    onChanged: (val) {
                      setState(() => _selectedCategory = val);
                    },
                  ),

                  SizedBox(height: 24.h),

                  // 3️⃣ Row: Jenis Aset + Bentuk Aset
                  Row(
                    children: [
                      Expanded(
                        child: AppDropdownField(
                          label: t.app.asset_type_label,
                          value: _selectedAssetType,
                          items: _assetTypeOptions,
                          onChanged: (val) {
                            setState(() => _selectedAssetType = val);
                          },
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: AppDropdownField(
                          label: t.app.asset_form_label,
                          value: _selectedAssetForm,
                          items: _assetFormOptions,
                          onChanged: (val) {
                            setState(() => _selectedAssetForm = val);
                          },
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // 4️⃣ Data Aset - Full width
                  AppDropdownField(
                    label: t.app.asset_data_label,
                    value: _selectedAssetData,
                    items: _assetDataOptions,
                    onChanged: (val) {
                      setState(() => _selectedAssetData = val);
                    },
                  ),

                  SizedBox(height: 24.h),

                  // 5️⃣ Lokasi Kejadian - Full width
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSectionTitle(t.app.location_label),
                      SizedBox(height: 8.h),
                      _buildTextField(
                        controller: _locationController,
                        hint: t.app.location_hint,
                      ),
                    ],
                  ),

                  SizedBox(height: 24.h),

                  // 6️⃣ Rincian Permintaan / Masalah
                  AppFormProblemDescription(
                    controller: _problemController,
                    title: t.app.problem_label,
                    hint: t.app.problem_hint,
                  ),

                  SizedBox(height: 24.h),

                  // 7️⃣ Lampiran File
                  AppFormAttachFile(
                    key: _attachFileKey,
                    title: t.app.attach_file_label,
                    uploadUrl: null,
                    onFilesChanged: (files) {
                      setState(() {
                        _attachedFiles = files;
                      });
                    },
                  ),

                  SizedBox(height: 24.h),

                  // 8️⃣ Informasi Tambahan / Penyelesaian yang Diharapkan
                  _buildSectionTitle(t.app.expected_solution_label),
                  SizedBox(height: 8.h),
                  _buildTextArea(
                    controller: _expectedSolutionController,
                    hint: t.app.expected_solution_hint,
                  ),

                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          AppFormBottomActions(
            onCancel: () => _handleCancel(context),
            onSaveDraft: () => _handleSaveDraft(context),
            onSubmit: () => _handleSubmit(context),
          ),
        ],
      ),
    );
  }

  // =====================================================
  // 🔹 Helper UI Widgets
  // =====================================================

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorName.textPrimary,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
        filled: true,
        fillColor: ColorName.white,
        contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ColorName.primary, width: 2),
        ),
      ),
      style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary),
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String hint,
  }) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
        filled: true,
        fillColor: ColorName.white,
        contentPadding: EdgeInsets.all(14.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: ColorName.primary, width: 2),
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        color: ColorName.textPrimary,
        height: 1.5,
      ),
    );
  }

  // =====================================================
  // 🔹 Action Handlers
  // =====================================================

  void _handleCancel(BuildContext context) {
    final t = context.t;
    final hasData = _titleController.text.isNotEmpty ||
        _problemController.text.isNotEmpty ||
        _selectedCategory != null ||
        _selectedAssetType != null ||
        _selectedAssetForm != null ||
        _selectedAssetData != null ||
        _locationController.text.isNotEmpty ||
        _expectedSolutionController.text.isNotEmpty ||
        _attachedFiles.isNotEmpty;

    if (hasData) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(t.app.dialog.cancel_request_title),
          content: Text(t.app.dialog.cancel_request_message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(t.app.dialog.continue_filling),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                context.router.pop();
              },
              child: Text(
                t.app.dialog.cancel_request,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      );
    } else {
      context.router.pop();
    }
  }

  void _handleSaveDraft(BuildContext context) {
    final t = context.t;
    final draft = {
      'opdId': widget.opdId,
      'opdName': widget.opdName,
      'title': _titleController.text,
      'category': _selectedCategory,
      'assetType': _selectedAssetType,
      'assetForm': _selectedAssetForm,
      'assetData': _selectedAssetData,
      'location': _locationController.text,
      'problem': _problemController.text,
      'expectedSolution': _expectedSolutionController.text,
      'attachedFilesCount': _attachedFiles.length,
      'timestamp': DateTime.now().toIso8601String(),
    };

    AppLogger.i('Saving draft: $draft');

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(t.app.draft_saved),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _handleSubmit(BuildContext context) {
    final t = context.t;

    if (!_validateForm(context)) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.app.dialog.confirm_submit_title,
        message: t.app.dialog.confirm_submit_message,
        confirmText: t.app.dialog.confirm_yes,
        cancelText: t.app.dialog.cancel,
        icon: Icons.warning_amber_rounded,
        onConfirm: () {
          Navigator.of(dialogContext).pop();

          // Dummy success page navigation
          context.router.push(
            ServiceRequestSuccessRoute(
              ticketNumber: "REQ-${DateTime.now().millisecondsSinceEpoch}",
              status: "Menunggu Konfirmasi",
              requestType: _selectedCategory ?? "Service Request",
            ),
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  bool _validateForm(BuildContext context) {
    final t = context.t;
    final errors = <String>[];

    if (_titleController.text.trim().isEmpty) {
      errors.add(t.app.validation.title_required);
    }

    if (_selectedCategory == null || _selectedCategory!.isEmpty) {
      errors.add(t.app.validation.category_required);
    }

    if (_selectedAssetType == null || _selectedAssetType!.isEmpty) {
      errors.add(t.app.validation.asset_type_required);
    }

    if (_selectedAssetForm == null || _selectedAssetForm!.isEmpty) {
      errors.add(t.app.validation.asset_form_required);
    }

    if (_selectedAssetData == null || _selectedAssetData!.isEmpty) {
      errors.add(t.app.validation.asset_data_required);
    }

    if (_locationController.text.trim().isEmpty) {
      errors.add(t.app.validation.location_required);
    }

    if (_problemController.text.trim().isEmpty) {
      errors.add(t.app.validation.description_required);
    } else if (_problemController.text.trim().length < 20) {
      errors.add(t.app.validation.description_min_length);
    }

    if (_expectedSolutionController.text.trim().isEmpty) {
      errors.add(t.app.validation.expected_solution_required);
    }

    if (errors.isNotEmpty) {
      showDialog(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: Text(t.app.dialog.incomplete_form_title),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: errors
                .map(
                  (e) => Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.error_outline, size: 16.sp, color: Colors.red),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(e, style: TextStyle(fontSize: 14.sp)),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(t.app.ok),
            ),
          ],
        ),
      );
      return false;
    }

    return true;
  }
}
