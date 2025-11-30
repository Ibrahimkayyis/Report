import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
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
  final TextEditingController _descriptionController = TextEditingController();

  String? _descriptionError;
  List<File> _attachedFiles = [];

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    final t = context.t.app.masyarakat;
    final description = _descriptionController.text.trim();

    if (description.isEmpty) {
      _setErrorAndShowSnack(t.validation_description_required);
      return;
    }

    if (description.length < 20) {
      _setErrorAndShowSnack(t.validation_description_min_length);
      return;
    }

    setState(() => _descriptionError = null);
    _showConfirmationDialog();

    // TODO: Call API Submission logic here
  }

  void _showConfirmationDialog() {
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

          // TODO: Call API Submission logic here
          // Simulate success for now
          _showSuccessDialog();
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _showSuccessDialog() {
    final t = context.t.app;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AppReportSuccessDialog(
        title: t.dialog.report_success_title,
        buttonText: t.dialog.report_success_button,
        onPressed: () {
          Navigator.of(dialogContext).pop();
          context.router.maybePop();

          // Show success snackbar
          _showSnackBar(
            t.masyarakat.submit_success_placeholder,
            isError: false,
          );
        },
      ),
    );
  }

  void _setErrorAndShowSnack(String errorMsg) {
    final t = context.t.app.masyarakat;
    setState(() => _descriptionError = errorMsg);
    _showSnackBar(t.validation_error_message, isError: true);
  }

  void _handleCancel() {
    final hasData =
        _descriptionController.text.isNotEmpty || _attachedFiles.isNotEmpty;
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

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.online_reporting_title, centerTitle: true),
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

                  AppFormProblemDescription(
                    controller: _descriptionController,
                    title: t.masyarakat.what_to_report,
                    hint: t.masyarakat.report_hint,
                    errorText: _descriptionError,
                    onChanged: (_) {
                      if (_descriptionError != null)
                        setState(() => _descriptionError = null);
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
            onSubmit: _validateAndSubmit,
          ),
        ],
      ),
    );
  }
}
