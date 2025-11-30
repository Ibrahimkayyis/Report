import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'profile_shimmer.dart';
import 'user_info_display.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<ProfileCubit>()..fetchProfile(),
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const ProfileShimmer();
            
          } else if (state is ProfileLoaded) {
            // Pastikan state.profile mengembalikan object ProfileModel
            return UserInfoDisplay(profile: state.profile);
            
          } else if (state is ProfileUpdated) {
             // Asumsi state ProfileUpdated juga memiliki property profile
             return UserInfoDisplay(profile: state.profile);
             
          } else if (state is ProfileError) {
            return Center(
              child: Text(
                "Gagal memuat profil: ${state.message}",
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}