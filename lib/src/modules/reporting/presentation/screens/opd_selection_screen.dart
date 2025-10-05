// lib/src/modules/presentation/screens/reporting/opd_selection_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/gen/i18n/translations.g.dart';
import 'package:report/src/core/router/app_router.dart';

part '../widgets/opd_selection/opd_selection_appbar.dart';
part '../widgets/opd_selection/opd_selection_title.dart';
part '../widgets/opd_selection/opd_card.dart';
part '../widgets/opd_selection/opd_item.dart';

@RoutePage()
class OpdSelectionScreen extends StatelessWidget {
  const OpdSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;

    return Scaffold(
      backgroundColor: ColorName.background,
      appBar: const OpdSelectionAppBar(),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          OpdSelectionTitle(title: t.app.select_opd_subtitle),
          SizedBox(height: 16.h),
          ..._buildOpdList(context, t),
        ],
      ),
    );
  }

  List<Widget> _buildOpdList(BuildContext context, Translations t) {
    final List<OpdItem> opdList = [
      OpdItem(icon: Icons.school, name: t.app.opd_dinas_pendidikan, color: Colors.blue.shade700),
      OpdItem(icon: Icons.library_books, name: t.app.opd_dinas_perpustakaan, color: Colors.red.shade600),
      OpdItem(icon: Icons.local_hospital, name: t.app.opd_dinas_kesehatan, color: Colors.pink.shade600),
      OpdItem(icon: Icons.devices, name: t.app.opd_dinas_komunikasi_informatika, color: Colors.indigo.shade700),
      OpdItem(icon: Icons.directions_bus, name: t.app.opd_dinas_perhubungan, color: Colors.orange.shade700),
      OpdItem(icon: Icons.eco, name: t.app.opd_dinas_lingkungan_hidup, color: Colors.green.shade600),
      OpdItem(icon: Icons.diversity_3, name: t.app.opd_dinas_sosial, color: Colors.teal.shade700),
      OpdItem(icon: Icons.badge, name: t.app.opd_dinas_kependudukan_pencatatan_sipil, color: Colors.cyan.shade700),
      OpdItem(icon: Icons.water_drop, name: t.app.opd_dinas_sda_bina_marga, color: Colors.blue.shade800),
      OpdItem(icon: Icons.business_center, name: t.app.opd_dinas_koperasi_ukm, color: Colors.amber.shade800),
      OpdItem(icon: Icons.home_work, name: t.app.opd_dinas_perumahan_kawasan, color: Colors.brown.shade600),
      OpdItem(icon: Icons.account_balance, name: t.app.opd_dinas_penanaman_modal, color: Colors.deepPurple.shade700),
      OpdItem(icon: Icons.fire_truck, name: t.app.opd_dinas_pemadam_kebakaran, color: Colors.red.shade700),
      OpdItem(icon: Icons.museum, name: t.app.opd_dinas_kebudayaan_pariwisata, color: Colors.deepOrange.shade700),
      OpdItem(icon: Icons.factory, name: t.app.opd_dinas_perindustrian_tenaga_kerja, color: Colors.grey.shade700),
      OpdItem(icon: Icons.shield, name: t.app.opd_satpol_pp, color: Colors.orange.shade800),
      OpdItem(icon: Icons.agriculture, name: t.app.opd_dinas_ketahanan_pangan, color: Colors.lightGreen.shade700),
      OpdItem(icon: Icons.people, name: t.app.opd_dinas_pengendalian_penduduk, color: Colors.purple.shade700),
    ];

    return opdList.map((opd) => OpdCard(opd: opd)).toList();
  }
}
