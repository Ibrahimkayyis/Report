import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/widgets/widgets.dart';

/// 🔹 Reusable dialog untuk mengedit profil user (Tanpa Tanggal Lahir).
class AppEditProfileDialog extends StatefulWidget {
  final String title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? address;

  /// 🔸 Label dan hint custom (untuk i18n)
  final Map<String, String>? labels;

  /// 🔸 Callback validasi opsional
  final String? Function(String value)? validateRequired;
  final String? Function(String value)? validatePhone;

  /// 🔹 Default: 'Cancel' dan 'Save'
  final String cancelText;
  final String saveText;

  const AppEditProfileDialog({
    super.key,
    required this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.address,
    this.labels,
    this.validateRequired,
    this.validatePhone,
    this.cancelText = 'Cancel',
    this.saveText = 'Save',
  });

  static Future<Map<String, String>?> show(
    BuildContext context, {
    required String title,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? address,
    Map<String, String>? labels,
    String? Function(String value)? validateRequired,
    String? Function(String value)? validatePhone,
    String cancelText = 'Cancel',
    String saveText = 'Save',
  }) {
    return showDialog<Map<String, String>>(
      context: context,
      builder: (_) => AppEditProfileDialog(
        title: title,
        firstName: firstName,
        lastName: lastName,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
        labels: labels,
        validateRequired: validateRequired,
        validatePhone: validatePhone,
        cancelText: cancelText,
        saveText: saveText,
      ),
    );
  }

  @override
  State<AppEditProfileDialog> createState() => _AppEditProfileDialogState();
}

class _AppEditProfileDialogState extends State<AppEditProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName ?? '');
    _lastNameController = TextEditingController(text: widget.lastName ?? '');
    _emailController = TextEditingController(text: widget.email ?? '');
    _phoneController = TextEditingController(text: widget.phoneNumber ?? '');
    _addressController = TextEditingController(text: widget.address ?? '');
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) return;

    Navigator.pop(context, {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'email': _emailController.text,
      'phoneNumber': _phoneController.text,
      'address': _addressController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final label = widget.labels ??
        {
          'first_name': 'First Name',
          'last_name': 'Last Name',
          'email': 'Email',
          'phone_number': 'Phone Number',
          'address': 'Address',
        };

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Container(
        constraints: BoxConstraints(maxWidth: 500.w, maxHeight: 600.h),
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: ColorName.primary,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),

              SizedBox(height: 24.h),

              // 🔹 Form Fields
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _firstNameController,
                        label: label['first_name']!,
                        prefixIcon: Icon(
                          Icons.person,
                          color: ColorName.primary,
                        ),
                        validator: (v) => (widget.validateRequired?.call(v ?? '') ??
                            (v == null || v.isEmpty
                                ? '${label['first_name']} is required'
                                : null)),
                      ),
                      SizedBox(height: 16.h),

                      AppTextField(
                        controller: _lastNameController,
                        label: label['last_name']!,
                        prefixIcon: Icon(
                          Icons.person_outline,
                          color: ColorName.primary,
                        ),
                        validator: (v) => (widget.validateRequired?.call(v ?? '') ??
                            (v == null || v.isEmpty
                                ? '${label['last_name']} is required'
                                : null)),
                      ),
                      SizedBox(height: 16.h),

                      AppTextField(
                        controller: _emailController,
                        label: label['email']!,
                        prefixIcon: Icon(Icons.email, color: Colors.grey),
                        readOnly: true, // Email usually read-only
                      ),
                      SizedBox(height: 16.h),

                      AppTextField(
                        controller: _phoneController,
                        label: label['phone_number']!,
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icon(Icons.phone, color: ColorName.primary),
                        validator: (v) => (widget.validatePhone?.call(v ?? '') ??
                            (v == null || v.isEmpty
                                ? '${label['phone_number']} is required'
                                : null)),
                      ),
                      SizedBox(height: 16.h),

                      AppTextField(
                        controller: _addressController,
                        label: label['address']!,
                        prefixIcon: Icon(
                          Icons.location_on,
                          color: ColorName.primary,
                        ),
                        maxLines: 3,
                        validator: (v) => (widget.validateRequired?.call(v ?? '') ??
                            (v == null || v.isEmpty
                                ? '${label['address']} is required'
                                : null)),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // 🔹 Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        side: BorderSide(color: Colors.grey.shade400),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        widget.cancelText,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _handleSave,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.primary,
                        foregroundColor: ColorName.background,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: Text(
                        widget.saveText,
                        style: TextStyle(fontSize: 14.sp),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}