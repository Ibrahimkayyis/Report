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
                        ProfileMenuList(
                          profileCubit: context.read<ProfileCubit>(),
                        ),

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

// TEST HELPER FAB BUTTON IMPLEMENTATION


// @RoutePage()
// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => sl<ProfileCubit>()..fetchProfile(),
//       child: Scaffold(
//         backgroundColor: ColorName.background,

//         // ⭐️ 1. HAPUS property 'floatingActionButton' DARI SINI

//         body: SafeArea(
//           // ⭐️ 2. GANTI CHILD DARI SAFEAREA MENJADI STACK
//           child: Stack(
//             children: [
//               // ⭐️ 3. CHILD PERTAMA STACK ADALAH KONTEN LAMA ANDA
//               BlocBuilder<ProfileCubit, ProfileState>(
//                 builder: (context, state) {
//                   return RefreshIndicator(
//                     onRefresh: () async {
//                       await context.read<ProfileCubit>().fetchProfile();
//                     },
//                     child: SingleChildScrollView(
//                       physics: const AlwaysScrollableScrollPhysics(),
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20.w),
//                         child: Column(
//                           children: [
//                             // ✅ Profile Header
//                             if (state is ProfileLoading)
//                               const ProfileHeaderShimmer()
//                             else if (state is ProfileLoaded)
//                               ProfileHeader(
//                                 name:
//                                     '${state.profile.firstName} ${state.profile.lastName}'
//                                         .trim(),
//                                 email: state.profile.email,
//                                 imageAsset: state.profile.profileUrl.isNotEmpty
//                                     ? state.profile.profileUrl
//                                     : null,
//                               )
//                             else if (state is ProfileError)
//                               Padding(
//                                 padding: EdgeInsets.symmetric(vertical: 40.h),
//                                 child: Text(
//                                   state.message,
//                                   style: const TextStyle(color: Colors.red),
//                                 ),
//                               ),

//                             SizedBox(height: 8.h),

//                             // ✅ Menu List
//                             ProfileMenuList(profileCubit: context.read<ProfileCubit>()),

//                             SizedBox(height: 24.h),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),

//               // ⭐️ 4. CHILD KEDUA STACK ADALAH TOMBOL FAB ANDA
//               // KITA GUNAKAN 'Positioned' UNTUK MENGATUR POSISI
//               if (kDebugMode)
//                 Positioned(
//                   // Atur posisi sesuai keinginan Anda
//                   bottom: 80.h, // <-- NAIKKAN POSISI DARI BAWAH
//                   right: 20.w,
//                   child: FloatingActionButton.extended(
//                     onPressed: () {
//                       context.router.push(const TestHelperRoute());
//                     },
//                     label: const Text('Dev Test'),
//                     icon: const Icon(Icons.science),
//                     backgroundColor: Colors.orange,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }