import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:timeago/timeago.dart' as timeago; // 👈 Import timeago

import '../../domain/models/teknisi_notification_model.dart';
import '../cubits/teknisi_notification_cubit.dart';
import '../cubits/teknisi_notification_state.dart';
import '../widgets/teknisi_notification_header.dart';
import '../widgets/teknisi_notification_item.dart';

@RoutePage()
class TeknisiNotificationScreen extends StatefulWidget {
  const TeknisiNotificationScreen({super.key});

  @override
  State<TeknisiNotificationScreen> createState() =>
      _TeknisiNotificationScreenState();
}

class _TeknisiNotificationScreenState extends State<TeknisiNotificationScreen> {
  bool _isSelectionMode = false;
  final Set<String> _selectedIds = {};
  String _currentFilter = 'all';

  List<TeknisiNotificationModel>? _lastLoadedData;

  @override
  void initState() {
    super.initState();
    // 🟢 Set Locale Indonesia untuk timeago
    timeago.setLocaleMessages('id', timeago.IdMessages());
  }

  // ... (Code logika selection mode dan API actions SAMA, tidak perlu diubah) ...
  // ... (Paste kode _enterSelectionMode, _exitSelectionMode, _toggleItemSelection, _deleteSelectedItems, _handleMarkAllRead, _getIcon dari kode lama) ...

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
        onConfirm: () {
          Navigator.pop(dialogContext);
          context
              .read<TeknisiNotificationCubit>()
              .deleteNotifications(_selectedIds.toList());
          _exitSelectionMode();
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
        message: "Tandai semua notifikasi sebagai sudah dibaca?",
        confirmText: "Ya",
        cancelText: "Batal",
        icon: Icons.mark_email_read,
        onConfirm: () {
          Navigator.pop(dialogContext);
          context.read<TeknisiNotificationCubit>().markAllRead();
        },
        onCancel: () => Navigator.pop(dialogContext),
      ),
    );
  }

  IconData _getIcon(String? type, String message) {
    final msgLower = message.toLowerCase();
    if (msgLower.contains('assign') || msgLower.contains('tugas')) {
      return Icons.assignment_ind;
    } else if (msgLower.contains('maintenance')) {
      return Icons.build;
    } else if (msgLower.contains('selesai') || msgLower.contains('solved')) {
      return Icons.check_circle;
    } else if (msgLower.contains('peringatan') ||
        msgLower.contains('warning')) {
      return Icons.warning_amber_rounded;
    }
    return Icons.notifications;
  }

  // 🔹 Helper Function untuk Format Waktu
  String _formatTimeAgo(String isoString) {
    try {
      final dt = DateTime.parse(isoString).toLocal(); // Convert ke Local Time
      return timeago.format(dt, locale: 'id'); // Format pakai bahasa Indonesia
    } catch (e) {
      return isoString; // Fallback jika gagal parse
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TeknisiNotificationCubit>()..fetchNotifications(),
      child: Builder(
        builder: (context) {
          return PopScope(
            canPop: !_isSelectionMode,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) return;
              if (_isSelectionMode) _exitSelectionMode();
            },
            child: Scaffold(
              backgroundColor: ColorName.background,
              appBar: const AppSecondaryBar(title: "Notifikasi Teknisi"),
              body: SafeArea(
                child: Column(
                  children: [
                    TeknisiNotificationHeader(
                      currentFilter: _currentFilter,
                      onFilterChanged: (val) {
                        setState(() => _currentFilter = val);
                      },
                      onRefresh: () {
                        context
                            .read<TeknisiNotificationCubit>()
                            .fetchNotifications();
                      },
                      onDeleteMode: _enterSelectionMode,
                      onMarkAllRead: () => _handleMarkAllRead(context),
                    ),
                    Divider(
                        height: 1.h, color: ColorName.black.withOpacity(0.1)),
                    Expanded(
                      child: BlocBuilder<TeknisiNotificationCubit,
                          TeknisiNotificationState>(
                        builder: (context, state) {
                          if (state is TeknisiNotificationLoaded) {
                            _lastLoadedData = state.notifications;
                          }

                          if (state is TeknisiNotificationLoading &&
                              _lastLoadedData != null) {
                            return Stack(
                              children: [
                                _buildNotificationList(_lastLoadedData!),
                                Container(
                                  color: Colors.white.withOpacity(0.5),
                                  child: const Center(
                                      child: CircularProgressIndicator()),
                                )
                              ],
                            );
                          }

                          if (state is TeknisiNotificationLoading) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          if (state is TeknisiNotificationError) {
                            return AppErrorState.general(
                              context: context,
                              message: state.message,
                              onRetry: () => context
                                  .read<TeknisiNotificationCubit>()
                                  .fetchNotifications(),
                            );
                          }

                          if (state is TeknisiNotificationEmpty) {
                            return _buildEmptyState();
                          }

                          if (state is TeknisiNotificationLoaded) {
                            return _buildNotificationList(state.notifications);
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
                            heroTag: "delete_fab_tech",
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
                            heroTag: "cancel_fab_tech",
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
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined,
              size: 48.sp, color: Colors.grey.shade300),
          SizedBox(height: 12.h),
          Text(
            "Tidak ada notifikasi",
            style: TextStyle(color: Colors.grey.shade500),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationList(List<TeknisiNotificationModel> allData) {
    List<TeknisiNotificationModel> filteredList = [];
    if (_currentFilter == 'all') {
      filteredList = List.from(allData);
    } else if (_currentFilter == 'unread') {
      filteredList = allData.where((n) => !n.isRead).toList();
    } else if (_currentFilter == 'read') {
      filteredList = allData.where((n) => n.isRead).toList();
    }

    if (filteredList.isEmpty) {
      return Center(
        child: Text(
          "Tidak ada data $_currentFilter",
          style: TextStyle(color: Colors.grey.shade500),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: () async {
        await context.read<TeknisiNotificationCubit>().fetchNotifications();
      },
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 160.h),
        itemCount: filteredList.length,
        separatorBuilder: (_, __) => SizedBox(height: 4.h),
        itemBuilder: (context, index) {
          final n = filteredList[index];
          final isSelected = _selectedIds.contains(n.id);

          return TeknisiNotificationItem(
            title: n.status ?? "Info",
            description: n.message,
            type: n.status?.toLowerCase() ?? 'info',
            
            // 🟢 GUNAKAN HELPER FORMAT TIMEAGO
            time: _formatTimeAgo(n.createdAt), 
            
            isRead: n.isRead,
            icon: _getIcon(n.status, n.message),
            isSelectionMode: _isSelectionMode,
            isSelected: isSelected,
            onTap: () {
              if (_isSelectionMode) {
                _toggleItemSelection(n.id);
              } else {
                context.read<TeknisiNotificationCubit>().markAsRead(n.id);
                context
                    .router
                    .push(TeknisiNotificationDetailRoute(id: n.id))
                    .then((_) {
                  if (context.mounted) {
                    context
                        .read<TeknisiNotificationCubit>()
                        .fetchNotifications();
                  }
                });
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
}