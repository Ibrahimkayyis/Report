import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeHeader extends StatefulWidget {
  final VoidCallback? onCalendarTap;

  const HomeHeader({super.key, this.onCalendarTap});

  @override
  State<HomeHeader> createState() => _HomeHeaderState();
}

class _HomeHeaderState extends State<HomeHeader>
    with SingleTickerProviderStateMixin {
  bool _isCalendarVisible = false;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  OverlayEntry? _overlayEntry;
  final GlobalKey _calendarIconKey = GlobalKey();

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Fade animation
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Scale animation
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack),
    );

    // Slide animation
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, -0.05), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeOutCubic,
          ),
        );
  }

  @override
  void dispose() {
    // pastikan overlay dihapus tanpa memanggil context/setState
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }

    _animationController.dispose();
    super.dispose();
  }

  void _toggleCalendar() {
    if (_isCalendarVisible) {
      _closeCalendar();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(_overlayEntry!);
    _animationController.forward();
    setState(() {
      _isCalendarVisible = true;
    });
  }

  void _closeCalendar() {
    _animationController.reverse().then((_) {
      _removeOverlay();
    });
  }

  void _removeOverlay() {
    if (!mounted) return; // ✅ pastikan widget masih aktif
    _overlayEntry?.remove();
    _overlayEntry = null;

    if (mounted) {
      setState(() {
        _isCalendarVisible = false;
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    // Get the RenderBox to calculate position
    final RenderBox? renderBox =
        _calendarIconKey.currentContext?.findRenderObject() as RenderBox?;
    final Offset? position = renderBox?.localToGlobal(Offset.zero);
    final Size? buttonSize = renderBox?.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Animated transparent background to detect taps outside
          AnimatedBuilder(
            animation: _fadeAnimation,
            builder: (context, child) => Positioned.fill(
              child: GestureDetector(
                onTap: _closeCalendar,
                child: Container(
                  color: Colors.black.withValues(
                    alpha: 0.1 * _fadeAnimation.value,
                  ),
                ),
              ),
            ),
          ),
          // Animated calendar positioned below the calendar icon
          if (position != null && buttonSize != null)
            Positioned(
              top: position.dy + buttonSize.height + 8.h,
              right: 16.w,
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) => FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: ScaleTransition(
                      scale: _scaleAnimation,
                      alignment: Alignment.topRight,
                      child: Material(
                        elevation: 8 * _fadeAnimation.value,
                        borderRadius: BorderRadius.circular(16.r),
                        clipBehavior: Clip.antiAlias,
                        child: Container(
                          width: 320.w,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.5,
                          ),
                          decoration: BoxDecoration(
                            color: ColorName.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(
                              color: ColorName.primary.withValues(alpha: 0.1),
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Calendar header with close button
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: ColorName.primary.withValues(
                                    alpha: 0.05,
                                  ),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16.r),
                                    topRight: Radius.circular(16.r),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Pilih Tanggal',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: ColorName.primary,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        if (_selectedDay != null)
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.w,
                                              vertical: 4.h,
                                            ),
                                            decoration: BoxDecoration(
                                              color: ColorName.primary
                                                  .withValues(alpha: 0.1),
                                              borderRadius:
                                                  BorderRadius.circular(12.r),
                                            ),
                                            child: Text(
                                              '${_selectedDay!.day}/${_selectedDay!.month}/${_selectedDay!.year}',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w500,
                                                color: ColorName.primary,
                                              ),
                                            ),
                                          ),
                                        SizedBox(width: 8.w),
                                        InkWell(
                                          onTap: _closeCalendar,
                                          borderRadius: BorderRadius.circular(
                                            12.r,
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.all(4.w),
                                            child: Icon(
                                              Icons.close_rounded,
                                              color: ColorName.primary,
                                              size: 20.sp,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              // Calendar widget
                              Padding(
                                padding: EdgeInsets.all(12.w),
                                child: TableCalendar(
                                  firstDay: DateTime.utc(2020, 1, 1),
                                  lastDay: DateTime.utc(2030, 12, 31),
                                  focusedDay: _focusedDay,
                                  selectedDayPredicate: (day) {
                                    return isSameDay(_selectedDay, day);
                                  },
                                  onDaySelected: (selectedDay, focusedDay) {
                                    setState(() {
                                      _selectedDay = selectedDay;
                                      _focusedDay = focusedDay;
                                    });
                                    // Update the overlay to show new selected date
                                    _overlayEntry?.markNeedsBuild();

                                    // Call callback if provided
                                    widget.onCalendarTap?.call();

                                    // DO NOT close the calendar automatically
                                    // User must tap outside or click close button
                                  },
                                  calendarFormat: CalendarFormat.month,
                                  startingDayOfWeek: StartingDayOfWeek.monday,
                                  headerStyle: HeaderStyle(
                                    formatButtonVisible: false,
                                    titleCentered: true,
                                    titleTextStyle: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.textPrimary,
                                    ),
                                    leftChevronIcon: Icon(
                                      Icons.chevron_left,
                                      color: ColorName.textPrimary,
                                      size: 20.sp,
                                    ),
                                    rightChevronIcon: Icon(
                                      Icons.chevron_right,
                                      color: ColorName.textPrimary,
                                      size: 20.sp,
                                    ),
                                    decoration: BoxDecoration(
                                      color: ColorName.background,
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    headerPadding: EdgeInsets.symmetric(
                                      vertical: 8.h,
                                    ),
                                    headerMargin: EdgeInsets.only(bottom: 8.h),
                                  ),
                                  daysOfWeekStyle: DaysOfWeekStyle(
                                    weekdayStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: ColorName.primary,
                                    ),
                                    weekendStyle: TextStyle(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red.shade400,
                                    ),
                                  ),
                                  calendarStyle: CalendarStyle(
                                    todayDecoration: BoxDecoration(
                                      color: ColorName.primary.withValues(
                                        alpha: 0.2,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    selectedDecoration: BoxDecoration(
                                      color: ColorName.primary,
                                      shape: BoxShape.circle,
                                    ),
                                    defaultTextStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: ColorName.textPrimary,
                                    ),
                                    weekendTextStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.red.shade400,
                                    ),
                                    outsideTextStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.grey.shade400,
                                    ),
                                    selectedTextStyle: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      color: ColorName.white,
                                    ),
                                    todayTextStyle: TextStyle(
                                      fontSize: 13.sp,
                                      color: ColorName.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    cellMargin: EdgeInsets.all(4.w),
                                    cellPadding: EdgeInsets.all(2.w),
                                  ),
                                  rowHeight: 42.h,
                                  daysOfWeekHeight: 32.h,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: ColorName.background,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // 🔹 Logo di kiri
              Image.asset(
                Assets.images.logoText.path,
                height: 36.h,
                fit: BoxFit.contain,
                semanticLabel: 'REPORT Logo Text',
              ),
              // 🔹 Icon Calendar dengan animasi rotasi
              GestureDetector(
                key: _calendarIconKey,
                onTap: _toggleCalendar,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    color: _isCalendarVisible
                        ? ColorName.primary
                        : ColorName.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: _isCalendarVisible
                            ? ColorName.primary.withValues(alpha: 0.3)
                            : ColorName.black.withValues(alpha: 0.08),
                        blurRadius: _isCalendarVisible ? 8 : 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    transitionBuilder:
                        (Widget child, Animation<double> animation) {
                          return RotationTransition(
                            turns: animation,
                            child: FadeTransition(
                              opacity: animation,
                              child: child,
                            ),
                          );
                        },
                    child: Icon(
                      _isCalendarVisible
                          ? Icons.calendar_today_rounded
                          : Icons.calendar_month_rounded,
                      key: ValueKey<bool>(_isCalendarVisible),
                      color: _isCalendarVisible
                          ? ColorName.white
                          : ColorName.primary,
                      size: 22.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
