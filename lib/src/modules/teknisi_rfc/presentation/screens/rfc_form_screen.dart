import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/reporting/domain/constants/dummy_asset_data.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/reporting_text_field.dart';
import '../widgets/opd_dropdown_section.dart';

@RoutePage()
class RFCFormScreen extends StatefulWidget {
  const RFCFormScreen({super.key});

  @override
  State<RFCFormScreen> createState() => _RFCFormScreenState();
}

class _RFCFormScreenState extends State<RFCFormScreen> {
  // --- Controllers ---
  final _judulController = TextEditingController();
  final _namaPemohonController = TextEditingController();
  final _nomorHpController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _alasanPerubahanController = TextEditingController();
  final _dampakPerubahanController = TextEditingController();
  final _dampakJikaTidakController = TextEditingController();

  // Asset Controllers (ReadOnly)
  final _assetCategoryController = TextEditingController();
  final _assetSubcategoryController = TextEditingController();
  final _assetTypeController = TextEditingController();

  // --- State Variables ---
  String? _selectedOpdId;
  String? _selectedDataAsset;
  String? _selectedSerialNumber;
  String? _selectedEstimasiWaktu;
  String? _selectedEstimasiBiaya;

  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  // --- Local Data Options ---
  final List<String> _estimasiWaktuOptions = [
    '1-3 Hari',
    '4-7 Hari',
    'Lebih dari 7 hari',
  ];

  final List<String> _estimasiBiayaOptions = [
    'Kurang dari Rp. 500.000,00',
    'Rp 500.000 – Rp 1.000.000',
    'Rp 1.000.000 – Rp 5.000.000',
    'Rp 5.000.000 – Rp 10.000.000',
    'Lebih dari Rp 10.000.000',
  ];

  @override
  void dispose() {
    _judulController.dispose();
    _namaPemohonController.dispose();
    _nomorHpController.dispose();
    _deskripsiController.dispose();
    _alasanPerubahanController.dispose();
    _dampakPerubahanController.dispose();
    _dampakJikaTidakController.dispose();
    _assetCategoryController.dispose();
    _assetSubcategoryController.dispose();
    _assetTypeController.dispose();
    super.dispose();
  }

  // --- Logic Methods ---

