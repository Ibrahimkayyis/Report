import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // ✅ Untuk copy to clipboard
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/painters/login_background_painter.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // --- Helper Function: Generate 4 Digit Random OTP ---
  String _generateOtp() {
    var rng = Random();
    int code = rng.nextInt(9000) + 1000;
    return code.toString();
  }

  // ✅ Custom SnackBar dengan Design yang Lebih Bagus
  void _showOtpSnackBar(String otpCode) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              // Icon Email
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  Icons.mail_outline,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              
              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Kode OTP Terkirim',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        Text(
                          'Kode verifikasi: ',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Text(
                            otpCode,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              
              // Copy Button
              IconButton(
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: otpCode));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('Kode OTP berhasil disalin'),
                      duration: const Duration(seconds: 1),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.green,
                    ),
                  );
                },
                icon: Icon(
                  Icons.content_copy,
                  color: Colors.white,
                  size: 20.sp,
                ),
                tooltip: 'Salin kode',
              ),
            ],
          ),
        ),
        backgroundColor: ColorName.primary,
        duration: const Duration(seconds: 6),
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(16.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 6,
      ),
    );
  }

  Future<void> _onSendPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      
      // 1. Generate OTP secara lokal
      final otpCode = _generateOtp();

      // 2. Simulasi Loading API
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isLoading = false);
      
      if (!mounted) return;

      // 3. ✅ Tampilkan Custom SnackBar
      _showOtpSnackBar(otpCode);
      
      // 4. Navigasi ke VerifyOtpScreen
      context.router.push(
        VerifyOtpRoute(
          email: _emailController.text.trim(),
          generatedOtp: otpCode,
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
                        children: [
                          // Logo
                          const LogoWidget(),
                          SizedBox(height: 24.h),

                          // Title
                          Text(
                            t.forgot_password_title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                              color: ColorName.textPrimary,
                            ),
                          ),

                          SizedBox(height: 12.h),

                          // Subtitle
                          Text(
                            t.forgot_password_subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorName.textPrimary,
                              height: 1.5,
                            ),
                          ),

                          SizedBox(height: 32.h),

                          // Email Field
                          AppTextField(
                            controller: _emailController,
                            label: t.email_address,
                            hint: '',
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return t.required_field;
                              }
                              if (!value.contains('@')) {
                                return t.invalid_email;
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 120.h),

                          // Send Button
                          PrimaryButton(
                            label: t.send_button,
                            onPressed: _isLoading ? null : _onSendPressed,
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