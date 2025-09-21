import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_field.dart';

/// Custom PasswordField dengan toggle visibility dan optional strength meter.
class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final bool showStrengthMeter;

  const PasswordField({
    super.key,
    required this.controller,
    this.label,
    this.hint,
    this.validator,
    this.onChanged,
    this.showStrengthMeter = false, // default: off (untuk login/confirm password)
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;
  double _strength = 0.0;
  String _strengthLabel = '';

  @override
  void initState() {
    super.initState();
    if (widget.showStrengthMeter) {
      widget.controller.addListener(_checkPasswordStrength);
    }
  }

  @override
  void dispose() {
    if (widget.showStrengthMeter) {
      widget.controller.removeListener(_checkPasswordStrength);
    }
    super.dispose();
  }

  void _checkPasswordStrength() {
    final password = widget.controller.text.trim();

    if (password.isEmpty) {
      setState(() {
        _strength = 0;
        _strengthLabel = '';
      });
      return;
    }

    // Simple strength rules
    if (password.length < 6) {
      _strength = 0.25;
      _strengthLabel = 'Weak';
    } else if (password.length < 8) {
      _strength = 0.5;
      _strengthLabel = 'Medium';
    } else {
      final hasLetters = RegExp(r'[A-Za-z]').hasMatch(password);
      final hasNumbers = RegExp(r'[0-9]').hasMatch(password);
      final hasSpecial = RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password);

      if (hasLetters && hasNumbers && hasSpecial) {
        _strength = 1.0;
        _strengthLabel = 'Strong';
      } else {
        _strength = 0.75;
        _strengthLabel = 'Good';
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextField(
          controller: widget.controller,
          label: widget.label,
          hint: widget.hint,
          validator: widget.validator,
          onChanged: widget.onChanged,
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_isPasswordVisible, // default hidden (*)
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey.shade600,
              size: 20.sp,
            ),
          ),
        ),
        if (widget.showStrengthMeter && _strength > 0) ...[
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: _strength,
                  minHeight: 6.h,
                  backgroundColor: Colors.grey.shade300,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    _strength <= 0.25
                        ? Colors.red
                        : _strength <= 0.5
                            ? Colors.orange
                            : _strength <= 0.75
                                ? Colors.blue
                                : Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                _strengthLabel,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: _strength <= 0.25
                      ? Colors.red
                      : _strength <= 0.5
                          ? Colors.orange
                          : _strength <= 0.75
                              ? Colors.blue
                              : Colors.green,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
