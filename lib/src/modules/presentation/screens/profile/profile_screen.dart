// lib/src/modules/presentation/screens/profile/profile_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:report/gen/i18n/translations.g.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Scaffold(
      appBar: AppBar(title: Text(t.app.profile)),
      body: const Center(
        child: Text('Profile Screen (placeholder)'),
      ),
    );
  }
}
