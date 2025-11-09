import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RFCStatusBadge extends StatelessWidget {
  final String status;

  const RFCStatusBadge({
    super.key,
    required this.status,
  });

  Color _getBackgroundColor() {
    switch (status.toLowerCase()) {
      case 'draft':
        return Colors.grey.shade300;
      case 'menunggu review':
      case 'waiting review':
        return Colors.orange.shade100;
      case 'disetujui':
      case 'approved':
        return Colors.green.shade100;
      case 'ditolak':
      case 'rejected':
        return Colors.red.shade100;
      default:
        return Colors.grey.shade300;
    }
  }

  Color _getTextColor() {
    switch (status.toLowerCase()) {
      case 'draft':
        return Colors.grey.shade700;
      case 'menunggu review':
      case 'waiting review':
        return Colors.orange.shade800;
      case 'disetujui':
      case 'approved':
        return Colors.green.shade800;
      case 'ditolak':
      case 'rejected':
        return Colors.red.shade800;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: _getBackgroundColor(),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: _getTextColor(),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}