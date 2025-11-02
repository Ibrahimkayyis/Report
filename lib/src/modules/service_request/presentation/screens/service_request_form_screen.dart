import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/service_request/domain/models/service_request_texts.dart';
import 'package:report/src/modules/service_request/domain/models/service_type.dart';

@RoutePage()
class ServiceRequestFormScreen extends StatefulWidget {
  final ServiceType serviceType;

  const ServiceRequestFormScreen({super.key, required this.serviceType});

  @override
  State<ServiceRequestFormScreen> createState() =>
      _ServiceRequestFormScreenState();
}

class _ServiceRequestFormScreenState extends State<ServiceRequestFormScreen> {
  final _problemController = TextEditingController();
  final _additionalInfoController = TextEditingController();

  // String? _selectedPriority;
  String? _dropdown1Value;
  String? _dropdown2Value;
  String? _deviceCount;

  final _userName = "Sri Wulandari";
  final _userNip = "200011420230062053";
  final _userDivision = "Divisi Teknologi Informasi";

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final texts = ServiceRequestTexts.of(widget.serviceType, t);

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: texts.title),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppFormUserInfo(
                    name: _userName,
                    nip: _userNip,
                    division: _userDivision,
                  ),
                  SizedBox(height: 24.h),

                  // dynamic fields
                  _buildDynamicFields(texts),

                  SizedBox(height: 24.h),
                  AppFormProblemDescription(
                    controller: _problemController,
                    title: texts.problemLabel,
                    hint: texts.problemHint,
                  ),
                  // SizedBox(height: 24.h),
                  // AppFormPrioritySelector(
                  //   selected: _selectedPriority,
                  //   onSelected: (val) => setState(() => _selectedPriority = val),
                  //   title: texts.priorityLabel,
                  // ),
                  // SizedBox(height: 24.h),
                  AppFormAttachFile(title: texts.attachFileLabel),
                  SizedBox(height: 24.h),
                  AppFormAdditionalInfo(
                    controller: _additionalInfoController,
                    title: texts.additionalInfoLabel,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          AppFormBottomActions(
            onCancel: () => context.router.pop(),
            onSaveDraft: () {},
            onSubmit: () {
              final t = context.t;

              showDialog(
                context: context,
                builder: (context) => AppConfirmationDialog(
                  title: t.app
                      .dialog
                      .confirm_submit_title, // ex: "Apakah Anda yakin ingin mengirim?"
                  message: t.app
                      .dialog
                      .confirm_submit_message, // ex: "Cek kembali inputan Anda sebelum mengirim!"
                  confirmText: t.app.dialog.confirm_yes, // ex: "Ya, saya yakin!"
                  cancelText: t.app.dialog.cancel, // ex: "Batalkan"
                  icon: Icons.warning_amber_rounded,
                  onConfirm: () {
                    Navigator.pop(context);

                    final ticketNumber =
                        "SR-${DateTime.now().millisecondsSinceEpoch}";
                    const pin = "982134";
                    final typeName = widget.serviceType.title;

                    context.router.push(
                      ServiceRequestSuccessRoute(
                        ticketNumber: ticketNumber,
                        status: pin,
                        requestType: typeName,
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

  Widget _buildDynamicFields(ServiceRequestTexts texts) {
    final t = context.t;
    switch (widget.serviceType) {
      case ServiceType.resetPassword:
        return AppDropdownField(
          label: texts.field1Label ?? t.app.select_device_label,
          value: _dropdown1Value,
          items: ['Laptop', 'PC', 'Mobile'],
          onChanged: (val) => setState(() => _dropdown1Value = val),
        );
      case ServiceType.systemAccess:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdownField(
              label: texts.field1Label ?? t.app.select_system_label,
              value: _dropdown1Value,
              items: ['Email', 'E-Office', 'E-Surat', 'SIPD'],
              onChanged: (val) => setState(() => _dropdown1Value = val),
            ),
            SizedBox(height: 16.h),
            AppDropdownField(
              label: texts.field2Label ?? t.app.select_access_type_label,
              value: _dropdown2Value,
              items: ['Viewer', 'Editor', 'Admin'],
              onChanged: (val) => setState(() => _dropdown2Value = val),
            ),
          ],
        );
      case ServiceType.deviceRequest:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppDropdownField(
              label: texts.field1Label ?? t.app.select_device_type_label,
              value: _dropdown1Value,
              items: ['Laptop', 'Printer', 'Monitor'],
              onChanged: (val) => setState(() => _dropdown1Value = val),
            ),
            SizedBox(height: 16.h),
            Text(
              texts.field3Label ?? t.app.device_count_label,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorName.textPrimary,
              ),
            ),
            SizedBox(height: 6.h),
            AppNumberField(
              value: _deviceCount,
              onChanged: (val) => setState(() => _deviceCount = val),
            ),
          ],
        );
    }
  }
}
