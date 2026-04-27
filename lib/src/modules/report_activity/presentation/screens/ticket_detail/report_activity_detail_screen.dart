import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_state.dart';

// ✅ Import Shimmer
import '../../widgets/shimmer/report_detail_shimmer.dart';

@RoutePage()
class ReportActivityDetailScreen extends StatefulWidget {
  final String ticketId;

  const ReportActivityDetailScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<ReportActivityDetailScreen> createState() =>
      _ReportActivityDetailScreenState();
}

class _ReportActivityDetailScreenState extends State<ReportActivityDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
        BlocProvider(
          create: (_) => sl<TicketDetailCubit>()
            ..fetchTicketDetail(widget.ticketId),
        ),
      ],
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppSecondaryBar(title: t.report_detail_title),
        body: BlocBuilder<TicketDetailCubit, TicketDetailState>(
          builder: (context, state) {
            
            // ✅ GANTI LOADING STATE DI SINI
            if (state is TicketDetailLoading) {
              return const ReportDetailShimmer();
            } 
            
            else if (state is TicketDetailError) {
              return AppErrorState.general(
                context: context,
                message: state.message,
                onRetry: () {
                  context
                      .read<TicketDetailCubit>()
                      .fetchTicketDetail(widget.ticketId);
                },
              );
            } else if (state is TicketDetailLoaded) {
              final ticket = state.ticket;
              final asset = ticket.asset;
              final creator = ticket.creator;

              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // ============================
                          // HEADER INFO
                          // ============================
                          _buildHeaderInfo(
                            fullName: creator?.fullName ?? 'Unknown',
                            profileUrl: creator?.profile,
                            ticketCode: ticket.ticketCode,
                          ),
                          SizedBox(height: 24.h),

                          // Report Title
                          _buildReadOnlyField(
                            label: t.reported_title_label,
                            value: ticket.title,
                          ),
                          SizedBox(height: 20.h),

                          // Data Asset
                          _buildReadOnlyField(
                            label: t.reported_asset_label,
                            value: asset?.namaAsset ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Serial Number
                          _buildReadOnlyField(
                            label: t.reported_serial_number_label,
                            value: asset?.nomorSeri ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Asset Category
                          _buildReadOnlyField(
                            label: t.reported_asset_category_label,
                            value: asset?.kategori ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Asset Subcategory
                          _buildReadOnlyField(
                            label: t.reported_asset_subcategory_label,
                            value: asset?.subkategoriNama ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Asset Type
                          _buildReadOnlyField(
                            label: t.reported_asset_type_label,
                            value: asset?.jenisAsset ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Location
                          _buildReadOnlyField(
                            label: t.reported_location_label,
                            value: ticket.lokasiKejadian ?? '-',
                          ),
                          SizedBox(height: 20.h),

                          // Problem Description
                          _buildReadOnlyTextField(
                            label: t.reported_problem_label,
                            value: ticket.description,
                            minLines: 3,
                          ),
                          SizedBox(height: 20.h),

                          // Attachments
                          _buildAttachmentsSection(ticket.files),
                          SizedBox(height: 20.h),

                          // Expected Solution
                          _buildReadOnlyTextField(
                            label: t.reported_expected_solution_label,
                            value: ticket.expectedResolution ?? '-',
                            minLines: 3,
                          ),
                          SizedBox(height: 24.h),
                        ],
                      ),
                    ),
                  ),

                  // Back Button
                  _buildBackButton(context),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  // ============================
  // HEADER INFO
  // ============================
  Widget _buildHeaderInfo({
    required String fullName,
    String? profileUrl,
    required String ticketCode,
  }) {
    return Column(
      children: [
        // ROW 1: Pelapor
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "Pelapor",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorName.textPrimary,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundColor: ColorName.primary.withOpacity(0.1),
                    backgroundImage:
                        profileUrl != null ? NetworkImage(profileUrl) : null,
                    child: profileUrl == null
                        ? Icon(Icons.person,
                            size: 24.sp, color: ColorName.primary)
                        : null,
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Text(
                      fullName,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorName.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // ROW 2: ID Ticket (SUDAH SERAGAM)
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                "ID Tiket",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: ColorName.textPrimary,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Text(
                  ticketCode,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.textPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  // ============================
  // READ ONLY FIELD
  // ============================
  Widget _buildReadOnlyField({
    required String label,
    required String value,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  // ============================
  // READ ONLY TEXT FIELD (MULTILINE)
  // ============================
  Widget _buildReadOnlyTextField({
    required String label,
    required String value,
    int minLines = 1,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          constraints: BoxConstraints(minHeight: (minLines * 20).h),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // ============================
  // ATTACHMENTS SECTION
  // ============================
  Widget _buildAttachmentsSection(List<String> fileUrls) {
    final t = context.t.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.reported_attachments_label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),

        if (fileUrls.isEmpty)
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              t.no_attachments,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade500,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        else
          Column(
            children: fileUrls.map((url) {
              final filename = url.split('/').last;

              return Container(
                margin: EdgeInsets.only(bottom: 8.h),
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: ColorName.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: Icon(
                        _getFileIcon(filename),
                        color: ColorName.primary,
                        size: 20.sp,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        filename,
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: ColorName.textPrimary,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Download/View file
                      },
                      icon: Icon(
                        Icons.download_rounded,
                        color: ColorName.primary,
                        size: 20.sp,
                      ),
                      padding: EdgeInsets.all(8.w),
                      constraints: const BoxConstraints(),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
      ],
    );
  }

  IconData _getFileIcon(String filename) {
    final ext = filename.split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'jpg':
      case 'jpeg':
      case 'png':
        return Icons.image;
      case 'doc':
      case 'docx':
        return Icons.description;
      default:
        return Icons.insert_drive_file;
    }
  }

  // ============================
  // BACK BUTTON
  // ============================
  Widget _buildBackButton(BuildContext context) {
    final t = context.t.app;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () => context.router.maybePop(),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            side: const BorderSide(color: ColorName.primary),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            t.back_button,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.primary,
            ),
          ),
        ),
      ),
    );
  }
}