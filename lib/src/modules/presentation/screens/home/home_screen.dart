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

import 'widgets/home_header.dart';
import 'widgets/home_main_cards.dart';
import 'widgets/home_services_section.dart';
import 'widgets/home_report_history.dart';

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
        body: SafeArea(
          child: Column(
            children: [
              const HomeHeader(),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(16.w),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeMainCards(),
                      SizedBox(height: 24),
                      HomeServicesSection(),
                      SizedBox(height: 24),
                      HomeReportHistory(),
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
