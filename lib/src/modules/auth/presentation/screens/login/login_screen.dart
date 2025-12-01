import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/painters/login_background_painter.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/login/login_state.dart';

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

  void _onLoginPressed(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginCubit>().login(
            email: _emailController.text.trim(),
            password: _passwordController.text,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginFailure) {
            showCustomSnackbar(context, message: state.error, isError: true);
          } else if (state is LoginSuccess) {
            context.read<AuthCubit>().setAuthenticated(
                  state.token,
                  role: state.role,
                );

            if (!context.mounted) return;

            if (state.role == 'teknisi') {
              context.router.replaceAll([const MainLayoutTeknisiRoute()]);
            } else if (state.role == 'masyarakat') {
              context.router.replaceAll([const MainLayoutMasyarakatRoute()]);
            } else {
              context.router.replaceAll([const MainLayoutRoute()]);
            }
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
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
                              const Center(child: LogoWidget()),
                              SizedBox(height: 20.h),

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
                                showStrengthMeter: false,
                              ),

                              SizedBox(height: 8.h),

                              // Forgot Password Link
                              Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () => context.router.push(const ForgotPasswordRoute()),
                                  child: Text(
                                    t.app.forgot_password,
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: ColorName.primary,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 100.h),

                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  final isLoading = state is LoginLoading;
                                  return PrimaryButton(
                                    label: t.app.login,
                                    onPressed: isLoading
                                        ? null
                                        : () => _onLoginPressed(context),
                                    isLoading: isLoading,
                                  );
                                },
                              ),

                              SizedBox(height: 16.h),

                              // Don't have account (moved to bottom)
                              Center(
                                child: LinkText(
                                  leadingText: t.app.dont_have_account,
                                  linkText: t.app.register,
                                  onTap: () =>
                                      context.router.push(const RegisterRoute()),
                                ),
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
}