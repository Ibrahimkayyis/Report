import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/modules/reporting/domain/models/asset_model.dart';
import 'package:report/src/modules/reporting/presentation/cubits/asset/asset_cubit.dart';
import 'package:report/src/modules/reporting/presentation/cubits/asset/asset_state.dart';
import 'custom_asset_dropdown.dart';
import 'reporting_text_field.dart';

class AssetInfoSection extends StatelessWidget {
  final AssetModel? selectedDataAsset;
  final TextEditingController serialNumberController;
  final TextEditingController assetCategoryController;
  final TextEditingController assetSubcategoryController;
  final TextEditingController assetTypeController;
  final ValueChanged<AssetModel?> onDataAssetChanged;
  final Map<String, String?> errors;

  const AssetInfoSection({
    super.key,
    required this.selectedDataAsset,
    required this.serialNumberController,
    required this.assetCategoryController,
    required this.assetSubcategoryController,
    required this.assetTypeController,
    required this.onDataAssetChanged,
    required this.errors,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          t.validation.data_asset_label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorName.textPrimary,
          ),
        ),
        SizedBox(height: 8.h),
        
        // ✅ Custom Dropdown dengan Initial Items dan Handle Loading
        BlocBuilder<AssetCubit, AssetState>(
          builder: (context, state) {
            if (state is AssetLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final initialItems = state is AssetLoaded ? state.assets : <AssetModel>[];
            final assetCubit = context.read<AssetCubit>();

            return CustomAssetDropdown(
              selectedAsset: selectedDataAsset,
              initialItems: initialItems,
              hintText: 'Pilih Aset (Ketik untuk mencari)',
              errorText: errors['dataAsset'],
              onSearch: (query) async {
                if (query.isEmpty) {
                  return initialItems;
                }
                return await assetCubit.searchAssets(query);
              },
              onChanged: onDataAssetChanged,
            );
          },
        ),
        
        SizedBox(height: 24.h),
        
        // ReadOnly Fields
        ReportingTextField(
          label: t.validation.serial_number_label,
          hint: "Nomor Seri Otomatis",
          controller: serialNumberController,
          errorText: errors['serialNumber'],
          readOnly: true,
        ),
        SizedBox(height: 24.h),
        ReportingTextField(
          label: t.validation.asset_category,
          hint: "-",
          controller: assetCategoryController,
          errorText: errors['assetCategory'],
          readOnly: true,
        ),
        SizedBox(height: 24.h),
        Row(
          children: [
            Expanded(
              child: ReportingTextField(
                label: t.validation.asset_subcategory_label,
                hint: "-",
                controller: assetSubcategoryController,
                errorText: errors['assetSubcategory'],
                readOnly: true,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: ReportingTextField(
                label: t.validation.asset_type_label,
                hint: "-",
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