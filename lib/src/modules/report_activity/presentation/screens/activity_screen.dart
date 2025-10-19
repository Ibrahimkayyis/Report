import 'package:flutter/material.dart';
import 'package:report/gen/i18n/translations.g.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(
        title: Text(t.app.activity),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Activity Screen (placeholder)',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
