import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart'; // ✅ Import Model Response
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/report/masyarakat_report_cubit.dart';
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/report/masyarakat_report_state.dart';
import '../widgets/profile_section.dart';

@RoutePage()
class MasyarakatReportingFormScreen extends StatefulWidget {
  final String opdId;
  final String? opdName;
  final Color? opdColor;
  final String? opdIconUrl;

  const MasyarakatReportingFormScreen({
    super.key,
    required this.opdId,
    this.opdName,
    this.opdColor,
    this.opdIconUrl,
  });

  @override
  State<MasyarakatReportingFormScreen> createState() =>
      _MasyarakatReportingFormScreenState();
}

class _MasyarakatReportingFormScreenState
    extends State<MasyarakatReportingFormScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _titleError;
  String? _descriptionError;
  List<File> _attachedFiles = [];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _validateAndSubmit(BuildContext context) {
    final t = context.t.app.masyarakat;
    
    // Reset Error
    setState(() {
      _titleError = null;
      _descriptionError = null;
    });

    bool isValid = true;
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();

    // 1. Validasi Judul
    if (title.isEmpty) {
      setState(() => _titleError = t.validation_title_required);
      isValid = false;
    }

    // 2. Validasi Deskripsi
    if (description.isEmpty) {
      setState(() => _descriptionError = t.validation_description_required);
      isValid = false;
    } else if (description.length < 20) {
      setState(() => _descriptionError = t.validation_description_min_length);
      isValid = false;
    }

    if (!isValid) {
      _showSnackBar(t.validation_error_message, isError: true);
      return;
    }

    // Tampilkan Dialog Konfirmasi
    _showConfirmationDialog(context);
  }

  void _showConfirmationDialog(BuildContext parentContext) {
    final t = context.t.app;

    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.dialog.confirm_submit_title,
        message: t.dialog.confirm_submit_message,
        confirmText: t.dialog.confirm_yes,
        cancelText: t.dialog.cancel,
        icon: Icons.warning_amber_rounded,
        onConfirm: () {
          Navigator.of(dialogContext).pop();

          final opdIdInt = int.tryParse(widget.opdId) ?? 0;
          
          parentContext.read<MasyarakatReportCubit>().submitReport(
            title: _titleController.text.trim(),
            idOpd: opdIdInt,
            description: _descriptionController.text.trim(),
            files: _attachedFiles,
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  // ✅ UPDATE: Menerima Response Model Lengkap
  void _showSuccessDialog(MasyarakatReportResponseModel response) {
    final t = context.t.app;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AppGlobalSuccessDialog(
        title: t.dialog.report_success_title,
        buttonText: t.dialog.report_success_button,
        onPressed: () {
          Navigator.of(dialogContext).pop();
          
          // ✅ NAVIGASI: Menggunakan data dari API Response
          context.router.push(
            ReportSuccessRoute(data: response), 
          );
        },
      ),
    );
  }

  void _handleCancel() {
    final hasData = _titleController.text.isNotEmpty ||
        _descriptionController.text.isNotEmpty ||
        _attachedFiles.isNotEmpty;
        
    if (!hasData) {
      context.router.maybePop();
      return;
    }
    _showCancelDialog();
  }

  void _showSnackBar(String message, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.red : Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showCancelDialog() {
    final t = context.t.app;
    showDialog(
      context: context,
      builder: (dialogContext) => AppWarningDialog(
        title: t.dialog.back_confirmation_title,
        message: t.dialog.back_confirmation_message,
        confirmText: t.dialog.back_confirmation_confirm,
        cancelText: t.dialog.back_confirmation_cancel,
        onConfirm: () {
          Navigator.of(dialogContext).pop();
          context.router.maybePop();
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _showLoadingDialog() {
    final t = context.t.app;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SizedBox(height: 16.h),
                Text(t.sending_report),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return BlocProvider(
      create: (_) => sl<MasyarakatReportCubit>(),
      child: BlocListener<MasyarakatReportCubit, MasyarakatReportState>(
        listener: (context, state) {
          if (state is MasyarakatReportLoading) {
            _showLoadingDialog();
          } else if (state is MasyarakatReportSuccess) {
            Navigator.of(context, rootNavigator: true).pop(); // Tutup Loading
            // ✅ Pass Response Model ke Success Dialog
            _showSuccessDialog(state.response);
          } else if (state is MasyarakatReportError) {
            Navigator.of(context, rootNavigator: true).pop(); // Tutup Loading
            _showSnackBar("Gagal mengirim: ${state.message}", isError: true);
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: ColorName.background,
              appBar: AppPrimaryBar(
                title: t.online_reporting_title, 
                centerTitle: true,
              ),
              body: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppFormTargetDisplay(
                            name: widget.opdName ?? 'OPD - ${widget.opdId}',
                            imageUrl: widget.opdIconUrl,
                            color: widget.opdColor ?? ColorName.primary,
                          ),
                          SizedBox(height: 24.h),

                          const ProfileSection(),
                          SizedBox(height: 24.h),

                          Text(
                            t.report_title_label,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: ColorName.textPrimary,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextField(
                            controller: _titleController,
                            style: TextStyle(fontSize: 14.sp),
                            decoration: InputDecoration(
                              hintText: t.report_title_hint,
                              filled: true,
                              fillColor: Colors.white,
                              errorText: _titleError,
                              contentPadding: EdgeInsets.all(14.w),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: Colors.grey.shade400),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                borderSide: BorderSide(color: Colors.grey.shade400),
                              ),
                            ),
                            onChanged: (_) {
                              if (_titleError != null) {
                                setState(() => _titleError = null);
                              }
                            },
                          ),
                          SizedBox(height: 24.h),

                          AppFormProblemDescription(
                            controller: _descriptionController,
                            title: t.masyarakat.what_to_report,
                            hint: t.masyarakat.report_hint,
                            errorText: _descriptionError,
                            onChanged: (_) {
                              if (_descriptionError != null) {
                                setState(() => _descriptionError = null);
                              }
                            },
                          ),
                          SizedBox(height: 24.h),

                          AppFormAttachFile(
                            title: t.masyarakat.attach_file_label,
                            onFilesChanged: (files) =>
                                setState(() => _attachedFiles = files),
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),

                  AppFormBottomActions(
                    onCancel: _handleCancel,
                    onSaveDraft: () =>
                        _showSnackBar(t.masyarakat.draft_saved_placeholder),
                    onSubmit: () => _validateAndSubmit(context),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}