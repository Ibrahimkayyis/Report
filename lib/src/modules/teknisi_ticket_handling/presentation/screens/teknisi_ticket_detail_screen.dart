import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/teknisi_ticket_handling/domain/models/teknisi_ticket_detail_model.dart';
import 'package:report/src/modules/teknisi_ticket_handling/presentation/cubits/teknisi_ticket_detail_cubit.dart';
import 'package:report/src/modules/teknisi_ticket_handling/presentation/cubits/teknisi_ticket_detail_state.dart';

@RoutePage()
class TeknisiTicketDetailScreen extends StatefulWidget {
  final String ticketId;

  const TeknisiTicketDetailScreen({super.key, required this.ticketId});

  @override
  State<TeknisiTicketDetailScreen> createState() =>
      _TeknisiTicketDetailScreenState();
}

class _TeknisiTicketDetailScreenState extends State<TeknisiTicketDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider(
      create: (_) =>
          sl<TeknisiTicketDetailCubit>()..fetchDetail(widget.ticketId),
      child: BlocListener<TeknisiTicketDetailCubit, TeknisiTicketDetailState>(
        listener: (context, state) {
          if (state.status == TeknisiTicketDetailStatus.updateSuccess) {
            // Tampilkan Pesan Sukses Singkat
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.successMessage ?? "Update berhasil"),
                backgroundColor: Colors.green,
                duration: const Duration(seconds: 1),
              ),
            );

            // ✅ FIX: Langsung kembali ke halaman sebelumnya dengan hasil 'true'
            // Ini akan mentrigger refresh di halaman list
            context.router.pop(true);
          } else if (state.status == TeknisiTicketDetailStatus.failure &&
              state.errorMessage != null) {
            String displayMessage = state.errorMessage!;

            if (state.errorMessage!.contains("403")) {
              displayMessage =
                  "Anda tidak memiliki izin untuk memproses tiket ini.";
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(displayMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
          appBar: AppPrimaryBar(title: t.app.ticket_detail_title),
          body: BlocBuilder<TeknisiTicketDetailCubit, TeknisiTicketDetailState>(
            builder: (context, state) {
              if (state.status == TeknisiTicketDetailStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == TeknisiTicketDetailStatus.failure &&
                  state.ticket == null) {
                return AppErrorState.general(
                  context: context,
                  message: state.errorMessage ?? "Gagal memuat data",
                  onRetry: () => context
                      .read<TeknisiTicketDetailCubit>()
                      .fetchDetail(widget.ticketId),
                );
              }

              if (state.ticket != null) {
                return _buildContent(
                  context,
                  state.ticket!,
                  state.status == TeknisiTicketDetailStatus.updating,
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    TeknisiTicketDetailModel ticket,
    bool isUpdating,
  ) {
    final t = context.t;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Pengirim
                _buildSectionTitle(t.app.ticket_sender),
                SizedBox(height: 8.h),
                _buildSenderInfo(ticket.creator),
                SizedBox(height: 20.h),

                // ID Laporan
                _buildSectionTitle(t.app.ticket_report_id),
                SizedBox(height: 8.h),
                _buildReadOnlyField(ticket.ticketCode),
                SizedBox(height: 20.h),

                // Prioritas
                _buildSectionTitle(t.app.ticket_priority),
                SizedBox(height: 8.h),
                _buildPriorityBadge(context, ticket.priority),
                SizedBox(height: 20.h),

                // Status Selector (Logic Update)
                _buildSectionTitle(t.app.ticket_update_status),
                SizedBox(height: 8.h),
                _buildStatusSelector(
                  context,
                  ticket.statusTicketTeknisi,
                  isUpdating,
                ),
                SizedBox(height: 20.h),

                // Judul Pelaporan
                _buildSectionTitle(t.app.ticket_report_title),
                SizedBox(height: 8.h),
                _buildReadOnlyField(ticket.title),
                SizedBox(height: 20.h),

                // Kategori & Jenis Aset
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(t.app.ticket_asset_category),
                          SizedBox(height: 8.h),
                          _buildReadOnlyField(ticket.asset?.kategori ?? '-'),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(t.app.ticket_asset_type),
                          SizedBox(height: 8.h),
                          _buildReadOnlyField(ticket.asset?.jenisAsset ?? '-'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Bentuk & Data Aset (Subkategori)
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(
                            t.app.ticket_asset_form,
                          ), // Mapping ke Subkategori jika cocok
                          SizedBox(height: 8.h),
                          _buildReadOnlyField(
                            ticket.asset?.subkategoriNama ?? '-',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(t.app.ticket_asset_data),
                          SizedBox(height: 8.h),
                          _buildReadOnlyField(ticket.asset?.namaAsset ?? '-'),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Lokasi Kejadian
                _buildSectionTitle(t.app.ticket_incident_location),
                SizedBox(height: 8.h),
                _buildReadOnlyField(
                  ticket.lokasiKejadian ?? ticket.asset?.lokasiAsset ?? '-',
                ),
                SizedBox(height: 20.h),

                // Pengerjaan Awal & Sampai
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(t.app.ticket_start_date),
                          SizedBox(height: 8.h),
                          _buildDateField(ticket.pengerjaanAwal.split('T')[0]),
                        ],
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle(t.app.ticket_end_date),
                          SizedBox(height: 8.h),
                          _buildDateField(ticket.pengerjaanAkhir.split('T')[0]),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),

                // Rincian Masalah
                _buildSectionTitle(t.app.ticket_problem_detail),
                SizedBox(height: 8.h),
                _buildReadOnlyTextArea(ticket.description),
                SizedBox(height: 20.h),

                // Lampiran File
                if (ticket.files.isNotEmpty) ...[
                  _buildSectionTitle(t.app.ticket_attachments),
                  SizedBox(height: 8.h),
                  _buildAttachmentsList(ticket.files),
                  SizedBox(height: 20.h),
                ],

                // Penyelesaian yang Diharapkan
                if (ticket.expectedResolution != null) ...[
                  _buildSectionTitle(t.app.ticket_expected_solution),
                  SizedBox(height: 8.h),
                  _buildReadOnlyTextArea(ticket.expectedResolution!),
                  SizedBox(height: 24.h),
                ],
              ],
            ),
          ),
        ),
      ],
    );
  }

  // --- Widget Builders (Copy-Paste dari kode sebelumnya, tidak ada perubahan logika di sini) ---
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorName.textPrimary,
      ),
    );
  }

  Widget _buildSenderInfo(TicketCreatorModel creator) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: creator.profileUrl != null
                ? NetworkImage(creator.profileUrl!)
                : NetworkImage(
                    'https://ui-avatars.com/api/?name=${Uri.encodeComponent(creator.fullName)}&background=random',
                  ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              creator.fullName,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.textPrimary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadOnlyField(String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        value,
        style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary),
      ),
    );
  }

  Widget _buildPriorityBadge(BuildContext context, String priority) {
    Color bgColor;
    String label;

    // Normalisasi string agar tidak case-sensitive
    switch (priority.toLowerCase()) {
      case 'critical':
      case 'kritis': // jaga-jaga jika ada bahasa indonesia
        bgColor = const Color(0xFF8B0000); // Merah Pekat (Dark Red)
        // Jika belum ada translation key untuk critical, bisa hardcode dulu atau tambah di i18n
        // label = context.t.app.priority_critical;
        label = "Critical";
        break;
      case 'high':
      case 'tinggi':
        bgColor = Colors.red.shade400;
        label = context.t.app.priority_high;
        break;
      case 'medium':
      case 'sedang':
        bgColor = Colors.orange.shade400;
        label = context.t.app.priority_medium;
        break;
      case 'low':
      case 'rendah':
      default:
        bgColor = Colors.green.shade400;
        label = context.t.app.priority_low;
        break;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 14.h),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.white,
          ),
        ),
      ),
    );
  }

  Widget _buildStatusSelector(
    BuildContext context,
    String currentStatus,
    bool isUpdating,
  ) {
    final status = currentStatus.toLowerCase();
    bool canSelectProcess = status == 'draft';
    bool canSelectComplete = status == 'diproses';

    return Row(
      children: [
        Expanded(
          child: _buildStatusButton(
            context,
            'Draft',
            Colors.grey.shade400,
            isActive: status == 'draft',
            onTap: null,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildStatusButton(
            context,
            'Diproses',
            Colors.orange.shade400,
            isActive: status == 'diproses',
            isLoading: isUpdating && status == 'draft',
            onTap: canSelectProcess
                ? () => _confirmStatusChange(context, 'Diproses')
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildStatusButton(
            context,
            'Selesai',
            Colors.green.shade400,
            isActive: status == 'selesai',
            isLoading: isUpdating && status == 'diproses',
            onTap: canSelectComplete
                ? () => _confirmStatusChange(context, 'Selesai')
                : null,
          ),
        ),
      ],
    );
  }

  void _confirmStatusChange(BuildContext context, String targetStatus) {
    final t = context.t.app;
    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.dialog.confirm_update_title,
        message:
            "Apakah Anda yakin ingin mengubah status menjadi $targetStatus?",
        confirmText: "Ya, Ubah",
        cancelText: t.dialog.cancel,
        icon: Icons.warning_amber_rounded,
        onConfirm: () {
          Navigator.pop(dialogContext);
          context.read<TeknisiTicketDetailCubit>().updateStatus(targetStatus);
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  }

  Widget _buildStatusButton(
    BuildContext context,
    String label,
    Color color, {
    required bool isActive,
    VoidCallback? onTap,
    bool isLoading = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Opacity(
        opacity: isActive || onTap != null ? 1.0 : 0.5,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.h),
          decoration: BoxDecoration(
            color: isActive ? color : ColorName.white,
            border: Border.all(color: color, width: 2),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 16.h,
                    width: 16.h,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: isActive ? Colors.white : color,
                    ),
                  )
                : Text(
                    label,
                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: isActive ? ColorName.white : color,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String date) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              date,
              style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary),
            ),
          ),
          Icon(Icons.calendar_today, size: 18.sp, color: ColorName.primary),
        ],
      ),
    );
  }

  Widget _buildReadOnlyTextArea(String value) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      constraints: BoxConstraints(minHeight: 100.h),
      child: Text(
        value,
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textPrimary,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildAttachmentsList(List<String> files) {
    return Column(
      children: files.map((fileUrl) {
        final fileName = fileUrl.split('/').last;
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
              Icon(Icons.description, color: ColorName.primary, size: 24.sp),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  fileName,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorName.textPrimary,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                onPressed: () {}, // TODO: Download/View Logic
                icon: Icon(
                  Icons.download,
                  color: ColorName.primary,
                  size: 20.sp,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
