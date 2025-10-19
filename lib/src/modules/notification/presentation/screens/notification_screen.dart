import 'package:flutter/material.dart';
import 'package:report/gen/i18n/translations.g.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.notification),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Notification Screen (placeholder)',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
