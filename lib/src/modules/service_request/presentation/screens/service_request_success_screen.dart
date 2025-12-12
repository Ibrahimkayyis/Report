import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/download/download_service.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_response_model.dart';

@RoutePage()
class ServiceRequestSuccessScreen extends StatelessWidget {
  final ServiceRequestResponseModel data;

  const ServiceRequestSuccessScreen({
    super.key,
    required this.data,
  });

  Map<String, String> _buildDetailFields(Translations t) {
    final Map<String, String> fields = {
      t.app.ticket_title: data.title,
    };
    
    // Detail Pengajuan di Card
    if (data.location != null) fields['Lokasi'] = data.location!;
    
    return fields;
  }

  // ✅ Menggunakan innerContext dari Builder
  Future<void> _handleDownload(BuildContext context, Translations t) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.app.downloading_ticket)),
      );

      final filePath = await sl<DownloadService>().generatePdfTicket(
        data: data, 
        type: TicketType.pegawaiRequest,
      );

      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Tiket berhasil diunduh"),
            backgroundColor: Colors.green,
            action: SnackBarAction(
              label: "Buka",
              textColor: Colors.white,
              onPressed: () => OpenFile.open(filePath),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Gagal mengunduh: $e"), backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final detailFields = _buildDetailFields(t);

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

                    /// ✅ FIX: Bungkus SuccessCard dengan Builder
                    Builder(
                      builder: (innerContext) {
                        return SuccessCard(
                          ticketNumber: data.ticketCode,
                          status: "Menunggu Diproses", 
                          opdName: data.opdName,
                          
                          title: t.app.service_request_success_title,
                          description: t.app.service_request_success_description,
                          checkWithLabel: t.app.check_report_with,
                          ticketLabel: t.app.ticket_number,
                          statusLabel: t.app.status,
                          serviceTypeLabel: t.app.service_type,
                          serviceTypeValue: t.app.service_type_request, 
                          destinationLabel: t.app.request_type, 
                          downloadLabel: t.app.download_ticket,
                          
                          detailFields: detailFields,

                          // ✅ Gunakan innerContext di sini
                          onDownload: () => _handleDownload(innerContext, t),
                        );
                      }
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
                // context.router.push(const ServiceRequestSelectionRoute()); // Alur lama
                context.router.push( ServiceRequestFormRoute()); // Alur baru (Langsung Form)
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