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
import 'package:report/src/modules/reporting/domain/constants/dummy_asset_data.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/asset_info_section.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/reporting_text_field.dart';
import 'package:report/src/modules/masyarakat_reporting/presentation/widgets/profile_section.dart';

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
  final _serviceDescriptionController = TextEditingController();
  final _serviceLocationController = TextEditingController();
  final _expectedSolutionController = TextEditingController();
  final _assetCategoryController = TextEditingController();
  final _assetSubcategoryController = TextEditingController();
  final _assetTypeController = TextEditingController();

  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();
  String? _selectedDataAsset;
  String? _selectedSerialNumber;
  List<File> _attachedFiles = [];
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  @override
  void dispose() {
    _titleController.dispose();
    _serviceDescriptionController.dispose();
    _serviceLocationController.dispose();
    _expectedSolutionController.dispose();
    _assetCategoryController.dispose();
    _assetSubcategoryController.dispose();
    _assetTypeController.dispose();
    super.dispose();
  }

  void _onDataAssetChanged(String? value) {
    setState(() {
      _selectedDataAsset = value;
      _selectedSerialNumber = null;

      if (_hasAttemptedSubmit) {
        _errors['dataAsset'] = null;
        _errors['serialNumber'] = null;
      }
      if (value != null && DummyAssetData.assetDetails.containsKey(value)) {
        final details = DummyAssetData.assetDetails[value]!;
        _assetCategoryController.text = details['category'] ?? '';
        _assetSubcategoryController.text = details['subcategory'] ?? '';
        _assetTypeController.text = details['type'] ?? '';

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
      if (isInvalid) newErrors[key] = errorMessage;
    }

    validate(
      'title',
      _titleController.text.trim().isEmpty,
      t.validation.request_title_required,
    );
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
      _assetCategoryController.text.isEmpty,
      t.validation.asset_category_required,
    );
    validate(
      'assetSubcategory',
      _assetSubcategoryController.text.isEmpty,
      t.validation.asset_subcategory_required,
    );
    validate(
      'assetType',
      _assetTypeController.text.isEmpty,
      t.validation.asset_type_required,
    );

    validate(
      'serviceLocation',
      _serviceLocationController.text.trim().isEmpty,
      t.validation.service_location_required,
    );

    final desc = _serviceDescriptionController.text.trim();
    validate(
      'serviceDescription',
      desc.isEmpty,
      t.validation.service_description_required,
    );
    if (desc.isNotEmpty) {
      validate(
        'serviceDescription',
        desc.length < 20,
        t.validation.description_min_length,
      );
    }

    validate(
      'expectedSolution',
      _expectedSolutionController.text.trim().isEmpty,
      t.validation.expected_solution_required,
    );

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
          AppLogger.i('Submitting Service Request...');

          // Show success dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (successContext) => AppReportSuccessDialog(
              title: t.dialog.report_success_title,
              buttonText: t.dialog.report_success_button,
              onPressed: () {
                Navigator.of(successContext).pop();
                context.router.push(
                  ServiceRequestSuccessRoute(
                    ticketNumber:
                        "REQ-${DateTime.now().millisecondsSinceEpoch}",
                    status: "Menunggu Konfirmasi",
                    requestType: _selectedDataAsset ?? "Service Request",
                  ),
                );
              },
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
        _serviceDescriptionController.text.isNotEmpty ||
        _selectedDataAsset != null ||
        _selectedSerialNumber != null ||
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

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
      ],
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: t.service_request_title),
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
                      label: t.request_title_label,
                      hint: t.request_title_hint,
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
                      label: t.service_location_label,
                      hint: t.service_location_hint,
                      controller: _serviceLocationController,
                      errorText: _errors['serviceLocation'],
                      onChanged: (_) => _clearError('serviceLocation'),
                    ),
                    SizedBox(height: 24.h),
                    AppFormProblemDescription(
                      controller: _serviceDescriptionController,
                      title: t.service_description_label,
                      hint: t.service_description_hint,
                      errorText: _errors['serviceDescription'],
                      onChanged: (_) => _clearError('serviceDescription'),
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
              onSaveDraft: () => ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(t.draft_saved))),
              onSubmit: () => _handleSubmit(context),
            ),
          ],
        ),
      ),
    );
  }
}