  void _onDataAssetChanged(String? value) {
    setState(() {
      _selectedDataAsset = value;
      _selectedSerialNumber = null;

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

  bool _validateForm() {
    final t = context.t.app.rfc;
    final newErrors = <String, String?>{};

    void validate(String key, bool isInvalid, String errorMessage) {
      if (isInvalid) newErrors[key] = errorMessage;
    }

    // 1. Identitas
    validate(
      'judul',
      _judulController.text.trim().isEmpty,
      t.validation_required,
    );
    validate(
      'namaPemohon',
      _namaPemohonController.text.trim().isEmpty,
      t.validation_required,
    );
    validate(
      'opdAsal',
      _selectedOpdId?.isEmpty ?? true,
      t.validation_opd_required,
    );

    final phone = _nomorHpController.text.trim();
    validate('nomorHp', phone.isEmpty, t.validation_required);
    if (phone.isNotEmpty) {
      validate('nomorHp', phone.length < 10, t.validation_phone_invalid);
    }

    // 2. Aset
    validate(
      'dataAsset',
      _selectedDataAsset?.isEmpty ?? true,
      t.validation_data_asset_required,
    );
    validate(
      'serialNumber',
      _selectedSerialNumber?.isEmpty ?? true,
      t.validation_serial_number_required,
    );
    validate(
      'assetCategory',
      _assetCategoryController.text.isEmpty,
      t.validation_category_required,
    );
    validate(
      'assetSubcategory',
      _assetSubcategoryController.text.isEmpty,
      t.validation_subcategory_required,
    );
    validate(
      'assetType',
      _assetTypeController.text.isEmpty,
      t.validation_asset_type_required,
    );

    // 3. Estimasi
    validate(
      'estimasiWaktu',
      _selectedEstimasiWaktu?.isEmpty ?? true,
      t.validation_time_estimate_required,
    );
    validate(
      'estimasiBiaya',
      _selectedEstimasiBiaya?.isEmpty ?? true,
      t.validation_cost_estimate_required,
    );

    // 4. Deskripsi
    final desc = _deskripsiController.text.trim();
    validate('deskripsi', desc.isEmpty, t.validation_required);
    if (desc.isNotEmpty) {
      validate(
        'deskripsi',
        desc.length < 20,
        t.validation_description_min_length,
      );
    }

    validate(
      'alasanPerubahan',
      _alasanPerubahanController.text.trim().isEmpty,
      t.validation_required,
    );
    validate(
      'dampakPerubahan',
      _dampakPerubahanController.text.trim().isEmpty,
      t.validation_required,
    );
    validate(
      'dampakJikaTidak',
      _dampakJikaTidakController.text.trim().isEmpty,
      t.validation_required,
    );

    setState(() {
      _hasAttemptedSubmit = true;
      _errors.clear();
      _errors.addAll(newErrors);
    });

    return _errors.isEmpty;
  }

  void _handleSubmit() {
    final t = context.t.app.rfc;
    if (!_validateForm()) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.dialog_submit_title,
        message: t.dialog_submit_message,
        confirmText: t.dialog_submit_confirm,
        cancelText: t.button_cancel,
        icon: Icons.warning_amber_rounded,
        onConfirm: () {
          Navigator.of(dialogContext).pop();
          AppLogger.i('Submitting RFC...');

          // Show success dialog
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (successContext) => AppReportSuccessDialog(
              title: t.dialog_report_success_title,
              buttonText: t.dialog_report_success_button,
              onPressed: () {
                Navigator.of(successContext).pop();
                context.router.maybePop();

                // Show success snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.message_submit_success),
                    backgroundColor: Colors.green,
                    behavior: SnackBarBehavior.floating,
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

  void _handleCancel() {
    final t = context.t.app;

    final hasData =
        _judulController.text.isNotEmpty ||
        _namaPemohonController.text.isNotEmpty ||
        _nomorHpController.text.isNotEmpty ||
        _deskripsiController.text.isNotEmpty ||
        _alasanPerubahanController.text.isNotEmpty ||
        _dampakPerubahanController.text.isNotEmpty ||
        _dampakJikaTidakController.text.isNotEmpty ||
        _selectedOpdId != null ||
        _selectedDataAsset != null ||
        _selectedSerialNumber != null ||
        _selectedEstimasiWaktu != null ||
        _selectedEstimasiBiaya != null;

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
            context.router.maybePop();
          },
          onCancel: () => Navigator.of(dialogContext).pop(),
        ),
      );
    } else {
      context.router.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.rfc;

    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<OpdCubit>()..fetchOpdList())],
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: t.rfc_form_title, centerTitle: true),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 1. Judul
                    ReportingTextField(
                      label: t.submission_title,
                      hint: t.submission_title_hint,
                      controller: _judulController,
                      errorText: _errors['judul'],
                      onChanged: (_) => _clearError('judul'),
                    ),
                    SizedBox(height: 20.h),

                    // 2. Nama Pemohon
                    ReportingTextField(
                      label: t.applicant_name,
                      hint: t.applicant_name_hint,
                      controller: _namaPemohonController,
                      errorText: _errors['namaPemohon'],
                      onChanged: (_) => _clearError('namaPemohon'),
                    ),
                    SizedBox(height: 20.h),

                    // 3. OPD Asal (Controlled by Screen)
                    BlocBuilder<OpdCubit, OpdState>(
                      builder: (context, state) {
                        final isLoading = state is OpdLoading;
                        final isError = state is OpdError;
                        final items = (state is OpdLoaded) ? state.opdList : [];

                        return OpdDropdownSection(
                          label: t.opd_origin_label,
                          hint: t.opd_origin_hint,
                          selectedOpdId: _selectedOpdId,
                          errorText: _errors['opdAsal'],
                          items: items,
                          isLoading: isLoading,
                          isError: isError,
                          onRetry: () =>
                              context.read<OpdCubit>().fetchOpdList(),
                          onChanged: (selectedOpd) {
                            if (selectedOpd != null) {
                              setState(
                                () => _selectedOpdId = selectedOpd.opdId,
                              );
                              _clearError('opdAsal');
                            }
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20.h),

                    // 4. Nomor HP
                    _buildPhoneField(t),
                    SizedBox(height: 20.h),

                    // 5. Data Asset (FULL WIDTH)
                    AppDropdownField(
                      label:
                          t.data_asset_hint, // Pastikan key translation benar
                      value: _selectedDataAsset,
                      items: DummyAssetData.dataAssetOptions,
                      onChanged: _onDataAssetChanged,
                      errorText: _errors['dataAsset'],
                    ),
                    SizedBox(height: 20.h),

                    // 6. Serial Number (FULL WIDTH)
                    AppDropdownField(
                      label: t
                          .serial_number_hint, // Pastikan key translation benar
                      value: _selectedSerialNumber,
                      items: _selectedDataAsset != null
                          ? (DummyAssetData
                                    .serialNumberOptions[_selectedDataAsset!] ??
                                [])
                          : [],
                      onChanged: (val) {
                        setState(() => _selectedSerialNumber = val);
                        _clearError('serialNumber');
                      },
                      errorText: _errors['serialNumber'],
                    ),
                    SizedBox(height: 20.h),

                    // 7. Asset Details (ReadOnly - Reuse ReportingTextField)
                    ReportingTextField(
                      label: t.asset_category,
                      hint: t.asset_category_hint,
                      controller: _assetCategoryController,
                      readOnly: true,
                      errorText: _errors['assetCategory'],
                    ),
                    SizedBox(height: 20.h),

                    ReportingTextField(
                      label: t.asset_subcategory_label,
                      hint: t.asset_subcategory_hint,
                      controller: _assetSubcategoryController,
                      readOnly: true,
                      errorText: _errors['assetSubcategory'],
                    ),
                    SizedBox(height: 20.h),

                    ReportingTextField(
                      label: t.asset_type_label,
                      hint: t.asset_type_hint,
                      controller: _assetTypeController,
                      readOnly: true,
                      errorText: _errors['assetType'],
                    ),
                    SizedBox(height: 20.h),

                    // 8. Estimasi Waktu
                    AppDropdownField(
                      label: t.time_estimate_hint,
                      value: _selectedEstimasiWaktu,
                      items: _estimasiWaktuOptions,
                      onChanged: (val) {
                        setState(() => _selectedEstimasiWaktu = val);
                        _clearError('estimasiWaktu');
                      },
                      errorText: _errors['estimasiWaktu'],
                    ),
                    SizedBox(height: 20.h),

                    // 9. Estimasi Biaya
                    AppDropdownField(
                      label: t.cost_estimate_hint,
                      value: _selectedEstimasiBiaya,
                      items: _estimasiBiayaOptions,
                      onChanged: (val) {
                        setState(() => _selectedEstimasiBiaya = val);
                        _clearError('estimasiBiaya');
                      },
                      errorText: _errors['estimasiBiaya'],
                    ),
                    SizedBox(height: 20.h),

                    // 10. Deskripsi & Text Areas
                    ReportingTextField(
                      label: t.description,
                      hint: t.description_hint,
                      controller: _deskripsiController,
                      errorText: _errors['deskripsi'],
                      maxLines: 5,
                      onChanged: (_) => _clearError('deskripsi'),
                    ),
                    SizedBox(height: 20.h),

                    ReportingTextField(
                      label: t.change_reason,
                      hint: t.change_reason_hint,
                      controller: _alasanPerubahanController,
                      errorText: _errors['alasanPerubahan'],
                      maxLines: 5,
                      onChanged: (_) => _clearError('alasanPerubahan'),
                    ),
                    SizedBox(height: 20.h),

                    ReportingTextField(
                      label: t.change_impact,
                      hint: t.change_impact_hint,
                      controller: _dampakPerubahanController,
                      errorText: _errors['dampakPerubahan'],
                      maxLines: 5,
                      onChanged: (_) => _clearError('dampakPerubahan'),
                    ),
                    SizedBox(height: 20.h),

                    ReportingTextField(
                      label: t.no_change_impact,
                      hint: t.no_change_impact_hint,
                      controller: _dampakJikaTidakController,
                      errorText: _errors['dampakJikaTidak'],
                      maxLines: 5,
                      onChanged: (_) => _clearError('dampakJikaTidak'),
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            _buildBottomActions(t),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneField(dynamic t) {
    final hasError = _errors['nomorHp'] != null;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.phone_number,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        TextField(
          controller: _nomorHpController,
          keyboardType: TextInputType.phone,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (_) => _clearError('nomorHp'),
          decoration: InputDecoration(
            hintText: t.phone_number_hint,
            hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
            filled: true,
            fillColor: ColorName.white,
            contentPadding: EdgeInsets.all(14.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.grey.shade400,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : Colors.grey.shade400,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: hasError ? Colors.red : ColorName.primary,
                width: 2,
              ),
            ),
          ),
        ),
        if (hasError) ...[
          SizedBox(height: 6.h),
          Text(
            _errors['nomorHp']!,
            style: TextStyle(fontSize: 12.sp, color: Colors.red),
          ),
        ],
      ],
    );
  }

  Widget _buildBottomActions(dynamic t) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _handleCancel,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(t.button_cancel),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(t.message_draft_saved),
                    backgroundColor: Colors.blue,
                  ),
                );
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: ColorName.primary,
                side: BorderSide(color: ColorName.primary),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(t.button_save_draft),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primary,
                foregroundColor: ColorName.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(t.button_submit),
            ),
          ),
        ],
      ),
    );
  }
}
