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
  bool _isDeletingPhoto = false;

  // ✅ Simpan data profil saat ini untuk mencegah data hilang saat loading
  String? _cachedRoleName;
  String? _cachedProfileUrl;

  @override
  void initState() {
    super.initState();
    _cacheCurrentProfile();
  }

  // ✅ Cache profil data dari state awal
  void _cacheCurrentProfile() {
    final state = widget.profileCubit.state;
    if (state is ProfileLoaded) {
      _cachedRoleName = state.profile.roleName;
      _cachedProfileUrl = state.profile.profileUrl;
    } else if (state is ProfileUpdated) {
      _cachedRoleName = state.profile.roleName;
      _cachedProfileUrl = state.profile.profileUrl;
    }
  }

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

  Future<void> _showImageSourceDialog(BuildContext context, bool hasProfilePicture) async {
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
                if (hasProfilePicture)
                  ListTile(
                    leading: const Icon(Icons.delete_outline, color: Colors.red),
                    title: Text(
                      "Hapus Foto", 
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
                    ),
                    onTap: () async {
                      Navigator.pop(context);
                      _showDeleteConfirmation(context);
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AppConfirmationDialog(
        title: "Hapus Foto Profil?",
        message: "Foto profil Anda akan dihapus secara permanen.",
        confirmText: "Hapus",
        cancelText: "Batal",
        icon: Icons.delete_forever,
        onConfirm: () {
          Navigator.pop(ctx);
          
          // ✅ Cache data sebelum delete
          _cacheCurrentProfile();
          
          setState(() {
            _isDeletingPhoto = true;
            _isUpdatingPhoto = false;
            _isUpdatingInfo = false;
            _selectedImage = null; // Clear selected image
          });
          
          widget.profileCubit.deletePhoto();
        },
        onCancel: () => Navigator.pop(ctx),
      ),
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 85);
    if (pickedFile != null && mounted) {
      // ✅ Cache data sebelum update
      _cacheCurrentProfile();
      
      setState(() {
        _selectedImage = File(pickedFile.path);
        _isUpdatingPhoto = true;
        _isUpdatingInfo = false;
        _isDeletingPhoto = false;
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

              _showSuccessDialog(context, successMessage);
            } 
            else if (state is ProfilePhotoDeleted) {
              _showSuccessDialog(context, "Foto profil berhasil dihapus");
            }
            else if (state is ProfileError) {
              if (_isUpdatingPhoto) {
                _showErrorSnackbar(t.app.profile_photo_update_failed);
              } else if (_isUpdatingInfo) {
                _showErrorSnackbar(t.app.profile_info_update_failed);
              } else if (_isDeletingPhoto) {
                _showErrorSnackbar("Gagal menghapus foto profil");
              } else {
                _showErrorSnackbar(state.message);
              }
              
              setState(() {
                _isUpdatingPhoto = false;
                _isUpdatingInfo = false;
                _isDeletingPhoto = false;
                _selectedImage = null;
              });
            }
          },
          builder: (context, state) {
            // ✅ Ambil role dari cache jika sedang loading
            String? currentRole = _cachedRoleName;
            String? currentProfileUrl = _cachedProfileUrl;
            
            // Update cache jika ada state baru
            if (state is ProfileLoaded) {
              currentRole = state.profile.roleName;
              currentProfileUrl = state.profile.profileUrl;
              _cachedRoleName = currentRole;
              _cachedProfileUrl = currentProfileUrl;
            } else if (state is ProfileUpdated) {
              currentRole = state.profile.roleName;
              currentProfileUrl = state.profile.profileUrl;
              _cachedRoleName = currentRole;
              _cachedProfileUrl = currentProfileUrl;
            } else if (state is ProfilePhotoDeleted) {
              currentRole = state.profile.roleName;
              currentProfileUrl = state.profile.profileUrl;
              _cachedRoleName = currentRole;
              _cachedProfileUrl = currentProfileUrl;
            }

            // Helper untuk cek apakah user punya foto
            bool hasProfilePicture = currentProfileUrl != null && 
                                    currentProfileUrl.isNotEmpty;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // 1. HEADER - Profile Photo Section
                  if (state is ProfileLoading)
                    const ProfileInfoCardShimmer()
                  else if (state is ProfileLoaded || state is ProfileUpdated || state is ProfilePhotoDeleted)
                    Builder(
                      builder: (context) {
                        final profile = (state is ProfileLoaded) ? state.profile 
                                      : (state is ProfileUpdated) ? state.profile
                                      : (state is ProfilePhotoDeleted) ? state.profile 
                                      : null;
                        
                        if (profile == null) return const SizedBox();

                        // ✅ Gunakan role dari cache, bukan dari profile yang mungkin null
                        final displayRole = profile.roleName ?? currentRole ?? t.app.employee;

                        return Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            ProfileInfoCard(
                              name: profile.fullName.isNotEmpty 
                                  ? profile.fullName 
                                  : t.app.unknown_user,
                              role: displayRole.toUpperCase(),
                              // ✅ Prioritas: selected image > profile URL > null
                              imageAsset: _isDeletingPhoto 
                                  ? null 
                                  : (_selectedImage != null
                                      ? _selectedImage!.path
                                      : (profile.profileUrl?.isNotEmpty ?? false
                                          ? profile.profileUrl
                                          : null)),
                            ),
                            
                            // Camera Button (Only for Masyarakat)
                            if (displayRole.toLowerCase() == 'masyarakat')
                              Positioned(
                                bottom: 10.h,
                                right: 20.w,
                                child: GestureDetector(
                                  onTap: () => _showImageSourceDialog(
                                    context, 
                                    hasProfilePicture
                                  ),
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
                        );
                      }
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
                  else if (state is ProfileLoaded || state is ProfileUpdated || state is ProfilePhotoDeleted)
                    Builder(
                      builder: (context) {
                        final p = (state is ProfileLoaded) ? state.profile 
                                : (state is ProfileUpdated) ? state.profile
                                : (state is ProfilePhotoDeleted) ? state.profile
                                : null;
                                
                        if (p == null) return const SizedBox();

                        // ✅ Gunakan role dari cache
                        final displayRole = p.roleName ?? currentRole ?? '';
                        final isMasyarakat = displayRole.toLowerCase() == 'masyarakat';
                        final Map<String, String> infoFields = {};

                        infoFields[t.app.email] = p.email;

                        if (isMasyarakat) {
                          infoFields[t.app.first_name] = p.firstName ?? '-';
                          infoFields[t.app.last_name] = p.lastName ?? '-';
                          infoFields[t.app.phone_number] = p.phoneNumber ?? '-';
                          infoFields[t.app.address] = p.address ?? '-';
                        } else {
                          infoFields['Nama Lengkap'] = p.fullName;
                          infoFields['Username/NIP'] = p.usernameAsset ?? '-';
                          infoFields['Instansi/Dinas'] = p.dinasName ?? '-';
                          infoFields['Unit Kerja'] = p.unitKerja ?? '-';
                          infoFields[t.app.address] = p.address ?? '-';
                        }

                        return InfoSectionCard(
                          title: isMasyarakat ? t.app.personal_info : 'Data Kepegawaian',
                          fields: infoFields,
                        );
                      },
                    ),

                  SizedBox(height: 16.h),

                  // 3. EDIT BUTTON (ONLY FOR MASYARAKAT)
                  Builder(
                    builder: (context) {
                       final state = context.watch<ProfileCubit>().state;
                       String? role;
                       
                       if (state is ProfileLoaded) role = state.profile.roleName;
                       if (state is ProfileUpdated) role = state.profile.roleName;
                       if (state is ProfilePhotoDeleted) role = state.profile.roleName;
                       
                       // ✅ Fallback ke cached role
                       role = role ?? currentRole;

                       if (role?.toLowerCase() == 'masyarakat') {
                         String fName = '', lName = '', phone = '', addr = '', mail = '';
                         
                         if (state is ProfileLoaded) {
                           fName = state.profile.firstName ?? '';
                           lName = state.profile.lastName ?? '';
                           phone = state.profile.phoneNumber ?? '';
                           addr = state.profile.address ?? '';
                           mail = state.profile.email;
                         }
                         if (state is ProfileUpdated) {
                           fName = state.profile.firstName ?? '';
                           lName = state.profile.lastName ?? '';
                           phone = state.profile.phoneNumber ?? '';
                           addr = state.profile.address ?? '';
                           mail = state.profile.email;
                         }
                         if (state is ProfilePhotoDeleted) {
                           fName = state.profile.firstName ?? '';
                           lName = state.profile.lastName ?? '';
                           phone = state.profile.phoneNumber ?? '';
                           addr = state.profile.address ?? '';
                           mail = state.profile.email;
                         }

                         return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final result = await AppEditProfileDialog.show(
                                context,
                                title: t.app.edit_profile_title,
                                firstName: fName,
                                lastName: lName,
                                email: mail,
                                phoneNumber: phone,
                                address: addr,
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
                                // ✅ Cache sebelum update
                                _cacheCurrentProfile();
                                
                                setState(() {
                                  _isUpdatingInfo = true;
                                  _isUpdatingPhoto = false;
                                  _isDeletingPhoto = false;
                                });
                                
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
                        );
                       }
                       
                       return const SizedBox();
                    }
                  ),

                  // Info Text for Internal Users
                  Builder(
                    builder: (context) {
                       final state = context.watch<ProfileCubit>().state;
                       String? role;
                       
                       if (state is ProfileLoaded) role = state.profile.roleName;
                       if (state is ProfileUpdated) role = state.profile.roleName;
                       if (state is ProfilePhotoDeleted) role = state.profile.roleName;
                       
                       // ✅ Fallback ke cached role
                       role = role ?? currentRole;

                       if (role != null && role.toLowerCase() != 'masyarakat') {
                         return Padding(
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
                        );
                       }
                       return const SizedBox();
                    }
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

  void _showSuccessDialog(BuildContext context, String message) {
    final t = context.t;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AppGlobalSuccessDialog(
        title: message,
        buttonText: t.app.dialog.report_success_button,
        onPressed: () {
          Navigator.of(dialogContext).pop();
          
          setState(() {
            _selectedImage = null;
            _isUpdatingPhoto = false;
            _isUpdatingInfo = false;
            _isDeletingPhoto = false;
          });
        },
      ),
    );
  }
}