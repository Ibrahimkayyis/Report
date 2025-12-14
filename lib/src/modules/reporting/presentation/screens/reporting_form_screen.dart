import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';
import 'package:report/src/modules/reporting/presentation/cubits/asset/asset_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/report_state.dart';
import '../widgets/form_sections/asset_info_section.dart';
import '../widgets/form_sections/reporting_text_field.dart';

@RoutePage()
class ReportingFormScreen extends StatefulWidget {
  final String? opdId;
  final String? opdName;
  final String? opdIconUrl;
  final Color? opdColor;
  
  // ✅ 1. Tambahkan parameter optional ini
  final AssetModel? prefilledAsset;

  const ReportingFormScreen({
    super.key,
    this.opdId,
    this.opdName,
    this.opdIconUrl,
    this.opdColor,
    this.prefilledAsset, // ✅ Masukkan ke constructor
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

  // Asset Controllers (Read Only)
  final _serialNumberController = TextEditingController();
  final _assetCategoryController = TextEditingController();
  final _assetSubcategoryController = TextEditingController();
  final _assetTypeController = TextEditingController();

  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();

  // State Variables
  AssetModel? _selectedDataAsset;
  List<File> _attachedFiles = [];
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  // User OPD ID
  String? _userOpdId;

  // ✅ 2. Tambahkan initState untuk cek prefilledAsset
  @override
  void initState() {
    super.initState();
    // Jika ada data aset dari QR/Screen lain, langsung isi form
    if (widget.prefilledAsset != null) {
      _onDataAssetChanged(widget.prefilledAsset);
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _problemController.dispose();
    _locationController.dispose();
    _expectedSolutionController.dispose();
    _serialNumberController.dispose();
    _assetCategoryController.dispose();
    _assetSubcategoryController.dispose();
    _assetTypeController.dispose();
    super.dispose();
  }

  // --- Logic Methods ---

  void _onDataAssetChanged(AssetModel? asset) {
    setState(() {
      _selectedDataAsset = asset;

      if (_hasAttemptedSubmit) {
        _errors['dataAsset'] = null;
      }

      if (asset != null) {
        _serialNumberController.text = asset.nomorSeri ?? '-';
        _assetCategoryController.text = asset.kategori;
        _assetSubcategoryController.text =
            asset.assetBarang?.subKategori?.nama ?? '-';
        _assetTypeController.text = asset.jenis;

        if (asset.assetBarang?.lokasi?.nama != null) {
          _locationController.text = asset.assetBarang!.lokasi!.nama;
        }

        if (_hasAttemptedSubmit) {
          _errors['serialNumber'] = null;
          _errors['assetCategory'] = null;
          _errors['assetSubcategory'] = null;
          _errors['assetType'] = null;
        }
      } else {
        _serialNumberController.clear();
        _assetCategoryController.clear();
        _assetSubcategoryController.clear();
        _assetTypeController.clear();
        _locationController.clear();
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

    final title = _titleController.text.trim();
    final problem = _problemController.text.trim();

    validate('title', title.isEmpty, t.validation.title_required);

    validate(
      'dataAsset',
      _selectedDataAsset == null,
      t.validation.data_asset_required,
    );

    validate(
      'location',
      _locationController.text.trim().isEmpty,
      t.validation.location_required,
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

          if (_selectedDataAsset?.id != null) {
            context.read<ReportCubit>().submitReport(
              assetId: _selectedDataAsset!.id,
              title: _titleController.text.trim(),
              description: _problemController.text.trim(),
              location: _locationController.text.trim(),
              expectedResolution: _expectedSolutionController.text.trim(),
              files: _attachedFiles,
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("ID Aset tidak valid")),
            );
          }
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
        _locationController.text.isNotEmpty ||
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
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t.draft_saved), backgroundColor: Colors.blue),
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

  // --- Widget Builders ---

  Widget _buildProfileSection(ProfileModel? profile) {
    final name = profile?.fullName ?? '-';
    final email = profile?.email ?? '-';
    final divisi = profile?.unitKerja ?? profile?.dinasName ?? '-';

    if (profile?.dinasId != null && _userOpdId != profile!.dinasId) {
      _userOpdId = profile.dinasId;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Nama", name),
        SizedBox(height: 16.h),
        _buildInfoRow("Email", email),
        SizedBox(height: 16.h),
        _buildInfoRow("Divisi", divisi),
      ],
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Container(
            height: 40.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              value,
              style: TextStyle(fontSize: 13.sp, color: Colors.black87),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ReportCubit>()),
        // Tetap fetch assets agar dropdown bisa bekerja jika user ingin mengganti aset
        BlocProvider(create: (_) => sl<AssetCubit>()..fetchAssets()),
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
      ],
      child: BlocListener<ReportCubit, ReportState>(
        listener: (context, state) {
          if (state is ReportLoading) {
            _showLoadingDialog(context);
          } else if (state is ReportSuccess) {
            Navigator.of(context, rootNavigator: true).pop();

            context.router.push(
              ReportSuccessRoute(data: state.data),
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
        child: Builder(
          builder: (context) {
            return Scaffold(
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
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              ProfileModel? profile;
                              if (state is ProfileLoaded) {
                                profile = state.profile;
                              }

                              final displayOpdName =
                                  profile?.dinasName ??
                                  widget.opdName ??
                                  "Dinas Komunikasi dan Informatika";

                              return Column(
                                children: [
                                  AppFormTargetDisplay(
                                    name: displayOpdName,
                                    imageUrl: widget.opdIconUrl,
                                    color: widget.opdColor ?? ColorName.primary,
                                  ),
                                  SizedBox(height: 24.h),

                                  _buildProfileSection(profile),
                                ],
                              );
                            },
                          ),

                          SizedBox(height: 24.h),

                          ReportingTextField(
                            label: t.report_title_label,
                            hint: t.report_title_hint,
                            controller: _titleController,
                            errorText: _errors['title'],
                            onChanged: (_) => _clearError('title'),
                          ),
                          SizedBox(height: 24.h),

                          AssetInfoSection(
                            selectedDataAsset: _selectedDataAsset,
                            serialNumberController: _serialNumberController,
                            assetCategoryController: _assetCategoryController,
                            assetSubcategoryController:
                                _assetSubcategoryController,
                            assetTypeController: _assetTypeController,
                            onDataAssetChanged: _onDataAssetChanged,
                            errors: _errors,
                          ),

                          SizedBox(height: 24.h),

                          ReportingTextField(
                            label: t.location_label,
                            hint: t.location_hint,
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
            );
          },
        ),
      ),
    );
  }
}