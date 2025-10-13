import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';

class AppNumberField extends StatefulWidget {
  final String? value;
  final ValueChanged<String> onChanged;

  const AppNumberField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<AppNumberField> createState() => _AppNumberFieldState();
}

class _AppNumberFieldState extends State<AppNumberField> {
  late TextEditingController _controller;
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = int.tryParse(widget.value ?? '1') ?? 1;
    _controller = TextEditingController(text: _count.toString());
  }

  @override
  void didUpdateWidget(covariant AppNumberField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      _controller.text = widget.value ?? _count.toString();
    }
  }

  void _increment() {
    setState(() {
      _count++;
      _controller.text = _count.toString();
      widget.onChanged(_count.toString());
    });
  }

  void _decrement() {
    if (_count > 1) {
      setState(() {
        _count--;
        _controller.text = _count.toString();
        widget.onChanged(_count.toString());
      });
    }
  }

  void _onTextChanged(String val) {
    final parsed = int.tryParse(val);
    if (parsed != null && parsed > 0) {
      setState(() {
        _count = parsed;
        widget.onChanged(val);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
              style: TextStyle(
                fontSize: 16.sp,
                color: ColorName.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              onChanged: _onTextChanged,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: _increment,
                child: Icon(Icons.keyboard_arrow_up, size: 20.sp),
              ),
              InkWell(
                onTap: _decrement,
                child: Icon(Icons.keyboard_arrow_down, size: 20.sp),
              ),
            ],
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}
