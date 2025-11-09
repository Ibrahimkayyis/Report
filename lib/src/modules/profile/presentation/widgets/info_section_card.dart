import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'info_field_item.dart';

class InfoSectionCard extends StatefulWidget {
  final String title;
  final Map<String, String> fields;
  final String? secondTabTitle;
  final Map<String, String>? secondTabFields;

  const InfoSectionCard({
    super.key,
    required this.title,
    required this.fields,
    this.secondTabTitle,
    this.secondTabFields,
  });

  @override
  State<InfoSectionCard> createState() => _InfoSectionCardState();
}

class _InfoSectionCardState extends State<InfoSectionCard> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasSecondTab = widget.secondTabTitle != null && widget.secondTabFields != null;

    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withValues(alpha:0.12),
            blurRadius: 24.r,
            spreadRadius: 1.r,
            offset: Offset(0, 6.h),
          ),
          BoxShadow(
            color: ColorName.black.withValues(alpha:0.06),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tabs with curved divider (if second tab exists)
          if (hasSecondTab) ...[
            _buildCurvedTabs(),
          ] else ...[
            // Single title (no tabs)
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: ColorName.primary,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey.shade300,
                  ),
                ],
              ),
            ),
          ],

          // Content area
          Padding(
            padding: EdgeInsets.all(16.w),
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildCurvedTabs() {
    return SizedBox(
      height: 60.h,
      child: Stack(
        children: [
          // Background grey container
          Container(
            height: 60.h,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
          ),

          // Custom paint for curved shape
          CustomPaint(
            size: Size(double.infinity, 60.h),
            painter: CurvedTabPainter(
              isFirstTabActive: _selectedTabIndex == 0,
              activeColor: ColorName.white,
              inactiveColor: Colors.grey.shade200,
            ),
          ),

          // Tab buttons
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = 0),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: _selectedTabIndex == 0 ? FontWeight.w700 : FontWeight.w500,
                        color: _selectedTabIndex == 0 ? ColorName.primary : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => setState(() => _selectedTabIndex = 1),
                  behavior: HitTestBehavior.opaque,
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                    child: Text(
                      widget.secondTabTitle!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: _selectedTabIndex == 1 ? FontWeight.w700 : FontWeight.w500,
                        color: _selectedTabIndex == 1 ? ColorName.primary : Colors.grey.shade600,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    final fieldsToShow = _selectedTabIndex == 0
        ? widget.fields
        : (widget.secondTabFields ?? widget.fields);

    return _buildFieldsList(fieldsToShow);
  }

  Widget _buildFieldsList(Map<String, String> fields) {
    final fieldEntries = fields.entries.toList();
    final items = <Widget>[];

    for (int i = 0; i < fieldEntries.length; i++) {
      final field = fieldEntries[i];

      items.add(
        InfoFieldItem(
          label: field.key,
          value: field.value,
        ),
      );

      if (i < fieldEntries.length - 1) {
        items.add(SizedBox(height: 16.h));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }
}

// Custom Painter for curved tab divider
class CurvedTabPainter extends CustomPainter {
  final bool isFirstTabActive;
  final Color activeColor;
  final Color inactiveColor;

  CurvedTabPainter({
    required this.isFirstTabActive,
    required this.activeColor,
    required this.inactiveColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = activeColor;

    final path = Path();

    if (isFirstTabActive) {
      // Left tab is active - draw white background on left with curve on right
      path.moveTo(0, 0);
      path.lineTo(size.width / 2 - 20, 0);
      
      // Curved transition
      path.quadraticBezierTo(
        size.width / 2,
        0,
        size.width / 2,
        20,
      );
      path.quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width / 2 + 20,
        size.height,
      );
      
      path.lineTo(0, size.height);
      path.close();
    } else {
      // Right tab is active - draw white background on right with curve on left
      path.moveTo(size.width, 0);
      path.lineTo(size.width / 2 + 20, 0);
      
      // Curved transition
      path.quadraticBezierTo(
        size.width / 2,
        0,
        size.width / 2,
        20,
      );
      path.quadraticBezierTo(
        size.width / 2,
        size.height,
        size.width / 2 - 20,
        size.height,
      );
      
      path.lineTo(size.width, size.height);
      path.close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvedTabPainter oldDelegate) {
    return oldDelegate.isFirstTabActive != isFirstTabActive;
  }
}