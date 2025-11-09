// lib/src/modules/reporting/presentation/screens/reporting_form_screen.dart

import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'package:report/src/modules/reporting/domain/models/ticket_category_model.dart';
import 'package:report/src/modules/reporting/presentation/cubits/ticket_category_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/ticket_category_state.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_state.dart';

@RoutePage()
class ReportingFormScreen extends StatefulWidget {
  final String opdId;
  final String? opdName;
  final String? opdIconUrl;
  final Color? opdColor;

  const ReportingFormScreen({
    super.key,
    required this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
  });

  @override
  State<ReportingFormScreen> createState() => _ReportingFormScreenState();
}

class _ReportingFormScreenState extends State<ReportingFormScreen> {
  final _titleController = TextEditingController();
  final _problemController = TextEditingController();
  final _locationController = TextEditingController();
  final _expectedSolutionController = TextEditingController();
  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();

  String? _selectedCategoryName;
  String? _selectedCategoryId;
  String? _selectedAssetType;
  String? _selectedAssetForm;
  String? _selectedAssetData;
  List<TicketCategoryModel> _categories = [];
  List<File> _attachedFiles = [];

  // Dummy options for new fields
  final List<String> _assetTypeOptions = ['IT', 'Non-IT'];
  final List<String> _assetFormOptions = ['Fisik', 'Non-Fisik'];
  final List<String> _assetDataOptions = [
    'Asset 1',
    'Asset 2',
    'Asset 3',
    'Asset 4',
  ];

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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
        BlocProvider(
          create: (_) => sl<TicketCategoryCubit>()..fetchCategories(),
        ),
        BlocProvider(create: (_) => sl<ReportCubit>()),
      ],
      child: Builder(
        builder: (context) {
          return BlocListener<ReportCubit, ReportState>(
            listener: (context, state) {
              if (state is ReportLoading) {
                _showLoadingDialog(context);
              } else if (state is ReportSuccess) {
                Navigator.of(context, rootNavigator: true).pop();
                context.router.push(
                  ReportSuccessRoute(
                    ticketNumber: state.report.ticketId,
                    status: state.report.status,
                    opdName: widget.opdName ?? 'OPD - ${widget.opdId}',
                  ),
                );
              } else if (state is ReportError) {
                Navigator.of(context, rootNavigator: true).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Gagal mengirim laporan: ${state.message}'),
                    backgroundColor: Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              }
            },
            child: Scaffold(
              backgroundColor: ColorName.background,
              appBar: AppPrimaryBar(title: t.app.online_reporting_title),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Target OPD Display
                          AppFormTargetDisplay(
                            name: widget.opdName ?? 'OPD - ${widget.opdId}',
                            imageUrl: widget.opdIconUrl,
                            color: widget.opdColor ?? ColorName.primary,
                          ),

                          SizedBox(height: 24.h),

                          // User Information
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              if (state is ProfileLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is ProfileLoaded ||
                                  state is ProfileUpdated) {
                                final profile = (state is ProfileLoaded)
                                    ? state.profile
                                    : (state as ProfileUpdated).profile;

                                final fullName =
                                    '${profile.firstName} ${profile.lastName}'
                                        .trim();

                                return AppFormUserInfo(
                                  name: fullName.isNotEmpty ? fullName : '-',
                                  nip: profile.noEmployee.isNotEmpty
                                      ? profile.noEmployee
                                      : '-',
                                  division: profile.division.isNotEmpty
                                      ? profile.division
                                      : '-',
                                );
                              } else if (state is ProfileError) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 8.h),
                                  child: Text(
                                    'Gagal memuat profil pengguna: ${state.message}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),

                          SizedBox(height: 24.h),

                          // Judul Pelaporan
                          _buildSectionTitle(t.app.report_title_label),
                          SizedBox(height: 8.h),
                          _buildTextField(
                            controller: _titleController,
                            hint: t.app.report_title_hint,
                          ),

                          SizedBox(height: 24.h),

                          // Category Selector (Dropdown)
                          BlocBuilder<TicketCategoryCubit, TicketCategoryState>(
                            builder: (context, state) {
                              if (state is TicketCategoryLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is TicketCategoryLoaded) {
                                _categories = state.categories;
                                final categoryNames = _categories
                                    .map((e) => e.categoryName)
                                    .toList();

                                return AppDropdownField(
                                  label: t.app.category_label,
                                  value: _selectedCategoryName,
                                  items: categoryNames,
                                  onChanged: (name) {
                                    setState(() {
                                      _selectedCategoryName = name;
                                      _selectedCategoryId = _categories
                                          .firstWhere(
                                            (e) => e.categoryName == name,
                                          )
                                          .categoryId;
                                    });
                                    debugPrint(
                                      'Selected category ID: $_selectedCategoryId',
                                    );
                                  },
                                );
                              } else if (state is TicketCategoryError) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.h),
                                  child: Text(
                                    'Gagal memuat kategori: ${state.message}',
                                    style: const TextStyle(color: Colors.red),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            },
                          ),

                          SizedBox(height: 24.h),

                          // 2️⃣ Row: Jenis Aset + Bentuk Aset
                          Row(
                            children: [
                              Expanded(
                                child: AppDropdownField(
                                  label: t.app.asset_type_label,
                                  value: _selectedAssetType,
                                  items: _assetTypeOptions,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAssetType = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: AppDropdownField(
                                  label: t.app.asset_form_label,
                                  value: _selectedAssetForm,
                                  items: _assetFormOptions,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedAssetForm = value;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 24.h),

                          // 3️⃣ Data Aset - Full Width
                          AppDropdownField(
                            label: t.app.asset_data_label,
                            value: _selectedAssetData,
                            items: _assetDataOptions,
                            onChanged: (value) {
                              setState(() {
                                _selectedAssetData = value;
                              });
                            },
                          ),

                          SizedBox(height: 24.h),

                          // 4️⃣ Lokasi Kejadian - Full Width
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

                          // Problem Description (Rincian Masalah)
                          AppFormProblemDescription(
                            controller: _problemController,
                          ),

                          SizedBox(height: 24.h),

                          // File Attachment
                          AppFormAttachFile(
                            key: _attachFileKey,
                            title: t.app.attach_file_label,
                            uploadUrl: null,
                            onFilesChanged: (files) {
                              setState(() {
                                _attachedFiles = files;
                              });
                              debugPrint('Files attached: ${files.length}');
                            },
                          ),

                          SizedBox(height: 24.h),

                          // Penyelesaian yang Diharapkan
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

                  // Bottom Action Buttons
                  AppFormBottomActions(
                    onCancel: () => _handleCancel(context),
                    onSaveDraft: () => _handleSaveDraft(context),
                    onSubmit: () => _handleSubmit(context),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

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

  void _handleCancel(BuildContext context) {
    final hasData =
        _titleController.text.isNotEmpty ||
        _problemController.text.isNotEmpty ||
        _selectedCategoryName != null ||
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
          title: Text(t.app.dialog.cancel_report_title),
          content: Text(t.app.dialog.cancel_report_message),
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
                t.app.dialog.cancel_report,
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
    final draft = {
      'opdId': widget.opdId,
      'opdName': widget.opdName,
      'title': _titleController.text,
      'category': _selectedCategoryName,
      'categoryId': _selectedCategoryId,
      'assetType': _selectedAssetType,
      'assetForm': _selectedAssetForm,
      'assetData': _selectedAssetData,
      'location': _locationController.text,
      'problem': _problemController.text,
      'expectedSolution': _expectedSolutionController.text,
      'attachedFilesCount': _attachedFiles.length,
      'timestamp': DateTime.now().toIso8601String(),
    };

    debugPrint('Saving draft: $draft');

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

    if (!_validateForm(context)) {
      return;
    }

    final files = _attachFileKey.currentState?.getAttachedFiles() ?? [];
    final file = files.isNotEmpty ? files.first : null;

    final reportCubit = context.read<ReportCubit>();

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

          // Submit with existing API call (not changed)
          reportCubit.createPublicReport(
            opdId: widget.opdId,
            categoryId: _selectedCategoryId!,
            description: _problemController.text.trim(),
            action: "submit",
            file: file,
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  bool _validateForm(BuildContext context) {
    final t = context.t;
    final errors = <String>[];

    // 1️⃣ Judul Pelaporan
    if (_titleController.text.trim().isEmpty) {
      errors.add(t.app.validation.title_required);
    }

    // 2️⃣ Kategori Pelaporan
    if (_selectedCategoryId == null || _selectedCategoryId!.isEmpty) {
      errors.add(t.app.validation.category_required);
    }

    // 3️⃣ Jenis Aset
    if (_selectedAssetType == null || _selectedAssetType!.isEmpty) {
      errors.add(t.app.validation.asset_type_required);
    }

    // 4️⃣ Bentuk Aset
    if (_selectedAssetForm == null || _selectedAssetForm!.isEmpty) {
      errors.add(t.app.validation.asset_form_required);
    }

    // 5️⃣ Data Aset
    if (_selectedAssetData == null || _selectedAssetData!.isEmpty) {
      errors.add(t.app.validation.asset_data_required);
    }

    // 6️⃣ Lokasi Kejadian
    if (_locationController.text.trim().isEmpty) {
      errors.add(t.app.validation.location_required);
    }

    // 7️⃣ Rincian Masalah (Deskripsi)
    if (_problemController.text.trim().isEmpty) {
      errors.add(t.app.validation.description_required);
    } else if (_problemController.text.trim().length < 20) {
      errors.add(t.app.validation.description_min_length);
    }

    // 8️⃣ Penyelesaian yang Diharapkan
    if (_expectedSolutionController.text.trim().isEmpty) {
      errors.add(t.app.validation.expected_solution_required);
    }

    // ⚠️ Tampilkan pesan error jika ada
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
                        Icon(
                          Icons.error_outline,
                          size: 16.sp,
                          color: Colors.red,
                        ),
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

  void _showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.all(20.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 16.h),
                Text(
                  t.app.sending_report,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
