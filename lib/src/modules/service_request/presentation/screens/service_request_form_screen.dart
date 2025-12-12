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
import 'package:report/src/modules/profile/domain/models/profile_model.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/reporting_text_field.dart';

import 'package:report/src/modules/service_request/domain/models/asset_sub_category_model.dart';
import 'package:report/src/modules/service_request/presentation/cubits/service_request_cubit.dart';
import 'package:report/src/modules/service_request/presentation/cubits/service_request_state.dart';

@RoutePage()
class ServiceRequestFormScreen extends StatefulWidget {
  final String? opdId;
  final String? opdName;
  final String? opdIconUrl;
  final Color? opdColor;

  const ServiceRequestFormScreen({
    super.key,
    this.opdId,
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
  final _serialNumberController = TextEditingController();

  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();
  
  AssetSubCategoryModel? _selectedSubCategory;
  
  List<File> _attachedFiles = [];
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  String? _userOpdId; 

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _serviceDescriptionController.dispose();
    _serviceLocationController.dispose();
    _expectedSolutionController.dispose();
    _assetCategoryController.dispose();
    _assetSubcategoryController.dispose();
    _assetTypeController.dispose();
    _serialNumberController.dispose();
    super.dispose();
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
      'assetName',
      _selectedSubCategory == null,
      "Nama aset wajib dipilih", 
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

  void _handleSubmit(BuildContext context) {
    final t = context.t.app;
    final cubit = context.read<ServiceRequestCubit>();
    
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
          
          if (_selectedSubCategory != null) {
             cubit.submitRequest(
                subCategoryId: _selectedSubCategory!.id,
                title: _titleController.text.trim(),
                description: _serviceDescriptionController.text.trim(),
                location: _serviceLocationController.text.trim(),
                expectedResolution: _expectedSolutionController.text.trim(),
                files: _attachedFiles,
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
        _serviceDescriptionController.text.isNotEmpty ||
        _selectedSubCategory != null ||
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
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
        BlocProvider(create: (_) => sl<ServiceRequestCubit>()..fetchSubCategories()), 
      ],
      child: BlocListener<ServiceRequestCubit, ServiceRequestState>(
        listener: (context, state) {
          if (state.submissionStatus == SubmissionStatus.submitting) {
            _showLoadingDialog(context);
          } else if (state.submissionStatus == SubmissionStatus.success) {
            Navigator.of(context, rootNavigator: true).pop(); // Tutup Loading
            
            final result = state.submitResult!;
            
            // ✅ Pass data dari response API
            context.router.push(
              ServiceRequestSuccessRoute(data: result),
            );
            
          } else if (state.submissionStatus == SubmissionStatus.error) {
            Navigator.of(context, rootNavigator: true).pop(); // Tutup Loading
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Gagal mengajukan layanan: ${state.submissionError}'),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Builder(
          builder: (context) {
            return Scaffold(
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
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              ProfileModel? profile;
                              if (state is ProfileLoaded) {
                                profile = state.profile;
                              }

                              final displayOpdName = profile?.dinasName ?? 
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
                            label: t.request_title_label,
                            hint: t.request_title_hint,
                            controller: _titleController,
                            errorText: _errors['title'],
                            onChanged: (_) => _clearError('title'),
                          ),
                          SizedBox(height: 24.h),

                          BlocBuilder<ServiceRequestCubit, ServiceRequestState>(
                            builder: (context, state) {
                              final List<String> assetNames = state.subCategories
                                  .map((e) => e.nama)
                                  .toList();
                              
                              String? currentSelectionName = _selectedSubCategory?.nama;

                              if (state.status == ServiceRequestStatus.loading) {
                                return Center(
                                  child: Column(
                                    children: [
                                      const CircularProgressIndicator.adaptive(),
                                      SizedBox(height: 8.h),
                                      Text('Memuat opsi aset...', style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade600))
                                    ],
                                  ),
                                );
                              }
                              
                              if (state.status == ServiceRequestStatus.failure) {
                                return Center(child: Text('Gagal memuat data aset. ${state.errorMessage}', style: TextStyle(color: Colors.red, fontSize: 12.sp)));
                              }

                              return AppDropdownField(
                                label: "Nama Aset",
                                value: currentSelectionName,
                                items: assetNames,
                                errorText: _errors['assetName'],
                                onChanged: (val) {
                                  setState(() {
                                    _selectedSubCategory = state.subCategories
                                        .firstWhere((e) => e.nama == val);
                                        
                                    if (_hasAttemptedSubmit) {
                                      _errors['assetName'] = null;
                                    }
                                  });
                                },
                              );
                            },
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
            );
          },
        ),
      ),
    );
  }
}