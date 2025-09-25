import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/modules/presentation/widgets/widgets.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.forward();

    Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.router.replace(const RegisterRoute());
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorName.background,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: LogoWidget(
            showText: true,
            logoSize: screenWidth * 0.5,
            textWidth: screenWidth * 0.6,
          ),
        ),
      ),
    );
  }
}
