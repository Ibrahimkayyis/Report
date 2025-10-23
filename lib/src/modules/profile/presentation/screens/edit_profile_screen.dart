// lib/src/modules/profile/presentation/screens/edit_profile_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/app_bar/app_primary_bar.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/info_section_card.dart';

@RoutePage()
class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(
        title: t.app.my_profile,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            // Profile Info Card
            ProfileInfoCard(
              name: 'Sri Wulandari',
              role: t.app.employee,
              imageAsset: null, // Set to null for default icon
            ),
            
            SizedBox(height: 16.h),
            
            // Personal Info Section
            InfoSectionCard(
              title: t.app.personal_info,
              editButtonLabel: t.app.edit,
              fields: {
                t.app.first_name: 'Sri',
                t.app.last_name: 'Wulandari',
                t.app.birth_date: '14-11-2000',
                t.app.email: 'sriwulandari@gmail.com',
                t.app.phone_number: '0877-5353-1524',
                t.app.address: 'Asemrowo, Surabaya',
              },
              onEdit: () {
                // TODO: Navigate to edit personal info
              },
            ),
            
            SizedBox(height: 16.h),
            
            // Work Info Section
            InfoSectionCard(
              title: t.app.work_info,
              editButtonLabel: t.app.edit,
              fields: {
                t.app.employee_id: '200011420230062053',
                t.app.hire_date: '18-06-2023',
                t.app.position: 'Pegawai',
                t.app.division: 'Divisi Sumber Daya Manusia',
              },
              onEdit: () {
                // TODO: Navigate to edit work info
              },
            ),
            
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}