import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/opd_state.dart';
import 'package:shimmer/shimmer.dart';

part '../widgets/opd_selection/opd_card.dart';
part '../widgets/opd_selection/opd_item.dart';

@RoutePage()
class OpdSelectionScreen extends StatefulWidget {
  const OpdSelectionScreen({super.key});

  @override
  State<OpdSelectionScreen> createState() => _OpdSelectionScreenState();
}

class _OpdSelectionScreenState extends State<OpdSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();
  List _filteredList = [];
  List _originalList = [];

  void _filterOpd(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredList = List.from(_originalList);
      } else {
        _filteredList = _originalList
            .where(
              (opd) => opd.opdName.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      }
    });
  }

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppSectionTitle(title: t.app.select_opd_subtitle),
              SizedBox(height: 12.h),

              /// 🔍 Search bar
              AppSearchField(
                controller: _searchController,
                hintText: t.app.search_opd_hint,
                onChanged: _filterOpd,
              ),
              SizedBox(height: 16.h),

              /// 🔹 Daftar OPD
              Expanded(
                child: BlocBuilder<OpdCubit, OpdState>(
                  builder: (context, state) {
                    if (state is OpdLoading) {
                      return ListView.builder(
                        itemCount: 8,
                        itemBuilder: (_, _) => const OpdShimmerCard(),
                      );
                    } else if (state is OpdLoaded) {
                      _originalList = state.opdList;
                      if (_filteredList.isEmpty &&
                          _searchController.text.isEmpty) {
                        _filteredList = List.from(_originalList);
                      }

                      if (_filteredList.isEmpty) {
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
                        itemCount: _filteredList.length,
                        itemBuilder: (context, index) {
                          final opd = _filteredList[index];

                          final opdItem = OpdItem(
                            name: opd.opdName,
                            color: ColorName.primary,
                            iconUrl: opd.filePath,
                          );

                          return OpdCard(
                            opd: opdItem,
                            onTap: () {
                              final authState = context.read<AuthCubit>().state;

                              // Default fallback jika auth belum ter-load
                              String role = 'masyarakat';

                              if (authState is AuthAuthenticated) {
                                role = authState.role.toLowerCase();
                              }

                              // 🔥 Routing berdasarkan role
                              if (role == 'masyarakat') {
                                context.router.push(
                                  // ==== TUJUAN MASYARAKAT ====
                                  MasyarakatReportingFormRoute(
                                    opdId: opd.opdId,
                                    opdName: opd.opdName,
                                    opdColor: ColorName.primary,
                                    opdIconUrl: opd.filePath,
                                  ),
                                );
                              } else {
                                context.router.push(
                                  // ==== TUJUAN PEGAWAI ====
                                  ReportingFormRoute(
                                    opdId: opd.opdId,
                                    opdName: opd.opdName,
                                    opdColor: ColorName.primary,
                                    opdIconUrl: opd.filePath,
                                  ),
                                );
                              }
                            },
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
}
