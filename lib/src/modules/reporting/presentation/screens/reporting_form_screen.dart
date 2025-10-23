import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';

@RoutePage()
class ReportingFormScreen extends StatefulWidget {
  final String opdName;
  final IconData opdIcon;
  final Color opdColor;

  const ReportingFormScreen({
    super.key,
    required this.opdName,
    required this.opdIcon,
    required this.opdColor,
  });

  @override
  State<ReportingFormScreen> createState() => _ReportingFormScreenState();
}

class _ReportingFormScreenState extends State<ReportingFormScreen> {
  final _problemController = TextEditingController();
  final _additionalInfoController = TextEditingController();

  String? _selectedCategory;
  // String? _selectedPriority;

  // Mock user data
  final String _userName = "Sri Wulandari";
  final String _userNip = "200011420230062053";
  final String _userDivision = "Divisi Sumber Daya Manusia";

  @override
  void dispose() {
    _problemController.dispose();
    _additionalInfoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.app.online_reporting_title),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// 🏢 OPD / Tujuan Laporan
                  AppFormTargetDisplay(
                    name: widget.opdName,
                    icon: widget.opdIcon,
                    color: widget.opdColor,
                  ),

                  SizedBox(height: 24.h),

                  /// 👤 Data Pelapor
                  AppFormUserInfo(
                    name: _userName,
                    nip: _userNip,
                    division: _userDivision,
                  ),

                  SizedBox(height: 24.h),

                  /// 🏢 Data Aset (sementara tampil selalu)
                  AppFormAssetInfo(
                    assetId: "AST-009812",
                    assetName: "Printer Canon LBP-6030",
                    assetLocation: "Lantai 2, Ruang Kepegawaian",
                  ),

                  SizedBox(height: 24.h),

                  /// 🧭 Kategori Laporan
                  AppFormCategorySelector(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (val) {
                      setState(() => _selectedCategory = val);
                    },
                  ),

                  SizedBox(height: 24.h),

                  /// 📝 Deskripsi Masalah
                  AppFormProblemDescription(controller: _problemController),

                  // SizedBox(height: 24.h),

                  // /// 🚦 Prioritas Laporan
                  // AppFormPrioritySelector(
                  //   selected: _selectedPriority,
                  //   onSelected: (val) {
                  //     setState(() => _selectedPriority = val);
                  //   },
                  // ),
                  SizedBox(height: 24.h),

                  /// 📎 Lampiran File
                  const AppFormAttachFile(),

                  SizedBox(height: 24.h),

                  /// 💬 Informasi Tambahan
                  AppFormAdditionalInfo(controller: _additionalInfoController),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          /// 🔘 Tombol Aksi
          AppFormBottomActions(
            onCancel: () => context.router.pop(),
            onSaveDraft: () {
              // TODO: Save draft ke local cache
            },
            onSubmit: () {
              final t = context.t;

              showDialog(
                context: context,
                builder: (context) => AppConfirmationDialog(
                  title: t
                      .app
                      .dialog
                      .confirm_submit_title,
                  message: t
                      .app
                      .dialog
                      .confirm_submit_message,
                  confirmText:
                      t.app.dialog.confirm_yes,
                  cancelText: t.app.dialog.cancel,
                  icon: Icons.warning_amber_rounded,
                  onConfirm: () {
                    Navigator.pop(context);

                    const ticketNumber = 'LPR318728';
                    const pin = '228973';

                    context.router.push(
                      ReportSuccessRoute(
                        ticketNumber: ticketNumber,
                        pin: pin,
                        opdName: widget.opdName,
                      ),
                    );
                  },
                  onCancel: () => Navigator.pop(context),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
