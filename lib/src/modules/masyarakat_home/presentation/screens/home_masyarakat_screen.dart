import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_header.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_services_section.dart';
import 'package:report/src/modules/home/presentation/widgets/home_user/home_report_history.dart';
import '../widgets/home_masyarakat_cards.dart';

@RoutePage()
class HomeMasyarakatScreen extends StatelessWidget {
  const HomeMasyarakatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
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
                      HomeMasyarakatCards(),
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
