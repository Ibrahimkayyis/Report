import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:report/gen/colors.gen.dart';

class ImageSourceBottomSheet extends StatelessWidget {
  final String galleryText;
  final String cameraText;
  final void Function(ImageSource source) onSourceSelected;

  const ImageSourceBottomSheet({
    super.key,
    required this.galleryText,
    required this.cameraText,
    required this.onSourceSelected,
  });

  static Future<void> show(
    BuildContext context, {
    required String galleryText,
    required String cameraText,
    required void Function(ImageSource source) onSourceSelected,
  }) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (_) => ImageSourceBottomSheet(
        galleryText: galleryText,
        cameraText: cameraText,
        onSourceSelected: (source) {
          Navigator.pop(context);
          onSourceSelected(source);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SourceOption(
              icon: Icons.photo_library,
              text: galleryText,
              onTap: () => onSourceSelected(ImageSource.gallery),
            ),
            _SourceOption(
              icon: Icons.camera_alt,
              text: cameraText,
              onTap: () => onSourceSelected(ImageSource.camera),
            ),
          ],
        ),
      ),
    );
  }
}

class _SourceOption extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _SourceOption({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: ColorName.primary),
      title: Text(text),
      onTap: onTap,
    );
  }
}