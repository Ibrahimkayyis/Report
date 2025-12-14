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
import 'package:report/src/modules/masyarakat_reporting/domain/models/masyarakat_report_response_model.dart';
import 'package:report/src/modules/reporting/domain/models/report_response_model.dart';

@RoutePage()
class ReportSuccessScreen extends StatelessWidget {
  final dynamic data;

  const ReportSuccessScreen({
    super.key,
    required this.data,
  });

  bool get _isMasyarakat => data is MasyarakatReportResponseModel;

  Map<String, String> _extractData() {
    if (_isMasyarakat) {
      final d = data as MasyarakatReportResponseModel;
      return {
        'ticketNumber': d.ticketCode,
        'status': d.userStatus,
        'opdName': d.opdName,
      };
    } else {
      final d = data as ReportResponseModel;
      return {
        'ticketNumber': d.ticketCode,
        'status': d.statusTicketPengguna,
        'opdName': d.opdName,
      };
    }
  }

  Map<String, String> _buildDetailFields(Translations t) {
    final Map<String, String> fields = {};
    if (_isMasyarakat) {
      final d = data as MasyarakatReportResponseModel;
      fields[t.app.ticket_title] = d.title;
      fields[t.app.ticket_description] = d.description;
      fields['Ditujukan ke OPD'] = d.opdName;
    } else {
      final d = data as ReportResponseModel;
      fields[t.app.ticket_title] = d.title;
      if (d.namaAsset != null) fields['Aset'] = d.namaAsset!;
      if (d.lokasiKejadian.isNotEmpty) fields['Lokasi'] = d.lokasiKejadian;
    }
    return fields;
  }

  Future<void> _handleDownload(BuildContext context, Translations t) async {
    try {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t.app.downloading_ticket)),
      );

      final type = _isMasyarakat
          ? TicketType.masyarakatReporting
          : TicketType.pegawaiReporting;

      final filePath = await sl<DownloadService>().generatePdfTicket(
        data: data,
        type: type,
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
          SnackBar(
              content: Text("Gagal mengunduh tiket: $e"),
              backgroundColor: Colors.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final extracted = _extractData();
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
                    Builder(builder: (innerContext) {
                      return SuccessCard(
                        ticketNumber: extracted['ticketNumber']!,
                        status: extracted['status']!,
                        opdName: extracted['opdName']!,
                        title: t.app.report_success_title,
                        description: t.app.report_success_description,
                        checkWithLabel: t.app.check_report_with,
                        ticketLabel: t.app.ticket_number,
                        statusLabel: t.app.status,
                        serviceTypeLabel: t.app.service_type,
                        serviceTypeValue: t.app.service_type_reporting,
                        destinationLabel: t.app.destination_opd,
                        downloadLabel: t.app.download_ticket,
                        detailFields: detailFields,
                        onDownload: () => _handleDownload(innerContext, t),
                      );
                    }),
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

                if (_isMasyarakat) {
                  context.router.push(const OpdSelectionRoute());
                } else {
                  // ✅ HAPUS const karena sekarang ada parameter optional (AssetModel)
                  context.router.push(ReportingFormRoute());
                }
              },
              secondaryRightLabel: t.app.back_to_home,
              onSecondaryRightPressed: () {
                if (_isMasyarakat) {
                  // ✅ HAPUS const
                  context.router.replaceAll([
                    MainLayoutMasyarakatRoute()
                    // MainLayoutMasyarakatRoute(initialIndex: 0)
                  ]);
                } else {
                  // ✅ HAPUS const dan set initialIndex: 0
                  context.router.replaceAll([
                    MainLayoutRoute(initialIndex: 0)
                  ]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}