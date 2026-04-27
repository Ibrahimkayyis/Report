import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/reopen_ticket/reopen_ticket_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/reopen_ticket/reopen_ticket_state.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_cubit.dart';
import 'package:report/src/modules/report_activity/presentation/cubits/ticket_detail/ticket_detail_state.dart';

// ✅ Import Shimmer
import '../../widgets/shimmer/reopen_ticket_shimmer.dart';

@RoutePage()
class ReopenTicketScreen extends StatefulWidget {
  final String ticketId;

  const ReopenTicketScreen({
    super.key,
    required this.ticketId,
  });

  @override
  State<ReopenTicketScreen> createState() => _ReopenTicketScreenState();
}

class _ReopenTicketScreenState extends State<ReopenTicketScreen> {
  final _reasonController = TextEditingController();
  final _expectedSolutionController = TextEditingController();
  final GlobalKey<AppFormAttachFileState> _attachFileKey = GlobalKey();

  List<File> _attachedFiles = [];
  bool _hasAttemptedSubmit = false;
  final Map<String, String?> _errors = {};

  @override
  void dispose() {
    _reasonController.dispose();
    _expectedSolutionController.dispose();
    super.dispose();
  }

  void _clearError(String key) {
    if (_hasAttemptedSubmit && _errors[key] != null) {
      setState(() => _errors[key] = null);
    }
  }

  bool _validateForm() {
    final t = context.t.app;
    final newErrors = <String, String?>{};

    void validate(String key, bool isInvalid, String errorMessage) {
      if (isInvalid) newErrors[key] = errorMessage;
    }

    final reason = _reasonController.text.trim();
    validate('reason', reason.isEmpty, t.reopen_reason_required);
    if (reason.isNotEmpty) {
      validate(
          'reason', reason.length < 20, t.validation.description_min_length);
    }

    validate(
        'expectedSolution',
        _expectedSolutionController.text.trim().isEmpty,
        t.validation.expected_solution_required);

    setState(() {
      _hasAttemptedSubmit = true;
      _errors.clear();
      _errors.addAll(newErrors);
    });

    return _errors.isEmpty;
  }

  // ✅ FIX: Terima context sebagai parameter
  void _handleSubmit(BuildContext context) {
    final t = context.t.app;
    if (!_validateForm()) return;

    showDialog(
      context: context, // Gunakan context yang dipassing
      builder: (dialogContext) => AppConfirmationDialog(
        title: t.dialog.confirm_reopen_title,
        message: t.dialog.confirm_reopen_message,
        confirmText: t.dialog.confirm_yes,
        cancelText: t.dialog.cancel,
        icon: Icons.refresh_rounded,
        onConfirm: () {
          Navigator.of(dialogContext).pop();
          
          // ✅ Aman memanggil read<ReopenTicketCubit>()
          context.read<ReopenTicketCubit>().submitReopen(
            ticketId: widget.ticketId,
            reason: _reasonController.text.trim(),
            expectedSolution: _expectedSolutionController.text.trim(),
            files: _attachedFiles,
          );
        },
        onCancel: () => Navigator.of(dialogContext).pop(),
      ),
    );
  }

  void _handleCancel() {
    final t = context.t.app;
    final hasData = _reasonController.text.isNotEmpty ||
        _expectedSolutionController.text.isNotEmpty ||
        _attachedFiles.isNotEmpty;

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
        BlocProvider(create: (_) => sl<ProfileCubit>()..fetchProfile()),
        BlocProvider(
          create: (_) =>
              sl<TicketDetailCubit>()..fetchTicketDetail(widget.ticketId),
        ),
        BlocProvider(create: (_) => sl<ReopenTicketCubit>()),
      ],
      child: BlocListener<ReopenTicketCubit, ReopenTicketState>(
        listener: (context, state) {
          if (state is ReopenTicketLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
          } else if (state is ReopenTicketSuccess) {
            Navigator.of(context, rootNavigator: true).pop();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (successContext) => AppGlobalSuccessDialog(
                title: t.dialog.reopen_success_title,
                buttonText: t.dialog.report_success_button,
                onPressed: () {
                  Navigator.of(successContext).pop();
                  context.router.maybePop(true);
                },
              ),
            );
          } else if (state is ReopenTicketError) {
            Navigator.of(context, rootNavigator: true).pop();
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
          appBar: AppSecondaryBar(title: t.reopen_ticket_title),
          // ✅ Kita menggunakan context dari BlocBuilder di sini
          body: BlocBuilder<TicketDetailCubit, TicketDetailState>(
            builder: (context, state) {
              
              // ✅ GANTI LOADING STATE DI SINI
              if (state is TicketDetailLoading) {
                return const ReopenTicketShimmer();
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
                            // Target OPD
                            const AppFormTargetDisplay(
                              name: 'Dinas Komunikasi dan Informatika',
                              imageUrl: null,
                              color: ColorName.primary,
                            ),
                            SizedBox(height: 24.h),

                            // Header Info (Creator Info)
                            _buildHeaderInfo(
                              fullName: creator?.fullName ?? 'Unknown',
                              profileUrl: creator?.profile,
                              ticketCode: ticket.ticketCode,
                            ),
                            SizedBox(height: 24.h),

                            // Read-only fields from history
                            _buildReadOnlyField(
                              label: t.reported_title_label,
                              value: ticket.title,
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_asset_label,
                              value: asset?.namaAsset ?? '-',
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_serial_number_label,
                              value: asset?.nomorSeri ?? '-',
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_asset_category_label,
                              value: asset?.kategori ?? '-',
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_asset_subcategory_label,
                              value: asset?.subkategoriNama ?? '-',
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_asset_type_label,
                              value: asset?.jenisAsset ?? '-',
                            ),
                            SizedBox(height: 20.h),

                            _buildReadOnlyField(
                              label: t.reported_location_label,
                              value: ticket.lokasiKejadian ?? '-',
                            ),
                            SizedBox(height: 24.h),

                            // Editable section
                            Text(
                              t.reopen_section_title,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700,
                                color: ColorName.primary,
                              ),
                            ),
                            SizedBox(height: 16.h),

                            // Reason for reopening
                            _buildEditableTextField(
                              label: t.reopen_reason_label,
                              hint: t.reopen_reason_hint,
                              controller: _reasonController,
                              errorText: _errors['reason'],
                              minLines: 4,
                              onChanged: (_) => _clearError('reason'),
                            ),
                            SizedBox(height: 20.h),

                            // Attach File
                            AppFormAttachFile(
                              key: _attachFileKey,
                              title: t.attach_file_label,
                              onFilesChanged: (files) =>
                                  setState(() => _attachedFiles = files),
                            ),
                            SizedBox(height: 20.h),

                            // Expected Solution
                            _buildEditableTextField(
                              label: t.expected_solution_label,
                              hint: t.expected_solution_hint,
                              controller: _expectedSolutionController,
                              errorText: _errors['expectedSolution'],
                              minLines: 3,
                              onChanged: (_) => _clearError('expectedSolution'),
                            ),
                            SizedBox(height: 24.h),
                          ],
                        ),
                      ),
                    ),

