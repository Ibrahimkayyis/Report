import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/painters/login_background_painter.dart';

@RoutePage()
class VerifyOtpScreen extends StatefulWidget {
  final String email;

  const VerifyOtpScreen({
    super.key,
    required this.email,
  });

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final List<TextEditingController> _controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  final List<FocusNode> _focusNodes = List.generate(4, (_) => FocusNode());
  bool _isLoading = false;

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  String get _otpCode {
    return _controllers.map((c) => c.text).join();
  }

  bool get _isOtpComplete {
    return _otpCode.length == 4;
  }

  Future<void> _onVerifyPressed() async {
    if (!_isOtpComplete) return;

    setState(() => _isLoading = true);

    // TODO: Call API to verify OTP
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

    if (!mounted) return;

    // Navigate to reset password screen
    context.router.push(
      ResetPasswordRoute(
        email: widget.email,
        otpCode: _otpCode,
      ),
    );
  }

  Future<void> _onResendOtp() async {
    // TODO: Call API to resend OTP
    if (!mounted) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.t.app.otp_resent),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
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
                    child: Column(
                      children: [
                        // Logo
                        const LogoWidget(),
                        SizedBox(height: 24.h),

                        // Title
                        Text(
                          t.verify_otp_title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorName.textPrimary,
                          ),
                        ),

                        SizedBox(height: 12.h),

                        // Subtitle with email
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: ColorName.textPrimary,
                              height: 1.5,
                            ),
                            children: [
                              TextSpan(text: t.verify_otp_subtitle_prefix),
                              TextSpan(
                                text: widget.email,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.textPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 32.h),

                        // OTP Input Fields
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: TextField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                  color: ColorName.textPrimary,
                                ),
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                ],
                                decoration: InputDecoration(
                                  counterText: '',
                                  filled: true,
                                  fillColor: ColorName.white,
                                  contentPadding: EdgeInsets.zero,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 2,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.r),
                                    borderSide: BorderSide(
                                      color: ColorName.primary,
                                      width: 2,
                                    ),
                                  ),
                                ),
                                onChanged: (value) {
                                  if (value.isNotEmpty && index < 3) {
                                    _focusNodes[index + 1].requestFocus();
                                  } else if (value.isEmpty && index > 0) {
                                    _focusNodes[index - 1].requestFocus();
                                  }
                                  setState(() {});
                                },
                              ),
                            );
                          }),
                        ),

                        SizedBox(height: 24.h),

                        // Resend OTP Link
                        GestureDetector(
                          onTap: _onResendOtp,
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: ColorName.textPrimary,
                              ),
                              children: [
                                TextSpan(text: t.otp_not_received),
                                TextSpan(
                                  text: t.resend_otp,
                                  style: TextStyle(
                                    color: ColorName.primary,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 80.h),

                        // Verify Button
                        PrimaryButton(
                          label: t.verify_button,
                          onPressed: (_isLoading || !_isOtpComplete)
                              ? null
                              : _onVerifyPressed,
                          isLoading: _isLoading,
                        ),
                      ],
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