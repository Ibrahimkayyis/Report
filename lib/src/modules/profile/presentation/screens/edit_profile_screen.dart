import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_cubit.dart';
import 'package:report/src/modules/profile/presentation/cubits/profile_state.dart';
import 'package:report/src/modules/profile/presentation/widgets/shimmer/info_section_card_shimmer.dart';
import 'package:report/src/modules/profile/presentation/widgets/shimmer/profile_info_card_shimmer.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/info_section_card.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  final ProfileCubit profileCubit;
  const EditProfileScreen({super.key, required this.profileCubit});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool _isUpdatingPhoto = false;

  void _showSuccessSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.check_circle_rounded,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Berhasil!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha:0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFF4CAF50),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(16.w),
        elevation: 6,
        duration: const Duration(seconds: 3),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha:0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_rounded,
                  color: Colors.white,
                  size: 24.sp,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Gagal!',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.white.withValues(alpha:0.9),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xFFE53935),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        margin: EdgeInsets.all(16.w),
        elevation: 6,
        duration: const Duration(seconds: 4),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      ),
    );
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    final t = context.t;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ListTile(
                  leading: const Icon(
                    Icons.photo_library,
                    color: ColorName.primary,
                  ),
                  title: Text(t.app.gallery),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.camera_alt,
                    color: ColorName.primary,
                  ),
                  title: Text(t.app.camera),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 85,
    );
    if (pickedFile != null && mounted) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isUpdatingPhoto = true;
      });

      context.read<ProfileCubit>().updateProfile(filePath: pickedFile.path);
    }
  }

  String _normalizeDateFormat(String? date) {
    if (date == null || date.isEmpty) return '';

    final isoPattern = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (isoPattern.hasMatch(date)) return date;

    final parts = date.split('-');
    if (parts.length == 3) {
      final day = parts[0];
      final month = parts[1];
      final year = parts[2];
      return '$year-$month-$day';
    }

    return date;
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    // ✅ gunakan BlocProvider.value agar cubit dari parent tetap digunakan
    return BlocProvider.value(
      value: widget.profileCubit,
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: t.app.my_profile, centerTitle: true),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              if (_isUpdatingPhoto) {
                _showSuccessSnackbar('Foto profil berhasil diperbarui');
              } else {
                _showSuccessSnackbar(t.app.profile_updated_success);
              }

              context.read<ProfileCubit>().fetchProfile();
              setState(() {
                _selectedImage = null;
                _isUpdatingPhoto = false;
              });
            } else if (state is ProfileError) {
              if (_isUpdatingPhoto) {
                _showErrorSnackbar('Gagal memperbarui foto profil');
              } else {
                _showErrorSnackbar(state.message);
              }

              setState(() {
                _isUpdatingPhoto = false;
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  if (state is ProfileLoading)
                    const ProfileInfoCardShimmer()
                  else if (state is ProfileLoaded)
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ProfileInfoCard(
                          name:
                              '${state.profile.firstName} ${state.profile.lastName}'
                                  .trim()
                                  .isEmpty
                              ? t.app.unknown_user
                              : '${state.profile.firstName} ${state.profile.lastName}'
                                    .trim(),
                          role:
                              (state.profile.roles.isNotEmpty
                                      ? state.profile.roles.first
                                      : t.app.employee)
                                  .toUpperCase(),
                          imageAsset: _selectedImage != null
                              ? _selectedImage!.path
                              : (state.profile.profileUrl.isNotEmpty
                                    ? state.profile.profileUrl
                                    : null),
                        ),
                        Positioned(
                          bottom: 10.h,
                          right: 20.w,
                          child: GestureDetector(
                            onTap: () => _showImageSourceDialog(context),
                            child: Container(
                              padding: EdgeInsets.all(8.w),
                              decoration: BoxDecoration(
                                color: ColorName.primary,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: ColorName.primary.withValues(alpha:0.3),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 20.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (state is ProfileError)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),

                  SizedBox(height: 16.h),

                  if (state is ProfileLoading)
                    const InfoSectionCardShimmer()
                  else if (state is ProfileLoaded)
                    InfoSectionCard(
                      title: t.app.personal_info,
                      fields: {
                        t.app.first_name: state.profile.firstName.isEmpty
                            ? '-'
                            : state.profile.firstName,
                        t.app.last_name: state.profile.lastName.isEmpty
                            ? '-'
                            : state.profile.lastName,
                        t.app.birth_date: state.profile.birthDate.isEmpty
                            ? '-'
                            : state.profile.birthDate,
                        t.app.email: state.profile.email.isEmpty
                            ? '-'
                            : state.profile.email,
                        t.app.phone_number: state.profile.phoneNumber.isEmpty
                            ? '-'
                            : state.profile.phoneNumber,
                        t.app.address: state.profile.address.isEmpty
                            ? '-'
                            : state.profile.address,
                      },
                      secondTabTitle: t.app.work_info,
                      secondTabFields: {
                        t.app.employee_id: state.profile.noEmployee.isEmpty
                            ? '-'
                            : state.profile.noEmployee,
                        t.app.hire_date: state.profile.startDate.isEmpty
                            ? '-'
                            : state.profile.startDate,
                        t.app.position: state.profile.jabatan.isEmpty
                            ? '-'
                            : state.profile.jabatan,
                        t.app.division: state.profile.division.isEmpty
                            ? '-'
                            : state.profile.division,
                      },
                    ),

                  SizedBox(height: 16.h),

                  if (state is ProfileLoaded)
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          final result = await AppEditProfileDialog.show(
                            context,
                            title: t.app.edit_profile_title,
                            firstName: state.profile.firstName,
                            lastName: state.profile.lastName,
                            birthDate: state.profile.birthDate,
                            email: state.profile.email,
                            phoneNumber: state.profile.phoneNumber,
                            address: state.profile.address,
                            labels: {
                              'first_name': t.app.first_name,
                              'last_name': t.app.last_name,
                              'birth_date': t.app.birth_date,
                              'email': t.app.email,
                              'phone_number': t.app.phone_number,
                              'address': t.app.address,
                            },
                            cancelText: t.app.cancel,
                            saveText: t.app.save,
                          );

                          if (result != null && context.mounted) {
                            setState(() {
                              _isUpdatingPhoto = false;
                            });

                            context.read<ProfileCubit>().updateProfile(
                              firstName: result['firstName'],
                              lastName: result['lastName'],
                              birthDate: _normalizeDateFormat(
                                result['birthDate'],
                              ),
                              phoneNumber: result['phoneNumber'],
                              address: result['address'],
                              filePath: _selectedImage?.path,
                            );
                          }
                        },
                        icon: Icon(Icons.edit, size: 18.sp),
                        label: Text(
                          t.app.edit_profile,
                          style: TextStyle(fontSize: 15.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorName.primary,
                          foregroundColor: ColorName.background,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          elevation: 2,
                        ),
                      ),
                    ),

                  SizedBox(height: 16.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