                    // ✅ FIX: Pass 'context'
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

  // --- WIDGET HELPER ---
  Widget _buildHeaderInfo({
    required String fullName,
    String? profileUrl,
    required String ticketCode,
  }) {
    return Column(children: [
      Row(children: [
        Expanded(flex: 1, child: Text("Pelapor", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorName.textPrimary))),
        Expanded(flex: 2, child: Row(children: [
          CircleAvatar(radius: 20.r, backgroundColor: ColorName.primary.withOpacity(0.1), backgroundImage: profileUrl != null ? NetworkImage(profileUrl) : null, child: profileUrl == null ? Icon(Icons.person, size: 24.sp, color: ColorName.primary) : null),
          SizedBox(width: 12.w),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(fullName, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500, color: ColorName.textPrimary), maxLines: 1, overflow: TextOverflow.ellipsis)])),
        ])),
      ]),
      SizedBox(height: 16.h),
      Row(children: [
        Expanded(flex: 1, child: Text("ID Tiket", style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold, color: ColorName.textPrimary))),
        Expanded(flex: 2, child: Container(width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h), decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(8.r)), child: Text(ticketCode, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: ColorName.black)))),
      ]),
    ]);
  }

  Widget _buildReadOnlyField({required String label, required String value}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: ColorName.textPrimary)),
      SizedBox(height: 8.h),
      Container(width: double.infinity, padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h), decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(8.r), border: Border.all(color: Colors.grey.shade300)), child: Text(value, style: TextStyle(fontSize: 14.sp, color: Colors.grey.shade700, fontWeight: FontWeight.w500))),
    ]);
  }

  Widget _buildEditableTextField({required String label, required String hint, required TextEditingController controller, String? errorText, int minLines = 1, required Function(String) onChanged}) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: ColorName.textPrimary)),
      SizedBox(height: 8.h),
      TextField(controller: controller, onChanged: onChanged, maxLines: minLines, style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary), decoration: InputDecoration(hintText: hint, hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey.shade500), filled: true, fillColor: ColorName.white, contentPadding: EdgeInsets.all(14.w), border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey.shade400)), enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide(color: errorText != null ? Colors.red : Colors.grey.shade400)), focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.r), borderSide: BorderSide(color: errorText != null ? Colors.red : ColorName.primary, width: 2)), errorText: errorText, errorStyle: TextStyle(fontSize: 12.sp))),
    ]);
  }

  // ✅ FIX: Terima context
  Widget _buildBottomActions(BuildContext context) {
    final t = context.t.app;
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -4))]),
      child: Row(children: [
        Expanded(child: OutlinedButton(onPressed: _handleCancel, style: OutlinedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 12.h), side: const BorderSide(color: ColorName.primary), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))), child: Text(t.back_button, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: ColorName.primary)))),
        SizedBox(width: 12.w),
        Expanded(child: ElevatedButton(onPressed: () => _handleSubmit(context), style: ElevatedButton.styleFrom(backgroundColor: ColorName.primary, foregroundColor: ColorName.white, padding: EdgeInsets.symmetric(vertical: 12.h), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))), child: Text(t.submit_button, style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600)))),
      ]),
    );
  }
}