import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/app_bar/app_primary_bar.dart';

@RoutePage()
class TeknisiRatingDetailScreen extends StatelessWidget {
  final String senderName;
  final String? senderAvatar;
  final String? ticketId;
  final String category;
  final String type;
  final String form;
  final int rating;
  final String? comment;
  final int? easeOfUse;
  final int? responseSpeed;
  final int? solutionQuality;

  const TeknisiRatingDetailScreen({
    super.key,
    required this.senderName,
    this.senderAvatar,
    this.ticketId,
    required this.category,
    required this.type,
    required this.form,
    required this.rating,
    this.comment,
    this.easeOfUse,
    this.responseSpeed,
    this.solutionQuality,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(
        title: t.app.rating_detail.page_title,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Pengirim Section
                  _buildSectionTitle(
                    context,
                    t.app.rating_detail.sender_label,
                  ),
                  SizedBox(height: 8.h),
                  _buildSenderInfo(context),
                  SizedBox(height: 20.h),

                  /// ID Tiket
                  _buildSectionTitle(
                    context,
                    t.app.rating_detail.ticket_id_label,
                  ),
                  SizedBox(height: 8.h),
                  _buildReadOnlyField(ticketId ?? 'LPR321336'),
                  SizedBox(height: 20.h),

                  /// Rating Kepuasan Pelayanan Kami
                  _buildSectionTitle(
                    context,
                    t.app.rating_detail.satisfaction_rating_label,
                  ),
                  SizedBox(height: 12.h),
                  _buildMainRating(rating),
                  SizedBox(height: 20.h),

                  /// Komentar
                  _buildSectionTitle(
                    context,
                    t.app.rating_detail.comment_label,
                  ),
                  SizedBox(height: 8.h),
                  _buildCommentField(
                    comment ?? 'Pelayanan sangat memuaskan dan cepat tanggap',
                  ),
                  SizedBox(height: 24.h),

                  /// Sub Ratings Section
                  _buildSubRatingItem(
                    context,
                    t.app.rating_detail.ease_of_use,
                    easeOfUse ?? 5,
                  ),
                  SizedBox(height: 16.h),
                  _buildSubRatingItem(
                    context,
                    t.app.rating_detail.response_speed,
                    responseSpeed ?? 4,
                  ),
                  SizedBox(height: 16.h),
                  _buildSubRatingItem(
                    context,
                    t.app.rating_detail.solution_quality,
                    solutionQuality ?? 5,
                  ),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),

          /// Bottom Button
          _buildBottomButton(context, t),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorName.textPrimary,
      ),
    );
  }

  Widget _buildSenderInfo(BuildContext context) {
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
            backgroundImage: NetworkImage(
              senderAvatar ?? 'https://i.pravatar.cc/150?img=10',
            ),
            backgroundColor: Colors.grey.shade200,
          ),
          SizedBox(width: 12.w),
          Text(
            senderName,
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

  Widget _buildMainRating(int rating) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(5, (index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: Icon(
              index < rating ? Icons.star : Icons.star_border,
              color: index < rating
                  ? ColorName.primary
                  : Colors.grey.shade400,
              size: 40.sp,
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCommentField(String comment) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r),
      ),
      constraints: BoxConstraints(minHeight: 100.h),
      child: Text(
        comment,
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textPrimary,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildSubRatingItem(BuildContext context, String label, int rating) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
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
            color: ColorName.black.withValues(alpha: 0.05),
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