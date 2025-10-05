import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';

import '../widgets/reporting_form/reporting_form_opd_display.dart';
import '../widgets/reporting_form/reporting_form_reporter_data.dart';
import '../widgets/reporting_form/reporting_form_report_category.dart';
import '../widgets/reporting_form/reporting_form_problem_description.dart';
import '../widgets/reporting_form/reporting_form_priority_level.dart';
import '../widgets/reporting_form/reporting_form_attach_file.dart';
import '../widgets/reporting_form/reporting_form_additional_info.dart';
import '../widgets/reporting_form/reporting_form_bottom_actions.dart';

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
  String? _selectedPriority;

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
      appBar: AppBar(
        backgroundColor: ColorName.primary,
        foregroundColor: ColorName.onPrimary,
        title: Text(
          t.app.online_reporting_title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // OPD Selection Display
                  ReportingFormOpdDisplay(
                    opdName: widget.opdName,
                    opdIcon: widget.opdIcon,
                    opdColor: widget.opdColor,
                  ),

                  SizedBox(height: 24.h),

                  // Reporter Data
                  ReportingFormReporterData(
                    name: _userName,
                    nip: _userNip,
                    division: _userDivision,
                  ),

                  SizedBox(height: 24.h),

                  // Report Category
                  ReportingFormReportCategory(
                    selectedCategory: _selectedCategory,
                    onCategorySelected: (val) {
                      setState(() => _selectedCategory = val);
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Problem Description
                  ReportingFormProblemDescription(
                    controller: _problemController,
                  ),

                  SizedBox(height: 24.h),

                  // Priority Level
                  ReportingFormPriorityLevel(
                    selectedPriority: _selectedPriority,
                    onPrioritySelected: (val) {
                      setState(() => _selectedPriority = val);
                    },
                  ),

                  SizedBox(height: 24.h),

                  // Attach File
                  const ReportingFormAttachFile(),

                  SizedBox(height: 24.h),

                  // Additional Information
                  ReportingFormAdditionalInfo(
                    controller: _additionalInfoController,
                  ),

                  SizedBox(height: 20.h), // space for bottom buttons
                ],
              ),
            ),
          ),

          // Bottom Buttons
          ReportingFormBottomActions(
            onCancel: () => context.router.pop(),
            onSaveDraft: () {
              // TODO: Save draft
            },
            onSubmit: () {
              // TODO: Submit ke API
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
          ),
        ],
      ),
    );
  }
}
