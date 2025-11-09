import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
// import 'package:report/src/modules/service_request/domain/models/service_type.dart';
import 'service_request_card.dart';
import 'service_item.dart';

class ServiceRequestList extends StatelessWidget {
  const ServiceRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final List<ServiceItem> services = [
      ServiceItem(
        asset: Assets.icons.resetPassword,
        title: t.app.service_reset_password,
      ),
      ServiceItem(
        asset: Assets.icons.systemAccess,
        title: t.app.service_system_access,
      ),
      ServiceItem(
        asset: Assets.icons.deviceRequest,
        title: t.app.service_device_request,
      ),
    ];

    return ListView.separated(
      itemCount: services.length,
      separatorBuilder: (_, _) => SizedBox(height: 16.h),
      itemBuilder: (context, index) {
        final service = services[index];
        return ServiceRequestCard(
          service: service,
          onTap: () {
            // final serviceType = switch (service.title) {
            //   String title when title.contains(t.app.service_reset_password) =>
            //     ServiceType.resetPassword,
            //   String title when title.contains(t.app.service_system_access) =>
            //     ServiceType.systemAccess,
            //   String title when title.contains(t.app.service_device_request) =>
            //     ServiceType.deviceRequest,
            //   _ => ServiceType.resetPassword,
            // };

            context.router.push(
              ServiceRequestFormRoute(
                opdId: 'OPD-001',
                opdName: 'Dinas Komunikasi dan Informatika',
                 opdIconUrl:
                    'https://cdn-icons-png.flaticon.com/512/919/919826.png',
                opdColor: Colors.blue,
              ),
            );
          },
        );
      },
    );
  }
}
