import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart'; // ✅ Import SL
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_header.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_services_section.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_report_history.dart';
// ✅ Import ReportActivityCubit
import 'package:report/src/modules/report_activity/presentation/cubits/report_activity_cubit.dart';
import '../widgets/home_masyarakat_cards.dart';

@RoutePage()
class HomeMasyarakatScreen extends StatelessWidget {
  const HomeMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ 1. Bungkus dengan MultiBlocProvider
    return MultiBlocProvider(
      providers: [
        // Auth Cubit (Logic Login/Logout)
        BlocProvider.value(value: context.read<AuthCubit>()),
        
        // ✅ ReportActivityCubit (Untuk data history laporan)
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
        // ✅ 2. Tambahkan Builder agar context child bisa melihat Provider
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: ColorName.background,
              body: SafeArea(
                child: Column(
                  children: [
                    const HomeHeader(),
                    Expanded(
                      // ✅ 3. Tambahkan RefreshIndicator agar user bisa refresh data
                      child: RefreshIndicator(
                        onRefresh: () async {
                          await context.read<ReportActivityCubit>().getActivities();
                        },
                        child: SingleChildScrollView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          padding: EdgeInsets.all(16.w),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              HomeMasyarakatCards(),
                              SizedBox(height: 24),
                              HomeServicesSection(),
                              SizedBox(height: 24),
                              // Widget ini sekarang sudah aman karena Cubit sudah diprovide di atas
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