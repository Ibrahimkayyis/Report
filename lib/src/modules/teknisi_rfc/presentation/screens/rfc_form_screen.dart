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
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/masyarakat_reporting/presentation/cubits/opd_state.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/reporting_text_field.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/presentation/cubits/form/rfc_form_cubit.dart';
import '../widgets/opd_dropdown_section.dart';

@RoutePage()
class RFCFormScreen extends StatefulWidget {
  final RfcModel? draftData;

  const RFCFormScreen({super.key, this.draftData});

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

  // --- State Variables ---
  String? _selectedOpdId;
  String? _selectedAssetId; // ✅ Menyimpan ID dari asset yang dipilih
  String? _selectedAssetName; // ✅ Menyimpan nama untuk ditampilkan di dropdown
  String? _selectedEstimasiWaktu;
  String? _selectedEstimasiBiaya;

  // Error Handling
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  // --- Static Options ---
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
  void initState() {
    super.initState();
    if (widget.draftData != null) {
      _fillFormData(widget.draftData!);
    }
  }

  void _fillFormData(RfcModel data) {
    _judulController.text = data.judulPerubahan;
    _namaPemohonController.text = data.namaPemohon;
    _deskripsiController.text = data.deskripsiAset;
    _alasanPerubahanController.text = data.alasanPerubahan;
    _dampakPerubahanController.text = data.dampakPerubahan;
    _dampakJikaTidakController.text = data.dampakJikaTidak;
  }

  @override
  void dispose() {
    _judulController.dispose();
    _namaPemohonController.dispose();
    _nomorHpController.dispose();
    _deskripsiController.dispose();
    _alasanPerubahanController.dispose();
    _dampakPerubahanController.dispose();
    _dampakJikaTidakController.dispose();
    super.dispose();
  }

  // --- Logic Methods ---

  void _clearError(String key) {
    if (_hasAttemptedSubmit && _errors[key] != null) {
      setState(() => _errors[key] = null);
    }
  }

  // Helper konversi String Estimasi ke Int
  int _parseBiayaEstimasi(String? value) {
    if (value == null) return 0;
    if (value.contains('Kurang dari')) return 250000;
    if (value.contains('500.000 – Rp 1.000.000')) return 750000;
    if (value.contains('1.000.000 – Rp 5.000.000')) return 3000000;
    if (value.contains('5.000.000 – Rp 10.000.000')) return 7500000;
    if (value.contains('Lebih dari')) return 15000000;
    return 1000000;
  }

  bool _validateForm() {
    final t = context.t.app.rfc;
    final newErrors = <String, String?>{};

    void validate(String key, bool isInvalid, String errorMessage) {
      if (isInvalid) newErrors[key] = errorMessage;
    }

    validate('judul', _judulController.text.trim().isEmpty, t.validation_required);
    validate('namaPemohon', _namaPemohonController.text.trim().isEmpty, t.validation_required);
    validate('opdAsal', _selectedOpdId?.isEmpty ?? true, t.validation_opd_required);

    final phone = _nomorHpController.text.trim();
    validate('nomorHp', phone.isEmpty, t.validation_required);
    if (phone.isNotEmpty && phone.length < 10) {
      validate('nomorHp', true, t.validation_phone_invalid);
    }

    // Validasi Aset
    validate('dataAsset', _selectedAssetId == null, t.validation_data_asset_required);
    
    // Validasi Estimasi
    validate('estimasiWaktu', _selectedEstimasiWaktu?.isEmpty ?? true, t.validation_time_estimate_required);
    validate('estimasiBiaya', _selectedEstimasiBiaya?.isEmpty ?? true, t.validation_cost_estimate_required);

    // Validasi Deskripsi
    validate('deskripsi', _deskripsiController.text.trim().isEmpty, t.validation_required);
    validate('alasanPerubahan', _alasanPerubahanController.text.trim().isEmpty, t.validation_required);
    validate('dampakPerubahan', _dampakPerubahanController.text.trim().isEmpty, t.validation_required);
    validate('dampakJikaTidak', _dampakJikaTidakController.text.trim().isEmpty, t.validation_required);

    setState(() {
      _hasAttemptedSubmit = true;
      _errors.clear();
      _errors.addAll(newErrors);
    });

    return _errors.isEmpty;
  }

