import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import '../widgets/notification_header.dart';
import '../widgets/notification_item.dart';

@RoutePage()
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

    final List<Map<String, Object>> notifications = [
      {
        'title': t.new_ticket_assigned,
        'description': 'A new ticket has been assigned to you.',
        'type': 'ticket',
        'time': '2h',
        'isRead': false,
        'icon': Icons.assignment_turned_in_outlined,
      },
      {
        'title': t.new_message,
        'description': 'You received a new message from Helpdesk.',
        'type': 'message',
        'time': '5h',
        'isRead': true,
        'icon': Icons.chat_bubble_outline,
      },
      {
        'title': t.team_update,
        'description': 'Team IT has updated your ticket status.',
        'type': 'update',
        'time': '1d',
        'isRead': false,
        'icon': Icons.people_outline,
      },
      {
        'title': t.ticket_status_update,
        'description': 'Your ticket #421 has been closed successfully.',
        'type': 'ticket',
        'time': '2d',
        'isRead': true,
        'icon': Icons.check_circle_outline,
      },
      {
        'title': t.new_ticket_created,
        'description': 'A new request has been submitted to your department.',
        'type': 'ticket',
        'time': '3d',
        'isRead': true,
        'icon': Icons.add_circle_outline,
      },
    ];

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppSecondaryBar(title: t.title),
      body: SafeArea(
        child: Column(
          children: [
            /// Header (search + filter + menu)
            NotificationHeader(
              onMarkAllAsRead: () {},
            ),

            Divider(height: 1.h, color: ColorName.black.withValues(alpha:0.1)),

            /// List notifikasi
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                itemCount: notifications.length,
                separatorBuilder: (_, _) => SizedBox(height: 4.h),
                itemBuilder: (context, index) {
                  final n = notifications[index];
                  return NotificationItem(
                    title: n['title'] as String,
                    description: n['description'] as String,
                    type: n['type'] as String,
                    time: n['time'] as String,
                    isRead: n['isRead'] as bool,
                    icon: n['icon'] as IconData,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
