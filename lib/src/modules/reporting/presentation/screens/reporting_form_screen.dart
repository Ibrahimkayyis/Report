import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_state.dart';
import '../../domain/constants/dummy_asset_data.dart';
import '../widgets/form_sections/asset_info_section.dart';
import '../widgets/form_sections/reporting_text_field.dart';
import 'package:report/src/modules/masyarakat_reporting/presentation/widgets/profile_section.dart';

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
  // Controllers
  final _titleController = TextEditingController();
  final _problemController = TextEditingController();
  final _locationController = TextEditingController();
  final _expectedSolutionController = TextEditingController();
  final _assetCategoryController = TextEditingController();
  final _assetSubcategoryController = TextEditingController();
  final _assetTypeController = TextEditingController();

  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();

  // State Variables
  String? _selectedDataAsset;
  String? _selectedSerialNumber;
  List<File> _attachedFiles = [];
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  @override
  void dispose() {
    _titleController.dispose();
    _problemController.dispose();
    _locationController.dispose();
    _expectedSolutionController.dispose();
    _assetCategoryController.dispose();
    _assetSubcategoryController.dispose();
    _assetTypeController.dispose();
    super.dispose();
  }

  // --- Logic Methods ---

  void _onDataAssetChanged(String? value) {
    setState(() {
      _selectedDataAsset = value;
      _selectedSerialNumber = null; // Reset serial number saat aset berubah

      // Clear error jika user memilih ulang
      if (_hasAttemptedSubmit) {
        _errors['dataAsset'] = null;
        _errors['serialNumber'] = null;
      }

      // Logic Auto-fill dari Dummy Data
      if (value != null && DummyAssetData.assetDetails.containsKey(value)) {
        final details = DummyAssetData.assetDetails[value]!;
        _assetCategoryController.text = details['category'] ?? '';
        _assetSubcategoryController.text = details['subcategory'] ?? '';
        _assetTypeController.text = details['type'] ?? '';

        // Clear related errors
        if (_hasAttemptedSubmit) {
          _errors['assetCategory'] = null;
          _errors['assetSubcategory'] = null;
          _errors['assetType'] = null;
        }
      } else {
        _assetCategoryController.clear();
        _assetSubcategoryController.clear();
        _assetTypeController.clear();
      }
    });
  }

  void _clearError(String key) {
    if (_hasAttemptedSubmit && _errors[key] != null) {
      setState(() => _errors[key] = null);
    }
  }

  bool _validateForm(BuildContext context) {
    final t = context.t.app;

    final newErrors = <String, String?>{};

    void validate(String key, bool isInvalid, String errorMessage) {
      if (isInvalid) {
        newErrors[key] = errorMessage;
      }
    }

    final title = _titleController.text.trim();
    final problem = _problemController.text.trim();

    validate('title', title.isEmpty, t.validation.title_required);
    validate(
      'dataAsset',
      _selectedDataAsset?.isEmpty ?? true,
      t.validation.data_asset_required,
    );
    validate(
      'serialNumber',
      _selectedSerialNumber?.isEmpty ?? true,
      t.validation.serial_number_required,
    );

    validate(
      'assetCategory',
      _assetCategoryController.text.trim().isEmpty,
      t.validation.asset_category_required,
    );
    validate(
      'assetSubcategory',
      _assetSubcategoryController.text.trim().isEmpty,
      t.validation.asset_subcategory_required,
    );
    validate(
      'assetType',
      _assetTypeController.text.trim().isEmpty,
      t.validation.asset_type_required,
    );
    validate(
      'location',
      _locationController.text.trim().isEmpty,
      t.validation.location_required,
    );
    validate(
      'expectedSolution',
      _expectedSolutionController.text.trim().isEmpty,
      t.validation.expected_solution_required,
    );

    validate('problem', problem.isEmpty, t.validation.description_required);
    if (problem.isNotEmpty) {
      validate(
        'problem',
        problem.length < 20,
        t.validation.description_min_length,
      );
    }

    setState(() {
      _hasAttemptedSubmit = true;
      _errors.clear();
      _errors.addAll(newErrors);
    });

    return _errors.isEmpty;
  }

  void _handleSubmit(BuildContext context) {
    final t = context.t.app;
    if (!_validateForm(context)) return;

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
          AppLogger.i('Submitting Report...');

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Submit logic implemented via Cubit later'),
              backgroundColor: Colors.orange,
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _handleCancel(BuildContext context) {
    final t = context.t.app;
    final hasData =
        _titleController.text.isNotEmpty ||
        _problemController.text.isNotEmpty ||
        _selectedDataAsset != null ||
        _selectedSerialNumber != null ||
        _locationController.text.isNotEmpty ||
        _expectedSolutionController.text.isNotEmpty ||
        _attachedFiles.isNotEmpty;
    if (hasData) {
      showDialog(
        context: context,
        builder: (dialogContext) => AppWarningDialog(
          title: t.dialog.back_confirmation_title,
          message: t.dialog.back_confirmation_message,
          confirmText: t.dialog.back_confirmation_confirm,
          cancelText: t.dialog.back_confirmation_cancel,
          onConfirm: () {
            Navigator.of(dialogContext).pop();
            context.router.pop();
          },
          onCancel: () => Navigator.of(dialogContext).pop(),
        ),
      );
    } else {
      context.router.pop();
    }
  }

  void _handleSaveDraft(BuildContext context) {
    final t = context.t.app;
    AppLogger.i('Save draft');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(t.draft_saved),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showLoadingDialog(BuildContext context) {
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

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
        BlocProvider(create: (_) => sl<ReportCubit>()),
      ],
      child: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state is ReportLoading) {
            _showLoadingDialog(context);
          } else if (state is ReportSuccess) {
            Navigator.of(context, rootNavigator: true).pop();

            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (dialogContext) => AppReportSuccessDialog(
                title: t.dialog.report_success_title,
                buttonText: t.dialog.report_success_button,
                onPressed: () {
                  Navigator.of(dialogContext).pop();
                  context.router.push(
                    ReportSuccessRoute(
                      ticketNumber: state.report.ticketId,
                      status: state.report.status,
                      opdName: widget.opdName ?? 'OPD - ${widget.opdId}',
                    ),
                  );
                },
              ),
            );
          } else if (state is ReportError) {
            Navigator.of(context, rootNavigator: true).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Gagal mengirim: ${state.message}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
          appBar: AppPrimaryBar(title: t.online_reporting_title),
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

                      ReportingTextField(
                        label: t.report_title_label, // ✅ t.app
                        hint: t.report_title_hint, // ✅ t.app
                        controller: _titleController,
                        errorText: _errors['title'],
                        onChanged: (_) => _clearError('title'),
                      ),
                      SizedBox(height: 24.h),

                      AssetInfoSection(
                        selectedDataAsset: _selectedDataAsset,
                        selectedSerialNumber: _selectedSerialNumber,
                        dataAssetOptions: DummyAssetData.dataAssetOptions,
                        serialNumberOptions: _selectedDataAsset != null
                            ? (DummyAssetData
                                      .serialNumberOptions[_selectedDataAsset!] ??
                                  [])
                            : [],
                        assetCategoryController: _assetCategoryController,
                        assetSubcategoryController: _assetSubcategoryController,
                        assetTypeController: _assetTypeController,
                        onDataAssetChanged: _onDataAssetChanged,
                        onSerialNumberChanged: (val) {
                          setState(() => _selectedSerialNumber = val);
                          _clearError('serialNumber');
                        },
                        errors: _errors,
                      ),
                      SizedBox(height: 24.h),

                      ReportingTextField(
                        label: t.location_label, // ✅ t.app
                        hint: t.location_hint, // ✅ t.app
                        controller: _locationController,
                        errorText: _errors['location'],
                        onChanged: (_) => _clearError('location'),
                      ),
                      SizedBox(height: 24.h),

                      AppFormProblemDescription(
                        controller: _problemController,
                        errorText: _errors['problem'],
                        onChanged: (_) => _clearError('problem'),
                      ),
                      SizedBox(height: 24.h),

                      AppFormAttachFile(
                        key: _attachFileKey,
                        title: t.attach_file_label,
                        onFilesChanged: (files) =>
                            setState(() => _attachedFiles = files),
                      ),
                      SizedBox(height: 24.h),

                      ReportingTextField(
                        label: t.expected_solution_label,
                        hint: t.expected_solution_hint,
                        controller: _expectedSolutionController,
                        errorText: _errors['expectedSolution'],
                        maxLines: 5,
                        onChanged: (_) => _clearError('expectedSolution'),
                      ),
                      SizedBox(height: 24.h),
                    ],
                  ),
                ),
              ),
              AppFormBottomActions(
                onCancel: () => _handleCancel(context),
                onSaveDraft: () => _handleSaveDraft(context),
                onSubmit: () => _handleSubmit(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