  void _handleSubmit(BuildContext context) {
    final t = context.t.app.rfc;
    if (!_validateForm()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Mohon lengkapi formulir"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

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
          
          AppLogger.i('📤 Submitting RFC: Asset ID = $_selectedAssetId');
          
          // ✅ Panggil Cubit untuk Submit ke API
          context.read<RfcFormCubit>().submitIncidentRepeat(
            judul: _judulController.text.trim(),
            idAset: int.tryParse(_selectedAssetId ?? '0') ?? 0,
            deskripsi: _deskripsiController.text.trim(),
            alasan: _alasanPerubahanController.text.trim(),
            dampak: _dampakPerubahanController.text.trim(),
            dampakJikaTidak: _dampakJikaTidakController.text.trim(),
            biaya: _parseBiayaEstimasi(_selectedEstimasiBiaya),
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _handleCancel() {
    context.router.maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.rfc;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<OpdCubit>()..fetchOpdList()),
        BlocProvider(create: (_) => sl<RfcFormCubit>()..fetchAssets()),
      ],
      child: BlocListener<RfcFormCubit, RfcFormState>(
        listener: (context, state) {
          // 🟢 Listen: Sukses Submit
          if (state.formStatus == FormSubmitStatus.success) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (successContext) => AppGlobalSuccessDialog(
                title: t.dialog_report_success_title,
                buttonText: t.dialog_report_success_button,
                onPressed: () {
                  Navigator.of(successContext).pop();
                  context.router.maybePop(true);
                },
              ),
            );
          }
          
          // 🔴 Listen: Gagal Submit
          if (state.formStatus == FormSubmitStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? "Gagal mengirim data"),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
          appBar: AppPrimaryBar(
            title: widget.draftData != null ? "Edit Draft RFC" : t.rfc_form_title,
            centerTitle: true,
          ),
          body: BlocBuilder<RfcFormCubit, RfcFormState>(
            builder: (context, state) {
              final isSubmitting = state.formStatus == FormSubmitStatus.submitting;

              return Stack(
                children: [
                  Column(
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

                              // 3. OPD Dropdown
                              BlocBuilder<OpdCubit, OpdState>(
                                builder: (context, opdState) {
                                  final items = (opdState is OpdLoaded) ? opdState.opdList : [];
                                  return OpdDropdownSection(
                                    label: t.opd_origin_label,
                                    hint: t.opd_origin_hint,
                                    selectedOpdId: _selectedOpdId,
                                    errorText: _errors['opdAsal'],
                                    items: items,
                                    isLoading: opdState is OpdLoading,
                                    isError: opdState is OpdError,
                                    onRetry: () => context.read<OpdCubit>().fetchOpdList(),
                                    onChanged: (selectedOpd) {
                                      if (selectedOpd != null) {
                                        setState(() => _selectedOpdId = selectedOpd.opdId);
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

                              // 5. ✅ Data Aset (Dropdown dari API) - FIXED
                              _buildAssetDropdown(state, t),
                              SizedBox(height: 20.h),

                              // 6. Estimasi Waktu
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

                              // 7. Estimasi Biaya
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

                              // 8. Deskripsi
                              ReportingTextField(
                                label: t.description,
                                hint: t.description_hint,
                                controller: _deskripsiController,
                                maxLines: 4,
                                errorText: _errors['deskripsi'],
                                onChanged: (_) => _clearError('deskripsi'),
                              ),
                              SizedBox(height: 20.h),

                              // 9. Alasan Perubahan
                              ReportingTextField(
                                label: t.change_reason,
                                hint: t.change_reason_hint,
                                controller: _alasanPerubahanController,
                                maxLines: 4,
                                errorText: _errors['alasanPerubahan'],
                                onChanged: (_) => _clearError('alasanPerubahan'),
                              ),
                              SizedBox(height: 20.h),

                              // 10. Dampak Perubahan
                              ReportingTextField(
                                label: t.change_impact,
                                hint: t.change_impact_hint,
                                controller: _dampakPerubahanController,
                                maxLines: 4,
                                errorText: _errors['dampakPerubahan'],
                                onChanged: (_) => _clearError('dampakPerubahan'),
                              ),
                              SizedBox(height: 20.h),

                              // 11. Dampak Jika Tidak
                              ReportingTextField(
                                label: t.no_change_impact,
                                hint: t.no_change_impact_hint,
                                controller: _dampakJikaTidakController,
                                maxLines: 4,
                                errorText: _errors['dampakJikaTidak'],
                                onChanged: (_) => _clearError('dampakJikaTidak'),
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ),
                      
                      _buildBottomActions(context, t),
                    ],
                  ),

                  // Loading Overlay saat Submit
                  if (isSubmitting)
                    Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // ✅ Custom Asset Dropdown dengan Error Handling yang Benar
  Widget _buildAssetDropdown(RfcFormState state, dynamic t) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.data_asset_hint,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        
        // Loading State
        if (state.assetStatus == AssetStatus.loading)
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 20.w,
                  height: 20.w,
                  child: const CircularProgressIndicator(strokeWidth: 2),
                ),
                SizedBox(width: 12.w),
                const Text('Memuat data aset...'),
              ],
            ),
          )
        // Error State
        else if (state.assetStatus == AssetStatus.failure)
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.red.shade50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.red.shade300),
            ),
            child: Row(
              children: [
                Icon(Icons.error_outline, color: Colors.red, size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    state.errorMessage ?? 'Gagal memuat data aset',
                    style: TextStyle(color: Colors.red.shade700),
                  ),
                ),
                TextButton(
                  onPressed: () => context.read<RfcFormCubit>().fetchAssets(),
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          )
        // Success State - Dropdown
        else if (state.assets.isNotEmpty)
          DropdownButtonFormField<String>(
            value: _selectedAssetName,
            decoration: InputDecoration(
              hintText: 'Pilih Data Aset',
              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500),
              filled: true,
              fillColor: ColorName.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: _errors['dataAsset'] != null ? Colors.red : Colors.grey.shade400,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: _errors['dataAsset'] != null ? Colors.red : Colors.grey.shade400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(
                  color: _errors['dataAsset'] != null ? Colors.red : ColorName.primary,
                  width: 2,
                ),
              ),
            ),
            items: state.assets.map((asset) {
              return DropdownMenuItem<String>(
                value: asset.name, // ✅ Value adalah nama (untuk UI)
                child: Text(
                  asset.name,
                  style: TextStyle(fontSize: 14.sp),
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
            onChanged: (String? selectedName) {
              if (selectedName != null) {
                // ✅ Cari object asset berdasarkan nama
                final selectedAsset = state.assets.firstWhere(
                  (asset) => asset.name == selectedName,
                );
                
                setState(() {
                  _selectedAssetName = selectedName; // Untuk UI dropdown
                  _selectedAssetId = selectedAsset.assetId; // Untuk dikirim ke API
                });
                
                _clearError('dataAsset');
                
                AppLogger.d('✅ Selected Asset: $selectedName (ID: ${selectedAsset.assetId})');
              }
            },
            isExpanded: true,
            icon: Icon(Icons.arrow_drop_down, color: Colors.grey.shade700),
          )
        // Empty State
        else
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              'Tidak ada data aset tersedia',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ),
        
        // Error Message
        if (_errors['dataAsset'] != null) ...[
          SizedBox(height: 6.h),
          Text(
            _errors['dataAsset']!,
            style: TextStyle(fontSize: 12.sp, color: Colors.red),
          ),
        ],
      ],
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

  Widget _buildBottomActions(BuildContext context, dynamic t) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.05),
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
            child: ElevatedButton(
              onPressed: () => _handleSubmit(context),
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