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

    final displayName = profile.fullName;

    final displayNik = profile.nik?.isNotEmpty == true
        ? profile.nik!
        : "-";

    final displayDivisi = profile.roleName?.isNotEmpty == true
        ? profile.roleName!
        : "-";

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _InfoRow(label: t.name_label, value: displayName),
        SizedBox(height: 16.h),

        _InfoRow(label: t.nik_label, value: displayNik),
        SizedBox(height: 16.h),

        _InfoRow(label: "Divisi", value: displayDivisi),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label kiri
        SizedBox(
          width: 80.w, // supaya rapi seperti gambar
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorName.textPrimary,
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // Box abu kanan
        Expanded(
          child: Container(
            height: 40.h,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
