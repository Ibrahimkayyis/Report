import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_ticket_item.dart';

class TeknisiTicketList extends StatefulWidget {
  final List<Map<String, dynamic>> tickets;

  const TeknisiTicketList({
    super.key,
    required this.tickets,
  });

  @override
  State<TeknisiTicketList> createState() => _TeknisiTicketListState();
}

class _TeknisiTicketListState extends State<TeknisiTicketList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380.h,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        thickness: 4.w,
        radius: Radius.circular(8.r),
        child: ListView.builder(
          controller: _scrollController,
          padding: EdgeInsets.only(right: 8.w),
          itemCount: widget.tickets.length,
          itemBuilder: (context, index) {
            final t = widget.tickets[index];
            return TeknisiTicketItem(
              userName: t['userName'],
              date: t['date'],
              status: t['status'],
              kategori: t['kategori'],
              jenis: t['jenis'],
              bentuk: t['bentuk'],
              lampiranCount: t['lampiranCount'],
              isDraft: t['isDraft'],
              onEditPressed: () {
                context.router.push(TeknisiTicketDetailRoute(ticketId: t['id']));
              },
            );
          },
        ),
      ),
    );
  }
}