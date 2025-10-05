// lib/src/modules/presentation/screens/qr/qr_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:report/gen/i18n/translations.g.dart';

@RoutePage()
class QRScreen extends StatelessWidget {
  const QRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(title: Text(t.app.qr_code)),
      body: const Center(
        child: Text('QR Screen (placeholder)'),
      ),
    );
  }
}
