import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class CheckReportStatusScreen extends StatefulWidget {
  const CheckReportStatusScreen({super.key});

  @override
  State<CheckReportStatusScreen> createState() =>
      _CheckReportStatusScreenState();
}

class _CheckReportStatusScreenState extends State<CheckReportStatusScreen> {
  final _reportIdController = TextEditingController();
  final _pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppPrimaryBar(title: t.app.check_report_status_title),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 120.h,
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(24.r),
              boxShadow: [
                BoxShadow(
                  color: ColorName.black.withValues(alpha:0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔹 Title
                    Text(
                      t.app.check_report_status_title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorName.primary,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // 🔹 Subtitle
                    Text(
                      t.app.check_report_status_subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 32.h),

                    // 🔹 ID Laporan
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        t.app.report_id_label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.textPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),

                    AppTextField(
                      controller: _reportIdController,
                      hint: t.app.report_id_hint,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                    ),

                    SizedBox(height: 16.h),

                    // 🔹 PIN Field (pakai PasswordField global)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        t.app.pin_label,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorName.textPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),

                    PasswordField(
                      controller: _pinController,
                      hint: t.app.pin_hint,
                      showStrengthMeter: false,
                    ),

                    SizedBox(height: 32.h),

                    // 🔹 Search Button
                    SizedBox(
                      width: double.infinity,
                      height: 48.h,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          final reportId = _reportIdController.text.trim();
                          final pin = _pinController.text.trim();

                          if (reportId.isEmpty || pin.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(t.app.error_empty_fields)),
                            );
                            return;
                          }

                          // 🔹 Simulasi hasil pengecekan laporan
                          final bool dataFound = true; // sementara dummy

                          if (!dataFound) {
                            showDialog(
                              context: context,
                              builder: (context) => AppInfoDialog(
                                icon: Icons.info_outline_rounded,
                                iconColor: ColorName.primary,
                                title: t.app.dialog.data_not_found_title,
                                message: t.app.dialog.data_not_found_message,
                                buttonText: t.app.dialog.ok,
                                onPressed: () => Navigator.pop(context),
                              ),
                            );
                          } else {
                            // 🔹 Navigasi ke hasil laporan (dummy data)
                            context.router.push(
                              CheckReportStatusResultRoute(
                                ticketNumber: "LPR318728",
                                status: "Pending",
                                serviceType: t.app.service_device_request,
                                opdDestination:
                                    t.app.opd_dinas_pendidikan,
                              ),
                            );
                          }
                        },
                        icon: Icon(
                          Icons.search,
                          color: ColorName.background,
                          size: 18.sp,
                        ),
                        label: Text(
                          t.app.search_button,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.background,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.r),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
