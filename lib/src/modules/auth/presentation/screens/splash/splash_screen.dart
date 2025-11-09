import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:report/gen/colors.gen.dart';
import 'package:report/src/core/router/app_router.dart';
import 'package:report/src/core/widgets/widgets.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';

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
  Timer? _timer;
  bool _timerDone = false;
  bool _authChecked = false;
  AuthState? _authResult;

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

    // Timer minimal tampil 2.5 detik
    _timer = Timer(const Duration(milliseconds: 2500), () {
      _timerDone = true;
      _navigateIfReady();
    });

    // Cek auth status pakai global AuthCubit
    Future.microtask(() {
      context.read<AuthCubit>().checkAuthStatus();
    });
  }

  void _navigateIfReady() {
    if (_timerDone && _authChecked) {
      if (!mounted) return;

      if (_authResult is AuthAuthenticated) {
        final auth = _authResult as AuthAuthenticated;

        // 🔹 Pilih layout sesuai role
        if (auth.role == 'teknisi') {
          context.router.replaceAll([const MainLayoutTeknisiRoute()]);
        } else if (auth.role == 'masyarakat') {
          context.router.replaceAll([const MainLayoutMasyarakatRoute()]);
        } else {
          context.router.replaceAll([const MainLayoutRoute()]);
        }
      } else {
        // 🔸 Belum login → ke Login
        context.router.replaceAll([const LoginRoute()]);
      }
    }
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated || state is AuthUnauthenticated) {
          _authResult = state;
          _authChecked = true;
          _navigateIfReady();
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
