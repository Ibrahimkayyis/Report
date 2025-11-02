// lib/src/modules/profile/presentation/screens/profile_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'package:report/src/modules/profile/presentation/widgets/shimmer/profile_header_shimmer.dart';
import 'package:report/src/modules/profile/presentation/widgets/profile_header.dart';
import 'package:report/src/modules/profile/presentation/widgets/profile_menu_list.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>()..fetchProfile(),
      child: Scaffold(
        backgroundColor: ColorName.background,
        body: SafeArea(
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<ProfileCubit>().fetchProfile();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        // ✅ Profile Header — dynamic loading shimmer
                        if (state is ProfileLoading)
                          const ProfileHeaderShimmer()
                        else if (state is ProfileLoaded)
                          ProfileHeader(
                            name:
                                '${state.profile.firstName} ${state.profile.lastName}'
                                    .trim(),
                            email: state.profile.email,
                            imageAsset: state.profile.profileUrl.isNotEmpty
                                ? state.profile.profileUrl
                                : null,
                          )
                        else if (state is ProfileError)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 40.h),
                            child: Text(
                              state.message,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),

                        SizedBox(height: 8.h),

                        // ✅ Menu List — now receives active cubit
                        ProfileMenuList(profileCubit: context.read<ProfileCubit>()),

                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
