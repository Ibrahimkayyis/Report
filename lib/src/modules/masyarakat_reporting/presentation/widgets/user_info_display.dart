import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/profile/domain/models/profile_model.dart';

class UserInfoDisplay extends StatelessWidget {
  final ProfileModel profile;

  const UserInfoDisplay({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.masyarakat;    
    final fullName = '${profile.firstName} ${profile.lastName}'.trim();
    final displayName = fullName.isNotEmpty ? fullName : '-';
    final displayNik = profile.noEmployee.isNotEmpty ? profile.noEmployee : '-';
    final displayEmail = profile.email.isNotEmpty ? profile.email : '-';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ReadOnlyField(label: t.name_label, value: displayName),
        SizedBox(height: 16.h),
        _ReadOnlyField(label: t.nik_label, value: displayNik),
        SizedBox(height: 16.h),
        _ReadOnlyField(label: t.email_label, value: displayEmail),
      ],
    );
  }
}

class _ReadOnlyField extends StatelessWidget {
  final String label;
  final String value;

  const _ReadOnlyField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 6.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 14.sp, color: ColorName.textPrimary),
          ),
        ),
      ],
    );
  }
}