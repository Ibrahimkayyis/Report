import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'widgets/success_card.dart';
import 'widgets/bottom_actions.dart';

@RoutePage()
class ReportSuccessScreen extends StatelessWidget {
  final String ticketNumber;
  final String pin;
  final String opdName;

  const ReportSuccessScreen({
    super.key,
    required this.ticketNumber,
    required this.pin,
    required this.opdName,
  });

  @override
  Widget build(BuildContext context) {
    // final t = context.t;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
                      pin: pin,
                      opdName: opdName,
                    ),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            ReportSuccessBottomActions(
              onCheckStatus: () {
                // TODO: Navigate to check status
              },
              onCreateNewReport: () {
                // TODO: Navigate to create new report
              },
              onBackToHome: () {
                context.router.replaceAll([const MainLayoutRoute()]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
