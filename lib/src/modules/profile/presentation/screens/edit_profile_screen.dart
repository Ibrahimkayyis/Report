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
  bool _isUpdatingInfo = false;

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFE53935),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
        margin: EdgeInsets.all(16.w),
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
                  leading: const Icon(Icons.photo_library, color: ColorName.primary),
                  title: Text(t.app.gallery),
                  onTap: () async {
                    Navigator.pop(context);
                    await _pickImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: ColorName.primary),
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
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 85);
    if (pickedFile != null && mounted) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isUpdatingPhoto = true;
        _isUpdatingInfo = false;
      });

      widget.profileCubit.updateProfile(filePath: pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return BlocProvider.value(
      value: widget.profileCubit,
      child: Scaffold(
        backgroundColor: ColorName.background,
        appBar: AppPrimaryBar(title: t.app.my_profile, centerTitle: true),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              String successMessage;
              if (_isUpdatingPhoto) {
                successMessage = t.app.profile_photo_updated_success;
              } else if (_isUpdatingInfo) {
                successMessage = t.app.profile_info_updated_success;
              } else {
                successMessage = t.app.profile_updated_success;
              }

              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (dialogContext) => AppGlobalSuccessDialog(
                  title: successMessage,
                  buttonText: t.app.dialog.report_success_button,
                  onPressed: () {
                    Navigator.of(dialogContext).pop();
                    
                    widget.profileCubit.fetchProfile();
                    
                    setState(() {
                      _selectedImage = null;
                      _isUpdatingPhoto = false;
                      _isUpdatingInfo = false;
                    });
                  },
                ),
              );
            } else if (state is ProfileError) {
              if (_isUpdatingPhoto) {
                _showErrorSnackbar(t.app.profile_photo_update_failed);
              } else if (_isUpdatingInfo) {
                _showErrorSnackbar(t.app.profile_info_update_failed);
              } else {
                _showErrorSnackbar(state.message);
              }
              
              setState(() {
                _isUpdatingPhoto = false;
                _isUpdatingInfo = false;
              });
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // 1. HEADER - Profile Photo Section
                  if (state is ProfileLoading)
                    const ProfileInfoCardShimmer()
                  else if (state is ProfileLoaded)
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        ProfileInfoCard(
                          name: state.profile.fullName.isNotEmpty 
                              ? state.profile.fullName 
                              : t.app.unknown_user,
                          role: (state.profile.roleName ?? t.app.employee).toUpperCase(),
                          imageAsset: _selectedImage != null
                              ? _selectedImage!.path
                              : (state.profile.profileUrl?.isNotEmpty ?? false
                                  ? state.profile.profileUrl
                                  : null),
                        ),
                        
                        // Camera Button (Only for Masyarakat)
                        // Pegawai/Teknisi data foto dari server pusat (Read Only)
                        if (state.profile.roleName?.toLowerCase() == 'masyarakat')
                          Positioned(
                            bottom: 10.h,
                            right: 20.w,
                            child: GestureDetector(
                              onTap: () => _showImageSourceDialog(context),
                              child: Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: ColorName.primary,
                                  shape: BoxShape.circle,
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

                  // 2. INFO SECTION - Data Diri
                  if (state is ProfileLoading)
                    const InfoSectionCardShimmer()
                  else if (state is ProfileLoaded)
                    Builder(
                      builder: (context) {
                        final p = state.profile;
                        final isMasyarakat = p.roleName?.toLowerCase() == 'masyarakat';
                        
                        // Menyiapkan data fields sesuai Role
                        final Map<String, String> infoFields = {};

                        // Common Fields
                        infoFields[t.app.email] = p.email;

                        if (isMasyarakat) {
                          // MASYARAKAT
                          infoFields[t.app.first_name] = p.firstName ?? '-';
                          infoFields[t.app.last_name] = p.lastName ?? '-';
                          infoFields[t.app.phone_number] = p.phoneNumber ?? '-';
                          infoFields[t.app.address] = p.address ?? '-';
                        } else {
                          // PEGAWAI / TEKNISI (INTERNAL)
                          // Tampilkan data kepegawaian
                          infoFields['Nama Lengkap'] = p.fullName; // Full name lebih cocok untuk pegawai
                          infoFields['Username/NIP'] = p.usernameAsset ?? '-';
                          infoFields['Instansi/Dinas'] = p.dinasName ?? '-';
                          infoFields['Unit Kerja'] = p.unitKerja ?? '-';
                          infoFields[t.app.address] = p.address ?? '-'; // Alamat kantor/personal jika ada
                        }

                        return InfoSectionCard(
                          title: isMasyarakat ? t.app.personal_info : 'Data Kepegawaian',
                          fields: infoFields,
                        );
                      },
                    ),

                  SizedBox(height: 16.h),

                  // 3. EDIT BUTTON (ONLY FOR MASYARAKAT)
                  // Pegawai/Teknisi tidak bisa edit data via mobile app
                  if (state is ProfileLoaded && 
                      state.profile.roleName?.toLowerCase() == 'masyarakat')
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          // Tampilkan dialog edit dengan data saat ini
                          final result = await AppEditProfileDialog.show(
                            context,
                            title: t.app.edit_profile_title,
                            firstName: state.profile.firstName ?? '',
                            lastName: state.profile.lastName ?? '',
                            email: state.profile.email,
                            phoneNumber: state.profile.phoneNumber ?? '',
                            address: state.profile.address ?? '',
                            labels: {
                              'first_name': t.app.first_name,
                              'last_name': t.app.last_name,
                              'email': t.app.email,
                              'phone_number': t.app.phone_number,
                              'address': t.app.address,
                            },
                            cancelText: t.app.cancel,
                            saveText: t.app.save,
                          );

                          if (result != null && context.mounted) {
                            setState(() {
                              _isUpdatingInfo = true;
                              _isUpdatingPhoto = false;
                            });
                            
                            // Panggil Cubit untuk update data ke API
                            widget.profileCubit.updateProfile(
                              firstName: result['firstName'],
                              lastName: result['lastName'],
                              phoneNumber: result['phoneNumber'],
                              address: result['address'],
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
                        ),
                      ),
                    ),

                  // Optional: Info Text for Internal Users
                  if (state is ProfileLoaded && 
                      state.profile.roleName?.toLowerCase() != 'masyarakat')
                    Padding(
                      padding: EdgeInsets.only(top: 16.h),
                      child: Text(
                        "Data kepegawaian dikelola oleh administrator sistem. Hubungi admin jika terdapat kesalahan data.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey.shade500,
                          fontStyle: FontStyle.italic,
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