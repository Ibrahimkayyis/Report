import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/assets.gen.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';

@RoutePage()
class HelpdeskChatScreen extends StatefulWidget {
  const HelpdeskChatScreen({super.key});

  @override
  State<HelpdeskChatScreen> createState() => _HelpdeskChatScreenState();
}

class _HelpdeskChatScreenState extends State<HelpdeskChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];

  String? _selectedOpd;

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    final opdList = [
      t.app.opd_dinas_pendidikan,
      t.app.opd_dinas_perpustakaan,
      t.app.opd_dinas_kesehatan,
      t.app.opd_dinas_komunikasi_informatika,
      t.app.opd_dinas_perhubungan,
      t.app.opd_dinas_lingkungan_hidup,
      t.app.opd_dinas_sosial,
      t.app.opd_dinas_kependudukan_pencatatan_sipil,
      t.app.opd_dinas_sda_bina_marga,
      t.app.opd_dinas_koperasi_ukm,
      t.app.opd_dinas_perumahan_kawasan,
      t.app.opd_dinas_penanaman_modal,
      t.app.opd_dinas_pemadam_kebakaran,
      t.app.opd_dinas_kebudayaan_pariwisata,
      t.app.opd_dinas_perindustrian_tenaga_kerja,
      t.app.opd_satpol_pp,
      t.app.opd_dinas_ketahanan_pangan,
      t.app.opd_dinas_pengendalian_penduduk,
    ];

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: AppPrimaryBar(title: t.app.helpdesk_title),
      body: SafeArea(
        child: Column(
          children: [
            // 🧠 Bagian atas: intro + dropdown horizontal
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    t.app.helpdesk_intro_text,
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(height: 12.h),

                  // 👉 Teks & dropdown dalam satu baris
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          t.app.destination_opd,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorName.textPrimary,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),

                      // ✅ Dropdown global custom
                      Flexible(
                        flex: 7,
                        child: CustomDropdown<String>(
                          hintText: t.app.select_opd,
                          items: opdList,
                          initialItem: _selectedOpd,
                          onChanged: (value) {
                            setState(() => _selectedOpd = value);
                          },
                          decoration: CustomDropdownDecoration(
                            closedFillColor: ColorName.white,
                            closedBorder: Border.all(
                              color: Colors.grey.shade400,
                            ),
                            closedBorderRadius: BorderRadius.circular(10.r),
                            expandedBorderRadius: BorderRadius.circular(10.r),
                            listItemStyle: TextStyle(
                              fontSize: 14.sp,
                              color: ColorName.textPrimary,
                            ),
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey.shade500,
                            ),
                            closedShadow: [
                              BoxShadow(
                                color: ColorName.black.withValues(alpha:0.1),
                                blurRadius: 8,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Divider(height: 24.h, color: Colors.grey.shade300),

            // 💬 Area chat kosong
            Expanded(
              child: Container(
                color: ColorName.white,
                child: _messages.isEmpty
                    ? Center(
                        child: Text(
                          t.app.helpdesk_empty_chat,
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 13.sp,
                          ),
                        ),
                      )
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 10.h,
                        ),
                        reverse: true,
                        itemCount: _messages.length,
                        itemBuilder: (context, index) {
                          final msg = _messages[_messages.length - 1 - index];
                          final isUser = msg['sender'] == 'user';

                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 6.h),
                            child: Row(
                              mainAxisAlignment: isUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                // 🧑‍💻 Avatar Helpdesk di kiri
                                if (!isUser)
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.w),
                                    child: CircleAvatar(
                                      radius: 16.r,
                                      backgroundColor: Colors.grey.shade200,
                                      backgroundImage: AssetImage(
                                        Assets.images.helpdeskAvatar.path,
                                      ),
                                    ),
                                  ),

                                // 💬 Bubble chat
                                Flexible(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 14.w,
                                      vertical: 10.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isUser
                                          ? ColorName.primary
                                          : Colors.grey.shade200,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(14.r),
                                        topRight: Radius.circular(14.r),
                                        bottomLeft: isUser
                                            ? Radius.circular(14.r)
                                            : Radius.circular(0),
                                        bottomRight: isUser
                                            ? Radius.circular(0)
                                            : Radius.circular(14.r),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          color: ColorName.black.withValues(alpha:0.05),
                                          blurRadius: 4,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      msg['text'] ?? '',
                                      style: TextStyle(
                                        color: isUser
                                            ? ColorName.onPrimary
                                            : ColorName.textPrimary,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ),
                                ),

                                // 👤 Avatar User di kanan
                                if (isUser)
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: CircleAvatar(
                                      radius: 16.r,
                                      backgroundColor: ColorName.primary
                                          .withValues(alpha:0.2),
                                      backgroundImage: AssetImage(
                                        Assets.images.userAvatar.path,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),

            // 📨 Input bar
            Padding(
              padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 16.h),
              child: Row(
                children: [
                  // Field pesan
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: ColorName.white,
                        borderRadius: BorderRadius.circular(30.r),
                        boxShadow: [
                          BoxShadow(
                            color: ColorName.black.withValues(alpha:0.08),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: InputDecoration(
                                hintText: t.app.write_message,
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.camera_alt_rounded,
                              color: ColorName.primary,
                            ),
                            iconSize: 22.sp,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.attach_file_rounded,
                              color: ColorName.primary,
                            ),
                            iconSize: 22.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),

                  // Tombol kirim
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorName.primary,
                    ),
                    child: IconButton(
                      onPressed: () {
                        if (_messageController.text.trim().isEmpty) return;

                        setState(() {
                          _messages.add({
                            'sender': 'user',
                            'text': _messageController.text.trim(),
                          });
                        });

                        _messageController.clear();

                        // ✅ (Optional) Simulasi balasan Helpdesk
                        Future.delayed(const Duration(seconds: 1), () {
                          setState(() {
                            _messages.add({
                              'sender': 'helpdesk',
                              'text':
                                  'Baik, pesan Anda telah diterima oleh Helpdesk $_selectedOpd.',
                            });
                          });
                        });
                      },
                      icon: const Icon(
                        Icons.send_rounded,
                        color: ColorName.onPrimary,
                      ),
                      iconSize: 22.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
