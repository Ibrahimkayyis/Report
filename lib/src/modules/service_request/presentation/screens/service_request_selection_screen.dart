// lib/src/modules/service_request/presentation/screens/service_request_selection_screen.dart

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
import 'package:report/src/modules/reporting/presentation/screens/opd_selection_screen.dart';


@RoutePage()
class ServiceRequestSelectionScreen extends StatefulWidget {
  const ServiceRequestSelectionScreen({super.key});

  @override
  State<ServiceRequestSelectionScreen> createState() =>
      _ServiceRequestSelectionScreenState();
}

class _ServiceRequestSelectionScreenState
    extends State<ServiceRequestSelectionScreen> {
  final TextEditingController _searchController = TextEditingController();
  List _filteredList = [];
  List _originalList = [];

  void _filterOpd(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredList = List.from(_originalList);
      } else {
        _filteredList = _originalList
            .where((opd) =>
                opd.opdName.toLowerCase().contains(query.toLowerCase()))
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
        appBar: AppPrimaryBar(title: t.app.service_request_title),
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

              /// 🔹 Daftar OPD (digunakan kembali untuk Service Request)
              Expanded(
                child: BlocBuilder<OpdCubit, OpdState>(
                  builder: (context, state) {
                    if (state is OpdLoading) {
                      return ListView.builder(
                        itemCount: 8,
                        itemBuilder: (_, __) => const OpdShimmerCard(),
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
                            onTap: () => context.router.push(
                              ServiceRequestFormRoute(
                                opdId: opd.opdId,
                                opdName: opd.opdName,
                                opdColor: ColorName.primary,
                                opdIconUrl: opd.filePath,
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
}
