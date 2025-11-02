// lib/src/modules/reporting/presentation/screens/opd_selection_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';
import 'package:shimmer/shimmer.dart';

part '../widgets/opd_selection/opd_card.dart';
part '../widgets/opd_selection/opd_item.dart';

@RoutePage()
class OpdSelectionScreen extends StatelessWidget {
  const OpdSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => sl<OpdCubit>()..fetchOpdList(),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: t.app.online_reporting_title),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionTitle(title: t.app.select_opd_subtitle),
              SizedBox(height: 16.h),

              Expanded(
                child: BlocBuilder<OpdCubit, OpdState>(
                  builder: (context, state) {
                    if (state is OpdLoading) {
                      // 🌟 Tampilan shimmer saat loading
                      return ListView.builder(
                        itemCount: 20, // jumlah shimmer dummy
                        itemBuilder: (_, __) => const OpdShimmerCard(),
                      );
                    } else if (state is OpdLoaded) {
                      final opdList = state.opdList;

                      if (opdList.isEmpty) {
                        return Center(
                          child: Text(
                            t.app.no_data_available,
                            style: TextStyle(
                              color: ColorName.textPrimary,
                              fontSize: 14.sp,
                            ),
                          ),
                        );
                      }

                      return ListView.builder(
                        itemCount: opdList.length,
                        itemBuilder: (context, index) {
                          final opd = opdList[index];

                          // Icon dan warna dinamis, card tetap ColorName.primary
                          final icon = _iconByIndex(index);
                          final iconColor = _colorByIndex(index);

                          return OpdCard(
                            opd: OpdItem(
                              icon: icon,
                              name: opd.opdName,
                              color: iconColor,
                            ),
                            onTap: () => context.router.push(
                              ReportingFormRoute(
                                opdId: opd.opdId,
                                opdName: opd.opdName,
                                opdIcon: icon,
                                opdColor: iconColor,
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is OpdError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(color: Colors.red, fontSize: 14.sp),
                        ),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🎨 Warna untuk icon (beragam)
  Color _colorByIndex(int index) {
    final colors = [
      Colors.blue.shade700,
      Colors.red.shade600,
      Colors.pink.shade600,
      Colors.indigo.shade700,
      Colors.orange.shade700,
      Colors.green.shade600,
      Colors.teal.shade700,
      Colors.cyan.shade700,
      Colors.blue.shade800,
      Colors.amber.shade800,
      Colors.brown.shade600,
      Colors.deepPurple.shade700,
      Colors.red.shade700,
      Colors.deepOrange.shade700,
      Colors.grey.shade700,
      Colors.orange.shade800,
      Colors.lightGreen.shade700,
      Colors.purple.shade700,
    ];
    return colors[index % colors.length];
  }

  // 🧩 Icon dinamis agar tampil menarik
  IconData _iconByIndex(int index) {
    const icons = [
      Icons.school,
      Icons.library_books,
      Icons.local_hospital,
      Icons.devices,
      Icons.directions_bus,
      Icons.eco,
      Icons.diversity_3,
      Icons.badge,
      Icons.water_drop,
      Icons.business_center,
      Icons.home_work,
      Icons.account_balance,
      Icons.fire_truck,
      Icons.museum,
      Icons.factory,
      Icons.shield,
      Icons.agriculture,
      Icons.people,
    ];
    return icons[index % icons.length];
  }
}
