import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

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

class _InfoSectionCardState extends State<InfoSectionCard>
    with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() => _selectedTabIndex = index);
    if (index == 1) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasSecondTab =
        widget.secondTabTitle != null && widget.secondTabFields != null;

    return Container(
      decoration: BoxDecoration(
        color: ColorName.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: ColorName.black.withOpacity(0.04),
            blurRadius: 16.r,
            offset: Offset(0, 2.h),
          ),
          BoxShadow(
            color: ColorName.black.withOpacity(0.02),
            blurRadius: 8.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with tabs or single title
          if (hasSecondTab)
            _buildModernTabs()
          else
            _buildSingleTitle(),

          // Content area
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildSingleTitle() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 4.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: ColorName.primary,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(width: 12.w),
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: ColorName.textPrimary,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModernTabs() {
    return Container(
      padding: EdgeInsets.all(6.w),
      margin: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Stack(
        children: [
          // Animated indicator
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: _selectedTabIndex == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: ColorName.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: ColorName.primary.withOpacity(0.15),
                          blurRadius: 8.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          // Tab buttons
          Row(
            children: [
              Expanded(
                child: _buildTabButton(
                  text: widget.title,
                  isSelected: _selectedTabIndex == 0,
                  onTap: () => _onTabChanged(0),
                ),
              ),
              Expanded(
                child: _buildTabButton(
                  text: widget.secondTabTitle!,
                  isSelected: _selectedTabIndex == 1,
                  onTap: () => _onTabChanged(1),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String text,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        height: 40.h,
        alignment: Alignment.center,
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            color: isSelected ? ColorName.primary : Colors.grey.shade600,
            letterSpacing: -0.2,
          ),
          child: Text(text),
        ),
      ),
    );
  }

  Widget _buildContent() {
    final fieldsToShow = _selectedTabIndex == 0
        ? widget.fields
        : (widget.secondTabFields ?? widget.fields);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0.0, 0.05),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
      },
      child: _buildFieldsList(fieldsToShow, _selectedTabIndex),
    );
  }

  Widget _buildFieldsList(Map<String, String> fields, int tabIndex) {
    final fieldEntries = fields.entries.toList();
    final items = <Widget>[];

    for (int i = 0; i < fieldEntries.length; i++) {
      final field = fieldEntries[i];

      items.add(
        _buildModernFieldItem(
          label: field.key,
          value: field.value,
        ),
      );

      if (i < fieldEntries.length - 1) {
        items.add(SizedBox(height: 14.h));
        items.add(
          Divider(
            height: 1,
            thickness: 0.5,
            color: Colors.grey.shade200,
          ),
        );
        items.add(SizedBox(height: 14.h));
      }
    }

    return Column(
      key: ValueKey<int>(tabIndex),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items,
    );
  }

  Widget _buildModernFieldItem({
    required String label,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon indicator
        Container(
          margin: EdgeInsets.only(top: 2.h),
          width: 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: ColorName.primary.withOpacity(0.6),
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 12.w),

        // Label & Value
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                  letterSpacing: 0.2,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorName.textPrimary,
                  height: 1.4,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}