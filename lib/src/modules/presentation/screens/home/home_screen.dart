import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/modules/presentation/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocListener<AuthCubit, AuthState>(
      listenWhen: (prev, curr) => curr is AuthUnauthenticated,
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted) {
              showCustomSnackbar(
                context,
                message: t.app.logged_out,
                isError: false,
              );
              context.router.replaceAll([const LoginRoute()]);
            }
          });
        }
      },
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppBar(
          title: Text(t.app.home),
          backgroundColor: ColorName.primary,
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                final shouldLogout = await showDialog<bool>(
                  context: context,
                  builder: (dialogContext) => AlertDialog(
                    title: Text(t.app.logout_confirmation),
                    content: Text(t.app.logout_message),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(false),
                        child: Text(t.app.cancel),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(dialogContext).pop(true),
                        child: Text(t.app.logout),
                      ),
                    ],
                  ),
                );

                if (shouldLogout == true && context.mounted) {
                  await context.read<AuthCubit>().logout();
                }
              },
            ),
          ],
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, color: ColorName.primary, size: 64.sp),
                SizedBox(height: 16.h),
                Text(
                  t.app.welcome,
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorName.textPrimary,
                  ),
                ),
                SizedBox(height: 8.h),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthAuthenticated) {
                      return Text(
                        'Role: ${state.role}',
                        style: TextStyle(fontSize: 14.sp),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


