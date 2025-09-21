import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/presentation/widgets/widgets.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                          t.app.create_account,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: ColorName.textPrimary,
                          ),
                        ),
                      ),

                      SizedBox(height: 8.h),

                      /// Already have account? Login
                      Center(
                        child: LinkText(
                          leadingText: t.app.already_have_account,
                          linkText: t.app.login,
                          onTap: () => context.router.push(const LoginRoute()),
                        ),
                      ),

                      SizedBox(height: 30.h),

                      /// First Name
                      AppTextField(
                        controller: _firstNameController,
                        label: t.app.first_name,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.app.required_field;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      /// Last Name
                      AppTextField(
                        controller: _lastNameController,
                        label: t.app.last_name,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.app.required_field;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 16.h),

                      /// Email
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

                      /// Password
                      PasswordField(
                        controller: _passwordController,
                        label: t.app.password,
                        hint: '',
                        showStrengthMeter: true,
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

                      /// Confirm Password
                      PasswordField(
                        controller: _confirmPasswordController,
                        label: t.app.confirm_password,
                        hint: '',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return t.app.required_field;
                          }
                          if (value != _passwordController.text) {
                            return t.app.passwords_do_not_match;
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 8.h),

                      /// Password requirement text
                      Text(
                        t.app.password_requirements,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),

                      SizedBox(height: 30.h),

                      /// Register Button
                      PrimaryButton(
                        label: t.app.create_account,
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            // TODO: Implement register logic
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
