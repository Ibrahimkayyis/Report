import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class TeknisiTicketDetailScreen extends StatefulWidget {
  final String ticketId;

  const TeknisiTicketDetailScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<TeknisiTicketDetailScreen> createState() =>
      _TeknisiTicketDetailScreenState();
}

class _TeknisiTicketDetailScreenState
    extends State<TeknisiTicketDetailScreen> {
  // State untuk status yang bisa diubah
  String _selectedStatus = 'draft'; // draft, diproses, selesai

  // Dummy data - nanti akan diganti dengan data dari API
  final Map<String, dynamic> _ticketData = {
    'pengirim': 'Widya Karim',
    'pengirimAvatar': 'https://i.pravatar.cc/150?img=5',
    'idLaporan': 'LPR831938',
    'prioritas': 'rendah', // rendah, sedang, tinggi
    'status': 'draft', // draft, diproses, selesai
    'judulPelaporan': 'Router bermasalah',
    'kategoriAset': 'Jaringan',
    'jenisAset': 'IT',
    'bentukAset': 'Fisik',
    'dataAset': 'Router TP-Link',
    'lokasiKejadian': 'Dinas Pendidikan Kantor B Lantai 2',
    'pengerjaanAwal': '15-09-2025',
    'sampai': '18-09-2025',
    'rincianMasalah': 'ROUTER DI RUANG ANU RADA ANU',
    'lampiranFiles': [
      {'name': 'bukti laporan.pdf', 'url': ''}
    ],
    'penyelesaianDiharapkan': 'POKOK KELAR LAH WKWK',
  };

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.app.ticket_detail_title),
      body: Column(
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
                  _buildSenderInfo(),
                  SizedBox(height: 20.h),

                  // ID Laporan
                  _buildSectionTitle(t.app.ticket_report_id),
                  SizedBox(height: 8.h),
                  _buildReadOnlyField(_ticketData['idLaporan']),
                  SizedBox(height: 20.h),

                  // Prioritas
                  _buildSectionTitle(t.app.ticket_priority),
                  SizedBox(height: 8.h),
                  _buildPriorityBadge(_ticketData['prioritas']),
                  SizedBox(height: 20.h),

                  // Perbarui Status
                  _buildSectionTitle(t.app.ticket_update_status),
                  SizedBox(height: 8.h),
                  _buildStatusSelector(),
                  SizedBox(height: 20.h),

                  // Judul Pelaporan
                  _buildSectionTitle(t.app.ticket_report_title),
                  SizedBox(height: 8.h),
                  _buildReadOnlyField(_ticketData['judulPelaporan']),
                  SizedBox(height: 20.h),

                  // Kategori & Jenis Aset (Row)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(t.app.ticket_asset_category),
                            SizedBox(height: 8.h),
                            _buildReadOnlyField(_ticketData['kategoriAset']),
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
                            _buildReadOnlyField(_ticketData['jenisAset']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Bentuk & Data Aset (Row)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(t.app.ticket_asset_form),
                            SizedBox(height: 8.h),
                            _buildReadOnlyField(_ticketData['bentukAset']),
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
                            _buildReadOnlyField(_ticketData['dataAset']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Lokasi Kejadian
                  _buildSectionTitle(t.app.ticket_incident_location),
                  SizedBox(height: 8.h),
                  _buildReadOnlyField(_ticketData['lokasiKejadian']),
                  SizedBox(height: 20.h),

                  // Pengerjaan Awal & Sampai (Row)
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle(t.app.ticket_start_date),
                            SizedBox(height: 8.h),
                            _buildDateField(_ticketData['pengerjaanAwal']),
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
                            _buildDateField(_ticketData['sampai']),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  // Rincian Masalah
                  _buildSectionTitle(t.app.ticket_problem_detail),
                  SizedBox(height: 8.h),
                  _buildReadOnlyTextArea(_ticketData['rincianMasalah']),
                  SizedBox(height: 20.h),

                  // Lampiran File
                  _buildSectionTitle(t.app.ticket_attachments),
                  SizedBox(height: 8.h),
                  _buildAttachmentsList(_ticketData['lampiranFiles']),
                  SizedBox(height: 20.h),

                  // Penyelesaian yang Diharapkan
                  _buildSectionTitle(t.app.ticket_expected_solution),
                  SizedBox(height: 8.h),
                  _buildReadOnlyTextArea(
                      _ticketData['penyelesaianDiharapkan']),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),

          // Bottom Action Buttons
          _buildBottomActions(t),
        ],
      ),
    );
  }

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

  Widget _buildSenderInfo() {
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
            backgroundImage: NetworkImage(_ticketData['pengirimAvatar']),
          ),
          SizedBox(width: 12.w),
          Text(
            _ticketData['pengirim'],
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
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
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textPrimary,
        ),
      ),
    );
  }

  Widget _buildPriorityBadge(String priority) {
    Color bgColor;
    String label;

    switch (priority) {
      case 'tinggi':
        bgColor = Colors.red.shade400;
        label = context.t.app.priority_high;
        break;
      case 'sedang':
        bgColor = Colors.orange.shade400;
        label = context.t.app.priority_medium;
        break;
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

  Widget _buildStatusSelector() {
    return Row(
      children: [
        Expanded(
          child: _buildStatusButton(
            'draft',
            context.t.app.status_draft,
            Colors.grey.shade400,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildStatusButton(
            'diproses',
            context.t.app.status_in_progress,
            Colors.orange.shade400,
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: _buildStatusButton(
            'selesai',
            context.t.app.status_completed,
            Colors.green.shade400,
          ),
        ),
      ],
    );
  }

  Widget _buildStatusButton(String status, String label, Color color) {
    final isSelected = _selectedStatus == status;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedStatus = status;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected ? color : ColorName.white,
          border: Border.all(
            color: color,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: isSelected ? ColorName.white : color,
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
              style: TextStyle(
                fontSize: 14.sp,
                color: ColorName.textPrimary,
              ),
            ),
          ),
          Icon(
            Icons.calendar_today,
            size: 18.sp,
            color: ColorName.primary,
          ),
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

  Widget _buildAttachmentsList(List<Map<String, dynamic>> files) {
    return Column(
      children: files.map((file) {
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
              Icon(
                Icons.description,
                color: ColorName.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Text(
                  file['name'],
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: ColorName.textPrimary,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  // TODO: Download/View file
                },
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

  Widget _buildBottomActions(Translations t) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.grey.shade700,
                side: BorderSide(color: Colors.grey.shade400),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.app.button_cancel,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: OutlinedButton(
              onPressed: () {
                _handleSaveDraft();
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: ColorName.primary,
                side: BorderSide(color: ColorName.primary),
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.app.button_save_draft,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _handleUpdate();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primary,
                foregroundColor: ColorName.white,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.app.button_update,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSaveDraft() {
    // TODO: Implement save draft logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(context.t.app.message_draft_saved),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _handleUpdate() {
    // TODO: Implement update logic with selected status
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${context.t.app.message_status_updated}: $_selectedStatus',
        ),
        backgroundColor: Colors.green,
      ),
    );
  }
}