import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Selected: ${service.title}'),
                duration: const Duration(seconds: 1),
              ),
            );
          },
        );
      },
    );
  }
}
