import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
// import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class ReportSuccessScreen extends StatelessWidget {
  final String ticketNumber;
  final String status;
  final String opdName;

  const ReportSuccessScreen({
    super.key,
    required this.ticketNumber,
    required this.status,
    required this.opdName,
  });

  @override
  Widget build(BuildContext context) {
    // final t = context.t;

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
                    SuccessCard(
                      ticketNumber: ticketNumber,
                      status: status,
                      opdName: opdName,
                      title: t.app.report_success_title,
                      description: t.app.report_success_description,
                      checkWithLabel: t.app.check_report_with,
                      ticketLabel: t.app.ticket_number,
                      statusLabel: t.app.status,
                      serviceTypeLabel: t.app.service_type,
                      serviceTypeValue: t.app.service_type_reporting,
                      destinationLabel: t.app.destination_opd,
                      downloadLabel: t.app.download_ticket,
                      onDownload: () {
                        // TODO: implement download
                      },
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            AppBottomActions(
              primaryLabel: t.app.check_service_status,
              onPrimaryPressed: () {
                context.router.push(const CheckReportStatusRoute());
              },
              secondaryLeftLabel: t.app.create_new_report,
              onSecondaryLeftPressed: () {
                context.router.popUntilRoot();
                context.router.push(const OpdSelectionRoute());
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
