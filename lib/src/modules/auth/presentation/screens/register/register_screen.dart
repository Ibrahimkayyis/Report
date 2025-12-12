import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/painters/register_background_painter.dart';
import '../../cubits/register/register_cubit.dart';
import '../../cubits/register/register_state.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController =
      TextEditingController(); // Diganti dari First/Last
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _nikController = TextEditingController(); // NIK Controller

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _nikController.dispose();
    super.dispose();
  }

  void _onRegisterPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<RegisterCubit>().register(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        fullName: _fullNameController.text.trim(),
        phoneNumber: _phoneController.text.trim(),
        nik: _nikController.text.trim(),
        address: _addressController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => sl<RegisterCubit>(),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterFailure) {
            showCustomSnackbar(context, message: state.error, isError: true);
          } else if (state is RegisterSuccess) {
            _showSuccessDialog(context, t);
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
          body: Stack(
            children: [
              CustomPaint(
                painter: RegisterBackgroundPainter(),
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
                              const Center(child: LogoWidget()),
                              SizedBox(height: 20.h),
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
                              Center(
                                child: LinkText(
                                  leadingText: t.app.already_have_account,
                                  linkText: t.app.login,
                                  onTap: () =>
                                      context.router.push(const LoginRoute()),
                                ),
                              ),
                              SizedBox(height: 30.h),

                              /// Full Name
                              AppTextField(
                                controller: _fullNameController,
                                label:
                                    "Nama Lengkap", // Bisa pakai t.app.full_name nanti
                                hint: '',
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),

                              /// NIK
                              AppTextField(
                                controller: _nikController,
                                label: "NIK",
                                hint: '',
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  if (value.length != 16)
                                    return "NIK harus 16 digit";
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
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  if (!value.contains('@'))
                                    return t.app.invalid_email;
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),

                              /// Phone Number
                              AppTextField(
                                controller: _phoneController,
                                label: t.app.phone_number,
                                hint: '',
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  return null;
                                },
                              ),
                              SizedBox(height: 16.h),

                              /// Address
                              AppTextField(
                                controller: _addressController,
                                label: t.app.address,
                                hint: '',
                                maxLines: 2,
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
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
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  if (value.length < 8)
                                    return t.app.password_too_short;
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
                                  if (value == null || value.isEmpty)
                                    return t.app.required_field;
                                  if (value != _passwordController.text)
                                    return t.app.passwords_do_not_match;
                                  return null;
                                },
                              ),
                              SizedBox(height: 30.h),

                              /// Register Button
                              BlocBuilder<RegisterCubit, RegisterState>(
                                builder: (context, state) {
                                  final isLoading = state is RegisterLoading;
                                  return PrimaryButton(
                                    label: t.app.create_account,
                                    onPressed: isLoading
                                        ? null
                                        : () => _onRegisterPressed(context),
                                    isLoading: isLoading,
                                  );
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
            ],
          ),
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context, Translations t) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return SuccessDialog(
          message: t.app.register_success,
          buttonText: t.app.go_to_login,
          onButtonPressed: () {
            // ✅ Arahkan ke Login Route (Manual Login Flow)
            context.router.pop();
            context.router.replaceAll([const LoginRoute()]);
          },
        );
      },
    );
  }
}
