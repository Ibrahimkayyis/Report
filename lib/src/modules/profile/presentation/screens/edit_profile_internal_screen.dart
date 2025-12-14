import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/info_section_card.dart';

@RoutePage()
class EditProfileInternalScreen extends StatelessWidget {
  final ProfileCubit profileCubit;
  const EditProfileInternalScreen({super.key, required this.profileCubit});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider.value(
      value: profileCubit,
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: "Data Kepegawaian", centerTitle: true),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is ProfileLoaded) {
              final p = state.profile;
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    // 1. Header (Read Only)
                    ProfileInfoCard(
                      name: p.fullName,
                      role: (p.roleName ?? t.app.employee).toUpperCase(),
                      imageAsset: p.profileUrl,
                    ),
                    SizedBox(height: 24.h),

                    // 2. Info Section
                    InfoSectionCard(
                      title: 'Detail Kepegawaian',
                      fields: {
                        'Nama Lengkap': p.fullName,
                        t.app.email: p.email,
                        'Username/NIP': p.usernameAsset ?? '-',
                        'Instansi/Dinas': p.dinasName ?? '-',
                        'Unit Kerja': p.unitKerja ?? '-',
                        t.app.address: p.address ?? '-',
                      },
                    ),
                    SizedBox(height: 24.h),

                    // 3. Info Text
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: Colors.blue.shade100),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.info_outline, color: Colors.blue),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Text(
                              "Data kepegawaian dikelola oleh administrator sistem. Hubungi admin dinas jika terdapat kesalahan data.",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.blue.shade900,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}