import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/painters/login_background_painter.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  final String email;
  final String otpCode;

  const ResetPasswordScreen({
    super.key,
    required this.email,
    required this.otpCode,
  });

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _onResetPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);

      // TODO: Call API to reset password
      await Future.delayed(const Duration(seconds: 2));

      setState(() => _isLoading = false);

      if (!mounted) return;

      // Show success dialog
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) => AppReportSuccessDialog(
          title: context.t.app.password_reset_success_title,
          message: context.t.app.password_reset_success_message,
          buttonText: context.t.app.login,
          onPressed: () {
            Navigator.of(dialogContext).pop();
            // Navigate back to login screen
            context.router.replaceAll([const LoginRoute()]);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: ColorName.textPrimary,
            size: 20.sp,
          ),
          onPressed: () => context.router.maybePop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          CustomPaint(
            painter: LoginBackgroundPainter(),
            size: Size.infinite,
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 60.h),

                  AuthContainer(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Logo
                          const Center(child: LogoWidget()),
                          SizedBox(height: 24.h),

                          // Title
                          Center(
                            child: Text(
                              t.reset_password_title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.bold,
                                color: ColorName.textPrimary,
                              ),
                            ),
                          ),

                          SizedBox(height: 32.h),

                          // New Password Field
                          PasswordField(
                            controller: _newPasswordController,
                            label: t.new_password_label,
                            hint: '',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.required_field;
                              }
                              if (value.length < 8) {
                                return t.password_too_short;
                              }
                              return null;
                            },
                            showStrengthMeter: false,
                          ),

                          SizedBox(height: 16.h),

                          // Confirm Password Field
                          PasswordField(
                            controller: _confirmPasswordController,
                            label: t.confirm_password_label,
                            hint: '',
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.required_field;
                              }
                              if (value != _newPasswordController.text) {
                                return t.password_mismatch;
                              }
                              return null;
                            },
                            showStrengthMeter: false,
                          ),

                          SizedBox(height: 120.h),

                          // Reset Password Button
                          PrimaryButton(
                            label: t.reset_password_button,
                            onPressed: _isLoading ? null : _onResetPressed,
                            isLoading: _isLoading,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}