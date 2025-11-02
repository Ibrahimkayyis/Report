import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

class EditProfileDialog extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String birthDate;
  final String email;
  final String phoneNumber;
  final String address;

  const EditProfileDialog({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    required this.address,
  });

  static Future<Map<String, String>?> show(
    BuildContext context, {
    required String firstName,
    required String lastName,
    required String birthDate,
    required String email,
    required String phoneNumber,
    required String address,
  }) {
    return showDialog<Map<String, String>>(
      context: context,
      builder: (context) => EditProfileDialog(
        firstName: firstName,
        lastName: lastName,
        birthDate: birthDate,
        email: email,
        phoneNumber: phoneNumber,
        address: address,
      ),
    );
  }

  @override
  State<EditProfileDialog> createState() => _EditProfileDialogState();
}

class _EditProfileDialogState extends State<EditProfileDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _birthDateController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.firstName == '-' ? '' : widget.firstName);
    _lastNameController = TextEditingController(text: widget.lastName == '-' ? '' : widget.lastName);
    _birthDateController = TextEditingController(text: widget.birthDate == '-' ? '' : widget.birthDate);
    _emailController = TextEditingController(text: widget.email == '-' ? '' : widget.email);
    _phoneController = TextEditingController(text: widget.phoneNumber == '-' ? '' : widget.phoneNumber);
    _addressController = TextEditingController(text: widget.address == '-' ? '' : widget.address);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  String? _validatePhone(String? value) {
    final t = context.t;
    if (value == null || value.isEmpty) {
      return t.app.validation_phone_required;
    }
    final phoneRegex = RegExp(r'^[0-9+\-\s()]+$');
    if (!phoneRegex.hasMatch(value)) {
      return t.app.validation_phone_format;
    }
    return null;
  }

  String? _validateRequired(String? value, String fieldName) {
    final t = context.t;
    if (value == null || value.isEmpty) {
      return '$fieldName ${t.app.validation_required}';
    }
    return null;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _birthDateController.text = '${picked.day.toString().padLeft(2, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.year}';
      });
    }
  }

  void _handleSave() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Return data ke parent
    Navigator.pop(context, {
      'firstName': _firstNameController.text,
      'lastName': _lastNameController.text,
      'birthDate': _birthDateController.text,
      'phoneNumber': _phoneController.text,
      'address': _addressController.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Container(
        constraints: BoxConstraints(maxWidth: 500.w, maxHeight: 600.h),
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    t.app.edit_profile_title,
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

              // Form Fields
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _firstNameController,
                        label: t.app.first_name,
                        hint: t.app.first_name,
                        prefixIcon: Icon(Icons.person, color: ColorName.primary),
                        validator: (v) => _validateRequired(v, t.app.first_name),
                      ),
                      SizedBox(height: 16.h),
                      
                      AppTextField(
                        controller: _lastNameController,
                        label: t.app.last_name,
                        hint: t.app.last_name,
                        prefixIcon: Icon(Icons.person_outline, color: ColorName.primary),
                        validator: (v) => _validateRequired(v, t.app.last_name),
                      ),
                      SizedBox(height: 16.h),
                      
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: AppTextField(
                            controller: _birthDateController,
                            label: t.app.birth_date,
                            hint: t.app.birth_date,
                            prefixIcon: Icon(Icons.calendar_today, color: ColorName.primary),
                            validator: (v) => _validateRequired(v, t.app.birth_date),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      Opacity(
                        opacity: 0.6,
                        child: AbsorbPointer(
                          child: AppTextField(
                            controller: _emailController,
                            label: t.app.email,
                            hint: t.app.email,
                            keyboardType: TextInputType.emailAddress,
                            prefixIcon: Icon(Icons.email, color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      
                      AppTextField(
                        controller: _phoneController,
                        label: t.app.phone_number,
                        hint: t.app.phone_number,
                        keyboardType: TextInputType.phone,
                        prefixIcon: Icon(Icons.phone, color: ColorName.primary),
                        validator: _validatePhone,
                      ),
                      SizedBox(height: 16.h),
                      
                      AppTextField(
                        controller: _addressController,
                        label: t.app.address,
                        hint: t.app.address,
                        maxLines: 3,
                        prefixIcon: Icon(Icons.location_on, color: ColorName.primary),
                        validator: (v) => _validateRequired(v, t.app.address),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 24.h),

              // Action Buttons
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
                        t.app.cancel,
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
                        t.app.save,
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