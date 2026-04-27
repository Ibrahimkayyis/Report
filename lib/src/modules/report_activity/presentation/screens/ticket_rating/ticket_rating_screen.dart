import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_state.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_rating/ticket_rating_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_rating/ticket_rating_state.dart';

// ✅ Import Shimmer
import '../../widgets/shimmer/ticket_rating_shimmer.dart'; 

@RoutePage()
class TicketRatingScreen extends StatefulWidget {
  final String ticketId; // ✅ UUID

  const TicketRatingScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<TicketRatingScreen> createState() => _TicketRatingScreenState();
}

class _TicketRatingScreenState extends State<TicketRatingScreen> {
  final _commentController = TextEditingController();
  int _selectedRating = 0;
  bool _isDetailExpanded = true; // Default expanded agar user lihat konteks
  bool _hasAttemptedSubmit = false;
  String? _ratingError;
  String? _commentError;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  bool _validateForm() {
    setState(() {
      _hasAttemptedSubmit = true;
      _ratingError = _selectedRating == 0 ? 'Rating wajib dipilih' : null;

      final comment = _commentController.text.trim();
      // Validasi komentar opsional (jika diisi min 10 karakter)
      if (comment.isNotEmpty && comment.length < 10) {
        _commentError = 'Komentar minimal 10 karakter';
      } else {
        _commentError = null;
      }
    });

    return _ratingError == null && _commentError == null;
  }

