import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ActivityHeader extends StatelessWidget {
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onFilterChanged;

  const ActivityHeader({
    super.key,
    this.onSearchChanged,
    this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.report_activity;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔍 Search Field
          TextField(
            onChanged: onSearchChanged,
            decoration: InputDecoration(
              hintText: t.search_placeholder,
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: ColorName.black.withValues(alpha:0.2)),
              ),
              filled: true,
              fillColor: ColorName.white,
            ),
          ),

          SizedBox(height: 12.h),

          /// 🔽 Dropdown filters row
          Row(
            children: [
              /// Filter Status Dropdown
              Expanded(
                child: _DropdownFilter(
                  icon: Icons.filter_alt_outlined,
                  hint: t.filter,
                  items: [
                    t.filter_all,
                    t.filter_open,
                    t.filter_in_progress,
                    t.filter_resolved,
                    t.filter_closed,
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// Type Dropdown
              Expanded(
                child: _DropdownFilter(
                  icon: Icons.category_outlined,
                  hint: t.type,
                  items: [
                    t.filter_all,
                    t.type_incident,
                    t.type_service_request,
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// Burger menu (optional actions in the future)
              Container(
                width: 42.w,
                height: 42.h,
                decoration: BoxDecoration(
                  color: ColorName.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: PopupMenuButton<String>(
                  color: ColorName.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  icon: Icon(Icons.more_vert, color: ColorName.onPrimary, size: 22.sp),
                  onSelected: (_) {},
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'mark_all',
                      child: Text(t.filter_all),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 🔽 Dropdown reusable widget
class _DropdownFilter extends StatefulWidget {
  final IconData icon;
  final String hint;
  final List<String> items;

  const _DropdownFilter({
    required this.icon,
    required this.hint,
    required this.items,
  });

  @override
  State<_DropdownFilter> createState() => _DropdownFilterState();
}

class _DropdownFilterState extends State<_DropdownFilter> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.h,
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorName.black.withValues(alpha:0.2)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          hint: Row(
            children: [
              Icon(widget.icon, size: 18.sp, color: ColorName.primary),
              SizedBox(width: 6.w),
              Text(
                widget.hint,
                style: TextStyle(fontSize: 12.sp, color: ColorName.textPrimary),
              ),
            ],
          ),
          icon: Icon(Icons.arrow_drop_down, size: 22.sp, color: ColorName.primary),
          items: widget.items
              .map((value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 12.sp, color: ColorName.textPrimary),
                    ),
                  ))
              .toList(),
          onChanged: (value) => setState(() => selectedValue = value),
        ),
      ),
    );
  }
}
