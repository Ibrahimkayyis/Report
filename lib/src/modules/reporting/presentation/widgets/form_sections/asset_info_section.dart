import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart'; // Import AppDropdownField dari core
import 'reporting_text_field.dart';

class AssetInfoSection extends StatelessWidget {
  final String? selectedDataAsset;
  final String? selectedSerialNumber;
  final List<String> dataAssetOptions;
  final List<String> serialNumberOptions;

  // Controllers
  final TextEditingController assetCategoryController;
  final TextEditingController assetSubcategoryController;
  final TextEditingController assetTypeController;

  // Callbacks
  final ValueChanged<String?> onDataAssetChanged;
  final ValueChanged<String?> onSerialNumberChanged;

  // Errors
  final Map<String, String?> errors;

  const AssetInfoSection({
    super.key,
    required this.selectedDataAsset,
    required this.selectedSerialNumber,
    required this.dataAssetOptions,
    required this.serialNumberOptions,
    required this.assetCategoryController,
    required this.assetSubcategoryController,
    required this.assetTypeController,
    required this.onDataAssetChanged,
    required this.onSerialNumberChanged,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Row: Data Aset + Nomor Seri
        Row(
          children: [
            Expanded(
              child: AppDropdownField(
                label: t.data_asset_label,
                value: selectedDataAsset,
                items: dataAssetOptions,
                onChanged: onDataAssetChanged,
                errorText: errors['dataAsset'],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: AppDropdownField(
                label: t.serial_number_label,
                value: selectedSerialNumber,
                items: serialNumberOptions,
                onChanged: onSerialNumberChanged,
                errorText: errors['serialNumber'],
              ),
            ),
          ],
        ),
        SizedBox(height: 24.h),

        // Kategori Aset (ReadOnly)
        ReportingTextField(
          label: t.asset_category_label,
          hint: t.asset_category_hint,
          controller: assetCategoryController,
          errorText: errors['assetCategory'],
          readOnly: true,
        ),
        SizedBox(height: 24.h),

        // Row: Sub-Kategori + Jenis (ReadOnly)
        Row(
          children: [
            Expanded(
              child: ReportingTextField(
                label: t.asset_subcategory_label,
                hint: t.asset_subcategory_hint,
                controller: assetSubcategoryController,
                errorText: errors['assetSubcategory'],
                readOnly: true,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReportingTextField(
                label: t.asset_type_label,
                hint: t.asset_type_hint,
                controller: assetTypeController,
                errorText: errors['assetType'],
                readOnly: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}