  // ✅ FIX: Terima context
  void _handleSubmit(BuildContext context) {
    final t = context.t.app;

    if (!_validateForm()) return;

    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.dialog.confirm_rating_title,
        message: t.dialog.confirm_rating_message,
        confirmText: t.dialog.confirm_yes,
        cancelText: t.dialog.cancel,
        icon: Icons.star_rounded,
        onConfirm: () {
          Navigator.of(dialogContext).pop();

          // Call API via Cubit
          context.read<TicketRatingCubit>().submitRating(
                ticketId: widget.ticketId,
                rating: _selectedRating,
                comment: _commentController.text.trim(),
              );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _handleCancel() {
    final t = context.t.app;
    final hasData = _selectedRating > 0 || _commentController.text.isNotEmpty;

    if (hasData) {
      showDialog(
        context: context,
        builder: (dialogContext) => AppWarningDialog(
          title: t.dialog.back_confirmation_title,
          message: t.dialog.back_confirmation_message,
          confirmText: t.dialog.back_confirmation_confirm,
          cancelText: t.dialog.back_confirmation_cancel,
          onConfirm: () {
            Navigator.of(dialogContext).pop();
            context.router.maybePop();
          },
          onCancel: () => Navigator.of(dialogContext).pop(),
        ),
      );
    } else {
      context.router.maybePop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return MultiBlocProvider(
      providers: [
        // 1. Cubit untuk Data Konteks (Detail Tiket)
        BlocProvider(
          create: (_) =>
              sl<TicketDetailCubit>()..fetchTicketDetail(widget.ticketId),
        ),
        // 2. Cubit untuk Aksi Submit Rating
        BlocProvider(create: (_) => sl<TicketRatingCubit>()),
      ],
      child: BlocListener<TicketRatingCubit, TicketRatingState>(
        listener: (context, state) {
          if (state is TicketRatingLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is TicketRatingSuccess) {
            Navigator.of(context, rootNavigator: true).pop(); // Hide Loading
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (successContext) => AppGlobalSuccessDialog(
                title: t.dialog.rating_success_title,
                buttonText: t.dialog.report_success_button,
                onPressed: () {
                  Navigator.of(successContext).pop();
                  context.router.maybePop(true); // Return true to refresh list
                },
              ),
            );
          } else if (state is TicketRatingError) {
            Navigator.of(context, rootNavigator: true).pop(); // Hide Loading
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: Scaffold(
          backgroundColor: ColorName.background,
          appBar: AppPrimaryBar(
            title: t.rating_title,
            centerTitle: true,
          ),
          body: BlocBuilder<TicketDetailCubit, TicketDetailState>(
            builder: (context, state) {
              
              // ✅ GANTI LOADING STATE
              if (state is TicketDetailLoading) {
                return const TicketRatingShimmer();
              } 
              
              else if (state is TicketDetailError) {
                return AppErrorState.general(
                  context: context,
                  message: state.message,
                  onRetry: () => context
                      .read<TicketDetailCubit>()
                      .fetchTicketDetail(widget.ticketId),
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
                            // Pengirim Section
                            _buildSectionTitle(t.rating_sender_label),
                            SizedBox(height: 8.h),
                            _buildSenderInfo(
                              name: creator?.fullName ?? 'Unknown',
                              avatarUrl: creator?.profile,
                            ),
                            SizedBox(height: 20.h),

                            // ID Tiket
                            _buildSectionTitle(t.rating_ticket_id_label),
                            SizedBox(height: 8.h),
                            _buildReadOnlyField(ticket.ticketCode),
                            SizedBox(height: 20.h),

                            // Detail Tiket (Collapsible) - Dengan Data Real
                            _buildDetailTicketSection(
                              title: ticket.title,
                              assetName: asset?.namaAsset ?? '-',
                              serialNumber: asset?.nomorSeri ?? '-',
                              category: asset?.kategori ?? '-',
                              subcategory: asset?.subkategoriNama ?? '-',
                              type: asset?.jenisAsset ?? '-',
                              location: ticket.lokasiKejadian ?? '-',
                            ),
                            SizedBox(height: 24.h),

                            // Rating Kepuasan
                            _buildSectionTitle(t.rating_satisfaction_label),
                            SizedBox(height: 12.h),
                            _buildRatingStars(),
                            if (_hasAttemptedSubmit && _ratingError != null) ...[
                              SizedBox(height: 8.h),
                              Center(
                                child: Text(
                                  _ratingError!,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            SizedBox(height: 24.h),

                            // Komentar
                            _buildSectionTitle(t.rating_comment_label),
                            SizedBox(height: 8.h),
                            _buildCommentField(),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                    ),

                    // Bottom Buttons
                    // ✅ Pass Context from BlocBuilder
                    _buildBottomActions(context),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  // --- WIDGET BUILDERS ---

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

  Widget _buildSenderInfo({required String name, String? avatarUrl}) {
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
                ? Icon(
                    Icons.person,
                    color: ColorName.primary,
                    size: 24.sp,
                  )
                : null,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Text(
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorName.textPrimary,
              ),
              maxLines: 1,
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
        style: TextStyle(
          fontSize: 14.sp,
          color: ColorName.textPrimary,
        ),
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
          initiallyExpanded: true, // Auto open
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

                  // Judul Pelaporan
                  _buildDetailItem('Judul Pelaporan', title),
                  SizedBox(height: 12.h),

                  // Data Aset & Nomor Seri (Row)
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailItem('Data Aset', assetName),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: _buildDetailItem('Nomor Seri', serialNumber),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Kategori, Sub-Kategori, Jenis
                  Row(
                    children: [
                      Expanded(
                        child: _buildDetailItem('Kategori Aset', category),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: _buildDetailItem('Sub-Kategori', subcategory),
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: _buildDetailItem('Jenis Aset', type),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  // Lokasi Kejadian
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

  Widget _buildRatingStars() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(5, (index) {
          final starValue = index + 1;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedRating = starValue;
                if (_hasAttemptedSubmit) {
                  _ratingError = null;
                }
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: Icon(
                _selectedRating >= starValue
                    ? Icons.star_rounded
                    : Icons.star_border_rounded,
                color: _selectedRating >= starValue
                    ? ColorName.primary
                    : Colors.grey.shade400,
                size: 48.sp,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildCommentField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _commentController,
          maxLines: 5,
          onChanged: (_) {
            if (_hasAttemptedSubmit) {
              setState(() {
                final comment = _commentController.text.trim();
                if (comment.isNotEmpty && comment.length < 10) {
                  _commentError = 'Komentar minimal 10 karakter';
                } else {
                  _commentError = null;
                }
              });
            }
          },
          style: TextStyle(
            fontSize: 14.sp,
            color: ColorName.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: 'Tuliskan komentar Anda (opsional)',
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade500,
            ),
            filled: true,
            fillColor: ColorName.white,
            contentPadding: EdgeInsets.all(14.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: _commentError != null
                    ? Colors.red
                    : Colors.grey.shade400,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: _commentError != null
                    ? Colors.red
                    : Colors.grey.shade400,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: _commentError != null
                    ? Colors.red
                    : ColorName.primary,
                width: 2,
              ),
            ),
            errorText: _commentError,
            errorStyle: TextStyle(fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

  // ✅ FIX: Terima context
  Widget _buildBottomActions(BuildContext context) {
    final t = context.t.app;

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: _handleCancel,
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
          SizedBox(width: 12.w),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _handleSubmit(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorName.primary,
                foregroundColor: ColorName.white,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                t.submit_button, // "Kirim"
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
}