import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart'; // 👈 Import Intl untuk format tanggal lengkap
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:timeago/timeago.dart' as timeago; // 👈 Import timeago

import '../../domain/models/teknisi_notification_detail_model.dart';
import '../cubits/teknisi_notification_detail_cubit.dart';
import '../cubits/teknisi_notification_detail_state.dart';
import '../widgets/teknisi_notification_detail_card.dart';

@RoutePage()
class TeknisiNotificationDetailScreen extends StatelessWidget {
  final String id;

  const TeknisiNotificationDetailScreen({
    super.key,
    required this.id,
  });

  // 🔹 Helper Function untuk Format Waktu
  String _formatDetailTime(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal();
      final now = DateTime.now();
      final difference = now.difference(dt);

      // Jika kurang dari 24 jam, gunakan "x jam yang lalu"
      if (difference.inHours < 24) {
        return timeago.format(dt, locale: 'id');
      } 
      // Jika lebih dari 24 jam, tampilkan tanggal lengkap (Contoh: 14 Des 2025, 10:30)
      else {
        return DateFormat('dd MMM yyyy, HH:mm', 'id').format(dt);
      }
    } catch (e) {
      return isoString;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeknisiNotificationDetailCubit>()..fetchDetail(id),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: const AppPrimaryBar(title: "Detail Notifikasi Teknisi"),
        body: BlocBuilder<TeknisiNotificationDetailCubit,
            TeknisiNotificationDetailState>(
          builder: (context, state) {
            if (state is TeknisiNotificationDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TeknisiNotificationDetailError) {
              return AppErrorState.general(
                context: context,
                message: state.message,
                onRetry: () => context
                    .read<TeknisiNotificationDetailCubit>()
                    .fetchDetail(id),
              );
            } else if (state is TeknisiNotificationDetailLoaded) {
              return _buildContent(context, state.detail);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(
      BuildContext context, TeknisiNotificationDetailModel detail) {
    final ticketCode = detail.ticketCode ?? '-';
    final status = detail.status ?? 'Info';

    String illustrationLabel = "Informasi";
    String cardType = 'info';

    final msgLower = detail.message.toLowerCase();
    if (msgLower.contains('tugas') || msgLower.contains('assign')) {
      illustrationLabel = "Tugas Baru";
      cardType = 'ticket';
    } else if (msgLower.contains('selesai') || msgLower.contains('solved')) {
      illustrationLabel = "Tiket Selesai";
      cardType = 'update';
    } else if (msgLower.contains('maintenance')) {
      illustrationLabel = "Maintenance";
      cardType = 'maintenance';
    } else if (msgLower.contains('darurat') || msgLower.contains('warning')) {
      illustrationLabel = "Peringatan";
      cardType = 'emergency';
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER SECTION (Judul & Waktu)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Notifikasi",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: ColorName.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    _buildTag(detail.isRead ? "Sudah Dibaca" : "Baru"),
                  ],
                ),
              ),
              SizedBox(width: 8.w),
              
              // 🟢 GUNAKAN HELPER FORMAT TIME DI SINI
              Text(
                _formatDetailTime(detail.createdAt), 
                style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                textAlign: TextAlign.right,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          TeknisiNotificationDetailCard(
            type: cardType,
            ticketNumber: ticketCode,
            status: status,
            serviceType: "-",
            opdDestination: "-",
            illustrationLabel: illustrationLabel,
          ),

          SizedBox(height: 32.h),

          Text(
            "Isi Pesan:",
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Text(
              detail.message,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade800,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1F4E79),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11.sp,
          color: Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}