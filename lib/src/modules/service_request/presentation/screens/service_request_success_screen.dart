import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/gen/colors.gen.dart';

@RoutePage()
class ServiceRequestSuccessScreen extends StatelessWidget {
  final String ticketNumber;
  final String pin;
  final String requestType;

  const ServiceRequestSuccessScreen({
    super.key,
    required this.ticketNumber,
    required this.pin,
    required this.requestType,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  children: [
                    SizedBox(height: 20.h),

                    /// ✅ Success Card
                    SuccessCard(
                      ticketNumber: ticketNumber,
                      pin: pin,
                      opdName: requestType,

                      // 🌐 translation-based texts
                      title: t.app.service_request_success_title,
                      description: t.app.service_request_success_description,
                      checkWithLabel: t.app.check_report_with,
                      ticketLabel: t.app.ticket_number,
                      pinLabel: t.app.pin,
                      serviceTypeLabel: t.app.service_type,
                      serviceTypeValue: t.app.service_type_request, // "Pengajuan layanan"
                      destinationLabel: t.app.request_type, // "Jenis Permohonan"
                      downloadLabel: t.app.download_ticket,

                      // optional download action
                      onDownload: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(t.app.downloading_ticket)),
                        );
                      },
                    ),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),

            /// ✅ Bottom Actions
            AppBottomActions(
              primaryLabel: t.app.check_service_status,
              onPrimaryPressed: () {
                context.router.push(const CheckReportStatusRoute());
              },
              secondaryLeftLabel: t.app.create_new_request,
              onSecondaryLeftPressed: () {
                context.router.popUntilRoot();
                context.router.push(const ServiceRequestSelectionRoute());
              },
              secondaryRightLabel: t.app.back_to_home,
              onSecondaryRightPressed: () {
                context.router.replaceAll([const MainLayoutRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
