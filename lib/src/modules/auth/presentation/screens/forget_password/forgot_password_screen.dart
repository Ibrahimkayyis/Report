import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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

  Future<void> _onSendPressed() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _isLoading = true);
      
      // TODO: Call API to send OTP
      await Future.delayed(const Duration(seconds: 2));
      
      setState(() => _isLoading = false);
      
      if (!mounted) return;
      
      // Navigate to OTP verification screen
      context.router.push(
        VerifyOtpRoute(email: _emailController.text.trim()),
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