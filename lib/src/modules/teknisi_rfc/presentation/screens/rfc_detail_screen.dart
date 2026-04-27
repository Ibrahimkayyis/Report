import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/reporting/presentation/widgets/form_sections/reporting_text_field.dart';
import 'package:report/src/modules/teknisi_rfc/domain/models/rfc_model.dart';
import 'package:report/src/modules/teknisi_rfc/presentation/cubits/detail/rfc_detail_cubit.dart';

// ✅ Import Shimmer
import '../widgets/shimmer/rfc_detail_shimmer.dart';

@RoutePage()
class RFCDetailScreen extends StatefulWidget {
  final String localRfcId;
  final RfcType rfcType;

  const RFCDetailScreen({
    super.key,
    required this.localRfcId,
    required this.rfcType,
  });

  @override
  State<RFCDetailScreen> createState() => _RFCDetailScreenState();
}

class _RFCDetailScreenState extends State<RFCDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<RfcDetailCubit>()
        ..fetchDetail(widget.localRfcId, widget.rfcType),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(
          title: "Detail RFC",
          centerTitle: true,
        ),
        body: BlocBuilder<RfcDetailCubit, RfcDetailState>(
          builder: (context, state) {
            
            // ✅ GANTI LOADING STATE
            if (state is RfcDetailLoading) {
              return const RFCDetailShimmer();
            } 
            
            else if (state is RfcDetailError) {
              return Center(
                child: AppErrorState.general(
                  context: context,
                  message: state.message,
                  onRetry: () => context
                      .read<RfcDetailCubit>()
                      .fetchDetail(widget.localRfcId, widget.rfcType),
                ),
              );
            } 
            
            else if (state is RfcDetailLoaded) {
              final data = state.rfc;
              return _buildContent(context, data);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, RfcModel data) {
    final t = context.t.app.rfc;
    final String formattedBiaya = "Rp ${data.biayaEstimasi}";

    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Judul
          ReportingTextField(
            hint: t.submission_title_hint,
            label: t.submission_title,
            controller: TextEditingController(text: data.judulPerubahan),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          // 2. Nama Pemohon
          ReportingTextField(
            hint: t.applicant_name_hint,
            label: t.applicant_name,
            controller: TextEditingController(text: data.namaPemohon),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          // 3. OPD Asal
          ReportingTextField(
            hint: t.opd_origin_hint,
            label: t.opd_origin_label,
            controller: TextEditingController(text: data.opdPemohon),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          // 5. Data Asset
          ReportingTextField(
            hint: t.data_asset_hint,
            label: t.data_asset_hint,
            controller: TextEditingController(
                text: "${data.idAset} - ${data.kategoriAset}"),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          // 7. Asset Details
          ReportingTextField(
            hint: t.asset_category_hint,
            label: t.asset_category,
            controller: TextEditingController(text: data.kategoriAset),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          ReportingTextField(
            hint: t.description,
            label: "Deskripsi Aset",
            controller: TextEditingController(text: data.deskripsiAset),
            readOnly: true,
            maxLines: 3,
          ),
          SizedBox(height: 20.h),

          // 9. Estimasi Biaya
          ReportingTextField(
            hint: t.cost_estimate_hint,
            label: t.cost_estimate_hint,
            controller: TextEditingController(text: formattedBiaya),
            readOnly: true,
          ),
          SizedBox(height: 20.h),

          // 10. Deskripsi Perubahan
          ReportingTextField(
            hint: t.description,
            label: t.change_reason,
            controller: TextEditingController(text: data.alasanPerubahan),
            readOnly: true,
            maxLines: 5,
          ),
          SizedBox(height: 20.h),

          ReportingTextField(
            hint: t.change_impact_hint,
            label: t.change_impact,
            controller: TextEditingController(text: data.dampakPerubahan),
            readOnly: true,
            maxLines: 5,
          ),
          SizedBox(height: 20.h),

          ReportingTextField(
            hint: t.no_change_impact_hint,
            label: t.no_change_impact,
            controller: TextEditingController(text: data.dampakJikaTidak),
            readOnly: true,
            maxLines: 5,
          ),
          SizedBox(height: 24.h),

          // Status Section
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue.shade700),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Status Pengajuan:",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.blue.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        // Prioritas status display
                        data.ticketStatus ?? data.statusTrace ?? 'Menunggu Review',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}