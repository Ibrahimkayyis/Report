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
class EditProfileMasyarakatScreen extends StatefulWidget {
  final ProfileCubit profileCubit;
  const EditProfileMasyarakatScreen({super.key, required this.profileCubit});

  @override
  State<EditProfileMasyarakatScreen> createState() => _EditProfileMasyarakatScreenState();
}

class _EditProfileMasyarakatScreenState extends State<EditProfileMasyarakatScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  
  bool _isUpdatingPhoto = false;
  bool _isUpdatingInfo = false;
  bool _isDeletingPhoto = false;

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

  void _showSuccessDialog(String message) {
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
          widget.profileCubit.fetchProfile();
        },
      ),
    );
  }

  Future<void> _showImageSourceDialog(bool hasProfilePicture) async {
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
                    title: const Text("Hapus Foto", style: TextStyle(color: Colors.red)),
                    onTap: () async {
                      Navigator.pop(context);
                      _showDeleteConfirmation();
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showDeleteConfirmation() {
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

          setState(() {
            _isDeletingPhoto = true;
            _isUpdatingPhoto = false;
            _isUpdatingInfo = false;
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
        appBar: AppPrimaryBar(title: "Edit Profil Masyarakat", centerTitle: true),
        body: BlocConsumer<ProfileCubit, ProfileState>(
          listener: (context, state) {
            if (state is ProfileUpdated) {
              final msg = _isUpdatingPhoto
                  ? t.app.profile_photo_updated_success
                  : t.app.profile_info_updated_success;
              _showSuccessDialog(msg);
            } else if (state is ProfilePhotoDeleted) {
              _showSuccessDialog("Foto profil berhasil dihapus");
            } else if (state is ProfileError) {
              _showErrorSnackbar(state.message);

              setState(() {
                _isUpdatingPhoto = false;
                _isUpdatingInfo = false;
                _isDeletingPhoto = false;
                _selectedImage = null;
              });
            }
          },
          builder: (context, state) {
            // ALWAYS SHOW SHIMMER WHEN LOADING
            if (state is ProfileLoading) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    const ProfileInfoCardShimmer(),
                    SizedBox(height: 24.h),
                    const InfoSectionCardShimmer(),
                  ],
                ),
              );
            }

            // SAFE DATA
            final profile = (state is ProfileLoaded)
                ? state.profile
                : (state is ProfileUpdated)
                    ? state.profile
                    : (state is ProfilePhotoDeleted)
                        ? state.profile
                        : null;

            if (profile == null) {
              return const SizedBox.shrink();
            }

            final hasProfilePicture = profile.profileUrl != null && profile.profileUrl!.isNotEmpty;

            return SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ProfileInfoCard(
                        name: profile.fullName,
                        role: "MASYARAKAT",
                        imageAsset: _selectedImage?.path ?? profile.profileUrl,
                      ),
                      Positioned(
                        bottom: 10.h,
                        right: 20.w,
                        child: GestureDetector(
                          onTap: () => _showImageSourceDialog(hasProfilePicture),
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: const BoxDecoration(
                              color: ColorName.primary,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.camera_alt, color: Colors.white, size: 20.sp),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),

                  InfoSectionCard(
                    title: t.app.personal_info,
                    fields: {
                      t.app.first_name: profile.firstName ?? '-',
                      t.app.last_name: profile.lastName ?? '-',
                      t.app.email: profile.email,
                      t.app.phone_number: profile.phoneNumber ?? '-',
                      t.app.address: profile.address ?? '-',
                    },
                  ),
                  SizedBox(height: 24.h),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await AppEditProfileDialog.show(
                          context,
                          title: t.app.edit_profile_title,
                          firstName: profile.firstName ?? '',
                          lastName: profile.lastName ?? '',
                          email: profile.email,
                          phoneNumber: profile.phoneNumber ?? '',
                          address: profile.address ?? '',
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

                        if (!mounted || result == null) return;

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
                      },
                      icon: Icon(Icons.edit, size: 18.sp),
                      label: Text(t.app.edit_profile),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorName.primary,
                        foregroundColor: ColorName.background,
                        padding: EdgeInsets.symmetric(vertical: 14.h),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
