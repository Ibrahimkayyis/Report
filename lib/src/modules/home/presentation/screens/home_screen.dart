import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_cubit.dart';

import '../widgets/home_user/home_header.dart';
import '../widgets/home_user/home_main_cards.dart';
import '../widgets/home_user/home_services_section.dart';
import '../widgets/home_user/home_report_history.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: context.read<AuthCubit>()),
        BlocProvider(
          create: (_) => sl<ReportActivityCubit>()..getActivities(),
        ),
      ],
      child: BlocListener<AuthCubit, AuthState>(
        listenWhen: (prev, curr) => curr is AuthUnauthenticated,
        listener: (context, state) {
          if (state is AuthUnauthenticated) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (context.mounted) {
                context.router.replaceAll([const LoginRoute()]);
              }
            });
          }
        },
        // ✅ SOLUSI: Tambahkan Builder di sini
        child: Builder(
          builder: (context) {
            // 'context' di sini sekarang adalah child dari MultiBlocProvider
            // Jadi dia bisa melihat ReportActivityCubit
            return Scaffold(
              backgroundColor: ColorName.background,
              body: SafeArea(
                child: Column(
                  children: [
                    const HomeHeader(),
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          // ✅ Sekarang aman, tidak akan error ProviderNotFound
                          await context.read<ReportActivityCubit>().getActivities();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
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
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}