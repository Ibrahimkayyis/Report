import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/track_ticket/track_ticket_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/track_ticket/track_ticket_state.dart';

@RoutePage()
class CheckReportStatusScreen extends StatefulWidget {
  const CheckReportStatusScreen({super.key});

  @override
  State<CheckReportStatusScreen> createState() =>
      _CheckReportStatusScreenState();
}

class _CheckReportStatusScreenState extends State<CheckReportStatusScreen> {
  final _reportIdController = TextEditingController();

  @override
  void dispose() {
    _reportIdController.dispose();
    super.dispose();
  }

  void _onSearchPressed(BuildContext context) {
    final ticketCode = _reportIdController.text.trim();

    if (ticketCode.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(context.t.app.error_empty_fields)),
      );
      return;
    }

    // Panggil API Track Ticket via Cubit
    context.read<TrackTicketCubit>().trackTicket(ticketCode);
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) => sl<TrackTicketCubit>(),
      child: BlocListener<TrackTicketCubit, TrackTicketState>(
        listener: (context, state) {
          if (state is TrackTicketLoaded) {
            // ✅ SUKSES: Navigasi ke Result Screen dengan Data API
            context.router.push(
              CheckReportStatusResultRoute(
                ticketNumber: state.data.ticketCode,
                status: state.data.userStatus, 
                serviceType: state.data.requestType,
                opdDestination: state.data.opdName,
              ),
            );
            // Reset state agar saat kembali form bersih/siap pakai lagi
            context.read<TrackTicketCubit>().reset();
          } else if (state is TrackTicketError) {
            // ❌ ERROR: Tampilkan Dialog
            showDialog(
              context: context,
              builder: (_) => AppInfoDialog(
                icon: Icons.error_outline_rounded,
                iconColor: Colors.red,
                title: t.app.dialog.data_not_found_title, 
                message: state.message, 
                buttonText: t.app.dialog.ok,
                onPressed: () => Navigator.pop(context),
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppPrimaryBar(title: t.app.check_report_status_title),
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Container(
                width: double.infinity,
                // Mengurangi tinggi container karena field berkurang
                height: MediaQuery.of(context).size.height * 0.6, 
                decoration: BoxDecoration(
                  color: ColorName.white,
                  borderRadius: BorderRadius.circular(24.r),
                  boxShadow: [
                    BoxShadow(
                      color: ColorName.black.withValues(alpha: 0.05),
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

                        SizedBox(height: 40.h),

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
                        SizedBox(height: 8.h),

                        AppTextField(
                          controller: _reportIdController,
                          hint: t.app.report_id_hint, // "Masukkan ID Laporan"
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text,
                        ),

                        SizedBox(height: 40.h),

                        // 🔹 Search Button (with Loading State)
                        BlocBuilder<TrackTicketCubit, TrackTicketState>(
                          builder: (context, state) {
                            final isLoading = state is TrackTicketLoading;
                            
                            return SizedBox(
                              width: double.infinity,
                              height: 48.h,
                              child: ElevatedButton.icon(
                                onPressed: isLoading 
                                    ? null 
                                    : () => _onSearchPressed(context),
                                icon: isLoading 
                                    ? const SizedBox.shrink()
                                    : Icon(
                                        Icons.search,
                                        color: ColorName.background,
                                        size: 18.sp,
                                      ),
                                label: isLoading
                                    ? SizedBox(
                                        height: 20.h,
                                        width: 20.h,
                                        child: const CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
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
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}