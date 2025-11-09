import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/app_bar/app_secondary_bar.dart';
import '../widgets/activity_header.dart';
import '../widgets/activity_item.dart';

@RoutePage()
class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.report_activity;

    // 📋 Dummy list sementara (nanti akan diambil dari Cubit)
    final activities = [
      {
        'id': '#TK-1209',
        'title': 'Network issue at Building A',
        'type': t.type_incident,
        'status': t.filter_in_progress,
        'time': '2h ago',
      },
      {
        'id': '#SR-4321',
        'title': 'Request new printer installation',
        'type': t.type_service_request,
        'status': t.filter_open,
        'time': '4h ago',
      },
      {
        'id': '#TK-4210',
        'title': 'Email access issue resolved',
        'type': t.type_incident,
        'status': t.filter_resolved,
        'time': '1d ago',
      },
      {
        'id': '#SR-4018',
        'title': 'Account password reset completed',
        'type': t.type_service_request,
        'status': t.filter_closed,
        'time': '2d ago',
      },
    ];

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppSecondaryBar(title: t.title),
      body: SafeArea(
        child: Column(
          children: [
            /// 🔍 Header (search + filter dropdown)
            ActivityHeader(),

            Divider(height: 1.h, color: ColorName.black.withValues(alpha:0.1)),

            /// 📋 Activity List
            Expanded(
              child: activities.isEmpty
                  ? Center(
                      child: Text(
                        t.no_reports,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14.sp,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.only(top: 8.h, bottom: 16.h),
                      itemCount: activities.length,
                      separatorBuilder: (_, __) => SizedBox(height: 6.h),
                      itemBuilder: (context, index) {
                        final a = activities[index];
                        return ActivityItem(
                          id: a['id'] as String,
                          title: a['title'] as String,
                          type: a['type'] as String,
                          status: a['status'] as String,
                          time: a['time'] as String,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
