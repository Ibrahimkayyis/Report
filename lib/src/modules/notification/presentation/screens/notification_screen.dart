import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/core/widgets/dialogs/app_confirmation_dialog.dart';
import 'package:report/src/core/widgets/dialogs/success_dialog.dart';
import '../widgets/notification_header.dart';
import '../widgets/notification_item.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Map<String, dynamic>> notifications = [];
  bool _isSelectionMode = false;
  final Set<int> _selectedIds = {};

  @override
  void initState() {
    super.initState();
    _loadMockData();
  }

  void _loadMockData() {
    // ✅ DATA DISESUAIKAN DENGAN GAMBAR MOCKUP
    notifications = [
      {
        'id': 1, // Frame 403(5) - Tiket Dibuat
        'title': 'Tiket Dibuat',
        'description': 'Laporan Anda telah berhasil dikirim.',
        'type': 'Tiket',
        'time': '1 jam yang lalu',
        'isRead': false,
        'icon': Icons.mark_email_read_outlined,
      },
      {
        'id': 2, // Frame 403(6) - Status Diperbarui
        'title': 'Status Tiket Diperbarui',
        'description': 'Status pengaduan Anda #LPR318728 telah diperbarui menjadi Pending.',
        'type': 'Status',
        'time': '2 hari yang lalu',
        'isRead': true,
        'icon': Icons.assignment_turned_in_outlined,
      },
      {
        'id': 3, // Frame 403(7) - Maintenance
        'title': 'Maintenance',
        'description': 'Pengumuman Maintenance Terjadwal pada 5 November 2025.',
        'type': 'Pengumuman', // Atau 'Maintenance'
        'time': '4 hari yang lalu',
        'isRead': false,
        'icon': Icons.construction_outlined,
      },
      {
        'id': 4, // Frame 403(9) - Umum/HUT
        'title': 'Umum',
        'description': 'Peringatan Hari Jadi Kota Surabaya ke-727.',
        'type': 'Umum',
        'time': '5 bulan yang lalu',
        'isRead': true,
        'icon': Icons.celebration_outlined,
      },
      {
        'id': 5, // Frame 403(8) - Darurat
        'title': 'Darurat',
        'description': 'Gangguan Jaringan Pusat pada pusat data kota.',
        'type': 'Darurat',
        'time': '4 hari yang lalu',
        'isRead': true,
        'icon': Icons.warning_amber_rounded,
      },
    ];
  }

  // --- Logic Selection & Delete (Tetap Sama) ---
  void _enterSelectionMode() {
    setState(() => _isSelectionMode = true);
  }

  void _exitSelectionMode() {
    setState(() {
      _isSelectionMode = false;
      _selectedIds.clear();
    });
  }

  void _toggleItemSelection(int id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _deleteSelectedItems() {
    showDialog(
      context: context,
      builder: (context) => AppConfirmationDialog(
        title: "Hapus Notifikasi",
        message: "Apakah Anda yakin ingin menghapus ${_selectedIds.length} item yang dipilih?",
        confirmText: "Hapus",
        cancelText: "Batal",
        icon: Icons.delete_outline,
        onConfirm: () {
          Navigator.pop(context);
          setState(() {
            notifications.removeWhere((item) => _selectedIds.contains(item['id']));
            _exitSelectionMode();
          });
          showDialog(
            context: context,
            builder: (context) => SuccessDialog(
              message: "Notifikasi berhasil dihapus",
              buttonText: "OK",
              onButtonPressed: () => Navigator.pop(context),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t.app.notifications;

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
                onRefresh: () {
                  setState(() => _loadMockData());
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Data direfresh")),
                  );
                },
                onDeleteMode: _enterSelectionMode,
                onFilterChanged: (val) {},
                onTypeChanged: (val) {},
              ),
              Divider(height: 1.h, color: ColorName.black.withValues(alpha: 0.1)),
              Expanded(
                child: notifications.isEmpty
                    ? const Center(child: Text("Tidak ada notifikasi", style: TextStyle(color: Colors.grey)))
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(12.w, 8.h, 12.w, 160.h),
                        itemCount: notifications.length,
                        separatorBuilder: (_, _) => SizedBox(height: 4.h),
                        itemBuilder: (context, index) {
                          final n = notifications[index];
                          final int id = n['id'] as int;
                          final isSelected = _selectedIds.contains(id);

                          return NotificationItem(
                            title: n['title'] as String,
                            description: n['description'] as String,
                            type: n['type'] as String,
                            time: n['time'] as String,
                            isRead: n['isRead'] as bool,
                            icon: n['icon'] as IconData,
                            isSelectionMode: _isSelectionMode,
                            isSelected: isSelected,
                            onTap: () {
                              if (_isSelectionMode) {
                                _toggleItemSelection(id);
                              } else {
                                context.router.push(NotificationDetailRoute(id: id));
                              }
                            },
                            onLongPress: () {
                              if (!_isSelectionMode) {
                                _enterSelectionMode();
                                _toggleItemSelection(id);
                              }
                            },
                            onSelectChanged: (val) => _toggleItemSelection(id),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: _isSelectionMode
            ? Padding(
                padding: EdgeInsets.only(bottom: 80.h, right: 4.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    FloatingActionButton(
                      heroTag: "delete_fab",
                      onPressed: _selectedIds.isNotEmpty ? _deleteSelectedItems : null,
                      backgroundColor: _selectedIds.isNotEmpty ? Colors.red : Colors.grey,
                      elevation: 4,
                      shape: const CircleBorder(),
                      child: Icon(Icons.delete_outline, color: Colors.white, size: 26.sp),
                    ),
                    SizedBox(height: 16.h),
                    FloatingActionButton(
                      heroTag: "cancel_fab",
                      onPressed: _exitSelectionMode,
                      backgroundColor: ColorName.white,
                      elevation: 4,
                      shape: const CircleBorder(),
                      child: Icon(Icons.close, color: Colors.black87, size: 26.sp),
                    ),
                  ],
                ),
              )
            : null,
      ),
    );
  }
}