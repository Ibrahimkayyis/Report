import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart'; // Untuk AppErrorState
import 'package:report/src/modules/teknisi_rating/domain/models/teknisi_rating_model.dart';
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_detail_cubit.dart';
import 'package:report/src/modules/teknisi_rating/presentation/cubits/teknisi_rating_detail_state.dart';

// ✅ Import Shimmer
import '../widgets/shimmer/teknisi_rating_detail_shimmer.dart';

@RoutePage()
class TeknisiRatingDetailScreen extends StatefulWidget {
  final String ticketId;

  const TeknisiRatingDetailScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<TeknisiRatingDetailScreen> createState() =>
      _TeknisiRatingDetailScreenState();
}

class _TeknisiRatingDetailScreenState extends State<TeknisiRatingDetailScreen> {
  bool _isDetailExpanded = true; // Default terbuka seperti referensi

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // ✅ Inject Cubit Detail
    return BlocProvider(
      create: (_) =>
          sl<TeknisiRatingDetailCubit>()..fetchRatingDetail(widget.ticketId),
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(
          title: t.app.rating_detail.page_title,
          centerTitle: true,
        ),
        body: BlocBuilder<TeknisiRatingDetailCubit, TeknisiRatingDetailState>(
          builder: (context, state) {
            
            // ✅ GANTI LOADING STATE
            if (state.status == TeknisiRatingDetailStatus.loading) {
              return const TeknisiRatingDetailShimmer();
            }

            // 2. Error
            if (state.status == TeknisiRatingDetailStatus.failure) {
              return AppErrorState.general(
                context: context,
                message: state.errorMessage ?? "Gagal memuat detail rating",
                onRetry: () => context
                    .read<TeknisiRatingDetailCubit>()
                    .fetchRatingDetail(widget.ticketId),
              );
            }

            // 3. Success Loaded
            if (state.rating != null) {
              return _buildContent(context, state.rating!, t);
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    TeknisiRatingModel ratingData,
    Translations t,
  ) {
    final asset = ratingData.asset;
    final creator = ratingData.creator;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Pengirim Section
                _buildSectionTitle(t.app.rating_detail.sender_label),
                SizedBox(height: 8.h),
                _buildSenderInfo(
                  name: creator.fullName,
                  email: creator.email,
                  avatarUrl: creator.profileUrl,
                ),
                SizedBox(height: 20.h),

                /// ID Tiket
                _buildSectionTitle(t.app.rating_detail.ticket_id_label),
                SizedBox(height: 8.h),
                _buildReadOnlyField(ratingData.ticketCode),
                SizedBox(height: 20.h),

                /// Detail Tiket (Collapsible) - Struktur mirip TicketRatingScreen
                _buildDetailTicketSection(
                  title: ratingData.title,
                  assetName: asset?.namaAsset ?? '-',
                  serialNumber: asset?.nomorSeri ?? '-',
                  category: asset?.kategori ?? '-',
                  subcategory: asset?.subkategoriNama ?? '-',
                  type: asset?.jenisAsset ?? '-',
                  location: ratingData.lokasiKejadian ?? asset?.lokasi ?? '-',
                ),
                SizedBox(height: 24.h),

                /// Rating Kepuasan (Read Only)
                _buildSectionTitle(t.app.rating_detail.satisfaction_rating_label),
                SizedBox(height: 12.h),
                _buildRatingStars(ratingData.rating), // Read Only Stars
                SizedBox(height: 20.h),

                /// Komentar (Read Only)
                _buildSectionTitle(t.app.rating_detail.comment_label),
                SizedBox(height: 8.h),
                _buildReadOnlyTextArea(
                  ratingData.comment.isNotEmpty ? ratingData.comment : '-',
                ),
                SizedBox(height: 24.h),

                /// Sub Ratings (Read Only - Placeholder jika API belum ada)
                _buildSubRatingItem(
                  t.app.rating_detail.ease_of_use,
                  ratingData.rating, // Placeholder pakai rating utama
                ),
                SizedBox(height: 16.h),
                _buildSubRatingItem(
                  t.app.rating_detail.response_speed,
                  ratingData.rating, // Placeholder
                ),
                SizedBox(height: 16.h),
                _buildSubRatingItem(
                  t.app.rating_detail.solution_quality,
                  ratingData.rating, // Placeholder
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ),

        /// Bottom Button (Hanya Tombol Kembali)
        _buildBottomButton(context, t),
      ],
    );
  }

  // ... (Widget Helpers: _buildSectionTitle, _buildSenderInfo, dll SAMA SEPERTI SEBELUMNYA)
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

  Widget _buildSenderInfo({
    required String name,
    required String email,
    String? avatarUrl,
  }) {
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
            backgroundImage:
                avatarUrl != null ? NetworkImage(avatarUrl) : null,
            backgroundColor: ColorName.primary.withOpacity(0.1),
            child: avatarUrl == null
                ? Icon(Icons.person, color: ColorName.primary, size: 24.sp)
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorName.textPrimary,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
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

  Widget _buildDetailTicketSection({
    required String title,
    required String assetName,
    required String serialNumber,
    required String category,
    required String subcategory,
    required String type,
    required String location,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            'Detail Tiket',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
          initiallyExpanded: _isDetailExpanded,
          trailing: Icon(
            _isDetailExpanded
                ? Icons.keyboard_arrow_up_rounded
                : Icons.keyboard_arrow_down_rounded,
            color: ColorName.textPrimary,
          ),
          onExpansionChanged: (expanded) {
            setState(() => _isDetailExpanded = expanded);
          },
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(height: 1, color: Colors.grey.shade300),
                  SizedBox(height: 16.h),

                  _buildDetailItem('Judul Pelaporan', title),
                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Expanded(child: _buildDetailItem('Data Aset', assetName)),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: _buildDetailItem('Nomor Seri', serialNumber)),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  Row(
                    children: [
                      Expanded(
                          child: _buildDetailItem('Kategori Aset', category)),
                      SizedBox(width: 8.w),
                      Expanded(
                          child: _buildDetailItem('Sub-Kategori', subcategory)),
                      SizedBox(width: 8.w),
                      Expanded(child: _buildDetailItem('Jenis Aset', type)),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  _buildDetailItem('Lokasi Kejadian', location),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 4.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 12.sp,
              color: ColorName.textPrimary,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildRatingStars(int rating) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              index < rating ? Icons.star_rounded : Icons.star_border_rounded,
              color: index < rating ? ColorName.primary : Colors.grey.shade400,
              size: 48.sp,
            ),
          );
        }),
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

  Widget _buildSubRatingItem(String label, int rating) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.textPrimary,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                color: index < rating
                    ? ColorName.primary
                    : Colors.grey.shade400,
                size: 20.sp,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context, Translations t) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () => context.router.pop(),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.grey.shade700,
            side: BorderSide(color: Colors.grey.shade400),
            padding: EdgeInsets.symmetric(vertical: 14.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
          child: Text(
            t.app.rating_detail.button_cancel,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}