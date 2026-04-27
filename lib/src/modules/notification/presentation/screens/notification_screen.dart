import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/notification/data/datasources/remote/mapper/notification_mapper.dart';
import 'package:report/src/modules/notification/domain/models/notification_model.dart';
import 'package:report/src/modules/notification/presentation/cubits/notification_cubit.dart';
import 'package:report/src/modules/notification/presentation/cubits/notification_state.dart';
import '../widgets/notification_header.dart';
import '../widgets/notification_item.dart';

// ✅ Import Shimmer
import '../widgets/shimmer/notification_list_shimmer.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedIds = {};
  String _currentFilter = 'all';

  void _enterSelectionMode() {
    setState(() => _isSelectionMode = true);
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedIds.clear();
    });
  }

  void _toggleItemSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _deleteSelectedItems(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: "Hapus Notifikasi",
        message:
            "Apakah Anda yakin ingin menghapus ${_selectedIds.length} item yang dipilih?",
        confirmText: "Hapus",
        cancelText: "Batal",
        icon: Icons.delete_outline,
        onConfirm: () async {
          Navigator.pop(dialogContext);

          await context
              .read<NotificationCubit>()
              .deleteNotifications(_selectedIds.toList());

          if (context.mounted) {
            _exitSelectionMode();
          }
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  }

  void _handleMarkAllRead(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AppConfirmationDialog(
        title: "Tandai Semua Dibaca",
        message:
            "Apakah Anda ingin menandai semua notifikasi sebagai sudah dibaca?",
        confirmText: "Ya",
        cancelText: "Batal",
        icon: Icons.mark_email_read,
        onConfirm: () {
          Navigator.pop(dialogContext);
          context.read<NotificationCubit>().markAllRead();
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

    return BlocProvider(
      create: (_) => sl<NotificationCubit>()..fetchNotifications(),
      child: Builder(builder: (context) {
        return PopScope(
          canPop: !_isSelectionMode,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) return;
            if (_isSelectionMode) _exitSelectionMode();
          },
          child: Scaffold(
            backgroundColor: ColorName.background,
            appBar: AppSecondaryBar(title: t.title),
            body: SafeArea(
              child: Column(
                children: [
                  NotificationHeader(
                    currentFilter: _currentFilter,
                    onFilterChanged: (val) {
                      setState(() => _currentFilter = val);
                    },
                    onRefresh: () {
                      context.read<NotificationCubit>().fetchNotifications();
                    },
                    onDeleteMode: _enterSelectionMode,
                    onMarkAllRead: () => _handleMarkAllRead(context),
                  ),
                  Divider(
                      height: 1.h, color: ColorName.black.withOpacity(0.1)),
                  Expanded(
                    child: BlocBuilder<NotificationCubit, NotificationState>(
                      builder: (context, state) {
                        // ✅ LOGIKA BARU:
                        // Jika Loading (baik initial maupun refresh), tampilkan Shimmer
                        if (state is NotificationLoading) {
                          return const NotificationListShimmer();
                        } 
                        
                        else if (state is NotificationError) {
                          return AppErrorState.general(
                            context: context,
                            message: state.message,
                            onRetry: () => context
                                .read<NotificationCubit>()
                                .fetchNotifications(),
                          );
                        } else if (state is NotificationEmpty) {
                          return const Center(
                            child: Text("Tidak ada notifikasi",
                                style: TextStyle(color: Colors.grey)),
                          );
                        } else if (state is NotificationLoaded) {
                          return _buildNotificationList(
                              context, state.notifications);
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endFloat,
            floatingActionButton: _isSelectionMode
                ? Padding(
                    padding: EdgeInsets.only(bottom: 80.h, right: 4.w),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        FloatingActionButton(
                          heroTag: "delete_fab",
                          onPressed: _selectedIds.isNotEmpty
                              ? () => _deleteSelectedItems(context)
                              : null,
                          backgroundColor: _selectedIds.isNotEmpty
                              ? Colors.red
                              : Colors.grey,
                          elevation: 4,
                          shape: const CircleBorder(),
                          child: Icon(Icons.delete_outline,
                              color: Colors.white, size: 26.sp),
                        ),
                        SizedBox(height: 16.h),
                        FloatingActionButton(
                          heroTag: "cancel_fab",
                          onPressed: _exitSelectionMode,
                          backgroundColor: ColorName.white,
                          elevation: 4,
                          shape: const CircleBorder(),
                          child: Icon(Icons.close,
                              color: Colors.black87, size: 26.sp),
                        ),
                      ],
                    ),
                  )
                : null,
          ),
        );
      }),
    );
  }

  Widget _buildNotificationList(
      BuildContext context, List<NotificationModel> allNotifications) {
    List<NotificationModel> filteredList = [];
    if (_currentFilter == 'all') {
      filteredList = List.from(allNotifications);
    } else if (_currentFilter == 'unread') {
      filteredList = allNotifications.where((n) => !n.isRead).toList();
    } else if (_currentFilter == 'read') {
      filteredList = allNotifications.where((n) => n.isRead).toList();
    }

    // ✅ Sorting Logic: Unread di atas, lalu Waktu Terbaru
    filteredList.sort((a, b) {
      if (a.isRead != b.isRead) {
        return a.isRead ? 1 : -1;
      }
      try {
        final dateA = DateTime.parse(a.createdAt);
        final dateB = DateTime.parse(b.createdAt);
        return dateB.compareTo(dateA);
      } catch (e) {
        return 0;
      }
    });

    if (filteredList.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.filter_list_off,
                size: 48.sp, color: Colors.grey.shade300),
            SizedBox(height: 12.h),
            Text(
              "Tidak ada notifikasi ${_currentFilter == 'unread' ? 'baru' : _currentFilter == 'read' ? 'lama' : ''}",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ],
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<NotificationCubit>().fetchNotifications();
      },
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 160.h),
        itemCount: filteredList.length,
        separatorBuilder: (_, __) => SizedBox(height: 4.h),
        itemBuilder: (ctx, index) {
          final n = filteredList[index];
          final isSelected = _selectedIds.contains(n.id);
          final iconData = NotificationMapper.getIcon(n.requestType, n.message);

          return NotificationItem(
            title: _getTitle(n),
            description: n.message,
            type: n.requestType,
            time: n.createdAt,
            isRead: n.isRead,
            icon: iconData,
            isSelectionMode: _isSelectionMode,
            isSelected: isSelected,
            onTap: () async {
              if (_isSelectionMode) {
                _toggleItemSelection(n.id);
              } else {
                await context.router.push(NotificationDetailRoute(id: n.id));
                if (context.mounted) {
                  context.read<NotificationCubit>().fetchNotifications();
                }
              }
            },
            onLongPress: () {
              if (!_isSelectionMode) {
                _enterSelectionMode();
                _toggleItemSelection(n.id);
              }
            },
            onSelectChanged: (val) => _toggleItemSelection(n.id),
          );
        },
      ),
    );
  }

  String _getTitle(NotificationModel n) {
    if (n.statusTicket.isNotEmpty) return "Status: ${n.statusTicket}";
    return "Notifikasi Baru";
  }
}