import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
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
          child: Builder(
            builder: (context) {
              return RefreshIndicator(
                onRefresh: () async {
                  await context.read<ProfileCubit>().fetchProfile();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      // =======================================================
                      // BAGIAN 1: HEADER (Dynamic State)
                      // =======================================================
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          if (state is ProfileLoading) {
                            return const ProfileHeaderShimmer();
                          } 
                          
                          else if (state is ProfileLoaded) {
                            final profile = state.profile;
                            
                            // Safe Name
                            final fullName = profile.fullName.trim().isNotEmpty 
                                ? profile.fullName 
                                : (profile.firstName ?? '') + ' ' + (profile.lastName ?? '');
                                
                            // Safe Image
                            final hasImage = profile.profileUrl != null && 
                                             profile.profileUrl!.isNotEmpty;

                            return ProfileHeader(
                              name: fullName.trim().isNotEmpty ? fullName : 'User',
                              email: profile.email,
                              imageAsset: hasImage ? profile.profileUrl : null,
                              
                              // ✅ Pass New Fields
                              dinas: profile.dinasName,
                              unitKerja: profile.unitKerja,
                            );
                          } 
                          
                          else if (state is ProfileError) {
                            return Container(
                              margin: EdgeInsets.only(top: 20.h, bottom: 20.h),
                              child: AppErrorState.general(
                                context: context,
                                message: state.message,
                                onRetry: () {
                                  context.read<ProfileCubit>().fetchProfile();
                                },
                              ),
                            );
                          }
                          
                          return const SizedBox.shrink();
                        },
                      ),

                      SizedBox(height: 8.h),

                      // =======================================================
                      // BAGIAN 2: MENU LIST
                      // =======================================================
                      ProfileMenuList(
                        profileCubit: context.read<ProfileCubit>(),
                      ),

                      SizedBox(height: 24.h),
                    ],
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