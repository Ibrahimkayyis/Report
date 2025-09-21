import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/presentation/widgets/widgets.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 60.h),

              /// Auth Form Container
              AuthContainer(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Logo
                      const Center(child: LogoWidget()),

                      SizedBox(height: 20.h),

                      /// Title
                      Center(
                        child: Text(
                          t.app.please_login_or_register,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorName.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 8.h),

                      /// Subtitle
                      Center(
                        child: Text(
                          t.app.use_email_to_continue,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorName.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 30.h),

                      /// Email Field
                      AppTextField(
                        controller: _emailController,
                        label: t.app.email,
                        hint: '',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.app.required_field;
                          }
                          if (!value.contains('@')) {
                            return t.app.invalid_email;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      /// Password Field
                      PasswordField(
                        controller: _passwordController,
                        label: t.app.password,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.app.required_field;
                          }
                          if (value.length < 8) {
                            return t.app.password_too_short;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      /// Don't have account text
                      Center(
                        child: LinkText(
                          leadingText: t.app.dont_have_account,
                          linkText: t.app.register,
                          onTap: () => context.router.push(const RegisterRoute()),
                        ),
                      ),

                      SizedBox(height: 120.h),

                      /// Login Button
                      PrimaryButton(
                        label: t.app.login,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // TODO: Implement login logic
                          }
                        },
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
    );
  }
}
