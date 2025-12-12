import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // ✅ Import Bloc
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/modules/teknisi_home/domain/models/teknisi_ticket_model.dart';
import 'package:report/src/modules/teknisi_home/presentation/cubits/teknisi_home_cubit.dart'; // ✅ Import Cubit Home
import 'package:report/src/modules/teknisi_home/presentation/widgets/home_teknisi/teknisi_ticket_item.dart';

class TeknisiTicketList extends StatefulWidget {
  final List<TeknisiTicketModel> tickets;

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
    if (widget.tickets.isEmpty) {
      return Container(
        height: 200.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Text(
          "Tidak ada tiket",
          style: TextStyle(color: Colors.grey.shade600),
        ),
      );
    }

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
              ticket: t,
              onEditPressed: () async {
                // ✅ FIX: Await hasil dari Detail Screen
                final result = await context.router.push(TeknisiTicketDetailRoute(ticketId: t.id));
                
                // Jika result == true (berarti ada update status)
                if (result == true && context.mounted) {
                  // Refresh List di Home agar data sinkron
                  context.read<TeknisiHomeCubit>().fetchTickets();
                }
              },
            );
          },
        ),
      ),
    );
  }
}