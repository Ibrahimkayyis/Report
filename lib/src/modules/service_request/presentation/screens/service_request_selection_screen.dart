import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import '../widgets/service_request_list.dart';

@RoutePage()
class ServiceRequestSelectionScreen extends StatelessWidget {
  const ServiceRequestSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.app.service_request_title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16).w,
            child: AppSectionTitle(title: t.app.service_request_select_subtitle),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: ServiceRequestList(),
            ),
          ),
        ],
      ),
    );
  }
}
