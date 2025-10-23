import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';

class NotificationHeader extends StatelessWidget {
  final VoidCallback? onMarkAllAsRead;

  const NotificationHeader({super.key, this.onMarkAllAsRead});

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔍 Search Field
          TextField(
            decoration: InputDecoration(
              hintText: t.search_placeholder,
              prefixIcon: const Icon(Icons.search, size: 20),
              contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: ColorName.black.withOpacity(0.2)),
              ),
              filled: true,
              fillColor: ColorName.white,
            ),
          ),

          SizedBox(height: 12.h),

          /// Row of filters + menu
          Row(
            children: [
              /// Filter Dropdown
              Expanded(
                flex: 2,
                child: _DropdownFilter(
                  icon: Icons.filter_list,
                  hint: t.filter,
                  items: [
                    t.filter_all,
                    t.filter_unread,
                    t.filter_read,
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// Type Dropdown
              Expanded(
                flex: 2,
                child: _DropdownFilter(
                  icon: Icons.category_outlined,
                  hint: t.type,
                  items: [
                    t.type_all,
                    t.type_ticket,
                    t.type_message,
                    t.type_update,
                  ],
                ),
              ),

              SizedBox(width: 10.w),

              /// ⋮ Menu button (mark all as read)
              Container(
                height: 42.h,
                width: 42.h,
                decoration: BoxDecoration(
                  color: ColorName.primary,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'mark_all') onMarkAllAsRead?.call();
                  },
                  icon: Icon(Icons.more_vert, color: ColorName.white, size: 22.sp),
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'mark_all',
                      child: Text(
                        t.mark_all_as_read,
                        style: TextStyle(fontSize: 12.sp, color: ColorName.textPrimary),
                      ),
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
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: ColorName.black.withOpacity(0.2)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          hint: Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
