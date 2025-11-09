import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class RFCFormScreen extends StatefulWidget {
  const RFCFormScreen({super.key});

  @override
  State<RFCFormScreen> createState() => _RFCFormScreenState();
}

class _RFCFormScreenState extends State<RFCFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _judulController = TextEditingController();
  final _namaPemohonController = TextEditingController();
  final _nomorHpController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _alasanPerubahanController = TextEditingController();
  final _estimasiBiayaController = TextEditingController();
  final _dampakPerubahanController = TextEditingController();
  final _dampakJikaTidakController = TextEditingController();

  // Dropdown values
  String? _selectedKategoriAset;
  String? _selectedNamaAset;
  String? _selectedAsetTerdampak;

  // Date values
  DateTime? _tanggalPengerjaanAwal;
  DateTime? _tanggalSampai;

  // Dummy dropdown options
  final List<String> _kategoriAsetOptions = [
    'Jaringan',
    'Komputer',
    'Printer',
    'Server',
  ];

  final List<String> _namaAsetOptions = [
    'Router TP-Link',
    'Switch Cisco',
    'Access Point',
    'Laptop Dell',
  ];

  final List<String> _asetTerdampakOptions = [
    'Router TP-Link',
    'Switch Cisco',
    'Access Point',
    'Laptop Dell',
    'Server Database',
  ];

  @override
  void dispose() {
    _judulController.dispose();
    _namaPemohonController.dispose();
    _nomorHpController.dispose();
    _deskripsiController.dispose();
    _alasanPerubahanController.dispose();
    _estimasiBiayaController.dispose();
    _dampakPerubahanController.dispose();
    _dampakJikaTidakController.dispose();
    super.dispose();
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      initialDateRange: _tanggalPengerjaanAwal != null && _tanggalSampai != null
          ? DateTimeRange(start: _tanggalPengerjaanAwal!, end: _tanggalSampai!)
          : null,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: ColorName.primary,
              onPrimary: ColorName.white,
              onSurface: ColorName.textPrimary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        _tanggalPengerjaanAwal = picked.start;
        _tanggalSampai = picked.end;
      });
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.rfc;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(
        title: t.rfc_form_title,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Judul Pengajuan
                    _buildSectionTitle(t.submission_title),
                    SizedBox(height: 8.h),
                    _buildTextField(
                      controller: _judulController,
                      hint: t.submission_title_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Nama Pemohon & Nomor HP (Row)
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.applicant_name),
                              SizedBox(height: 8.h),
                              _buildTextField(
                                controller: _namaPemohonController,
                                hint: t.applicant_name_hint,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return t.validation_required;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.phone_number),
                              SizedBox(height: 8.h),
                              _buildTextField(
                                controller: _nomorHpController,
                                hint: t.phone_number_hint,
                                keyboardType: TextInputType.phone,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return t.validation_required;
                                  }
                                  if (value.length < 10) {
                                    return t.validation_phone_invalid;
                                  }
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    /// Kategori Aset & Nama Aset (Row)
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.asset_category),
                              SizedBox(height: 8.h),
                              AppDropdownField(
                                label: t.asset_category_hint,
                                value: _selectedKategoriAset,
                                items: _kategoriAsetOptions,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedKategoriAset = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.asset_name),
                              SizedBox(height: 8.h),
                              AppDropdownField(
                                label: t.asset_name_hint,
                                value: _selectedNamaAset,
                                items: _namaAsetOptions,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedNamaAset = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    /// Deskripsi
                    _buildSectionTitle(t.description),
                    SizedBox(height: 8.h),
                    _buildTextArea(
                      controller: _deskripsiController,
                      hint: t.description_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Alasan Perubahan
                    _buildSectionTitle(t.change_reason),
                    SizedBox(height: 8.h),
                    _buildTextArea(
                      controller: _alasanPerubahanController,
                      hint: t.change_reason_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Pengerjaan Awal & Sampai (Row)
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.start_date),
                              SizedBox(height: 8.h),
                              _buildDateField(
                                date: _tanggalPengerjaanAwal,
                                hint: t.start_date_hint,
                                onTap: () => _selectDateRange(context),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildSectionTitle(t.end_date),
                              SizedBox(height: 8.h),
                              _buildDateField(
                                date: _tanggalSampai,
                                hint: t.end_date_hint,
                                onTap: () => _selectDateRange(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),

                    /// Aset Terdampak
                    _buildSectionTitle(t.affected_asset),
                    SizedBox(height: 8.h),
                    AppDropdownField(
                      label: t.affected_asset_hint,
                      value: _selectedAsetTerdampak,
                      items: _asetTerdampakOptions,
                      onChanged: (value) {
                        setState(() {
                          _selectedAsetTerdampak = value;
                        });
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Estimasi Biaya
                    _buildSectionTitle(t.cost_estimate),
                    SizedBox(height: 8.h),
                    _buildCurrencyField(
                      controller: _estimasiBiayaController,
                      hint: t.cost_estimate_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Dampak Perubahan
                    _buildSectionTitle(t.change_impact),
                    SizedBox(height: 8.h),
                    _buildTextArea(
                      controller: _dampakPerubahanController,
                      hint: t.change_impact_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    /// Dampak Jika Tidak Dilakukan Perubahan
                    _buildSectionTitle(t.no_change_impact),
                    SizedBox(height: 8.h),
                    _buildTextArea(
                      controller: _dampakJikaTidakController,
                      hint: t.no_change_impact_hint,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return t.validation_required;
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ),

          /// Bottom Action Buttons
          _buildBottomActions(t),
        ],
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
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade500,
        ),
        filled: true,
        fillColor: ColorName.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        color: ColorName.textPrimary,
      ),
    );
  }

  Widget _buildTextArea({
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: 5,
      validator: validator,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade500,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        color: ColorName.textPrimary,
        height: 1.5,
      ),
    );
  }

  Widget _buildCurrencyField({
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      validator: validator,
      decoration: InputDecoration(
        prefixText: 'Rp. ',
        prefixStyle: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textPrimary,
          fontWeight: FontWeight.w600,
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade500,
        ),
        filled: true,
        fillColor: ColorName.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14.w,
          vertical: 14.h,
        ),
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
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
        ),
      ),
      style: TextStyle(
        fontSize: 14.sp,
        color: ColorName.textPrimary,
      ),
    );
  }

  Widget _buildDateField({
    required DateTime? date,
    required String hint,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: ColorName.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade400),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                date != null ? _formatDate(date) : hint,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: date != null
                      ? ColorName.textPrimary
                      : Colors.grey.shade500,
                ),
              ),
            ),
            Icon(
              Icons.calendar_today,
              size: 18.sp,
              color: ColorName.primary,
            ),
          ],
        ),
      ),
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
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.button_cancel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _handleSaveDraft();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: ColorName.primary,
                side: BorderSide(color: ColorName.primary),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.button_save_draft,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _handleSubmit();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primary,
                foregroundColor: ColorName.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.button_submit,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSaveDraft() {
    // TODO: Implement save draft logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.t.app.rfc.message_draft_saved),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Validate dropdown and date fields
      if (_selectedKategoriAset == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.app.rfc.validation_category_required),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_selectedNamaAset == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.app.rfc.validation_asset_required),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_tanggalPengerjaanAwal == null || _tanggalSampai == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.t.app.rfc.validation_date_required),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      if (_selectedAsetTerdampak == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                context.t.app.rfc.validation_affected_asset_required),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }

      // All validation passed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(context.t.app.rfc.message_submit_success),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}