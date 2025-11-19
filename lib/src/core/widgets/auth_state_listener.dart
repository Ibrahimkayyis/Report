import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/core/router/app_router.dart';

/// Wrapper widget untuk listen auth state changes
/// dan auto-redirect ke login saat user logout
class AuthStateListener extends StatelessWidget {
  final Widget child;

  const AuthStateListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          AppLogger.w('🔴 [AuthStateListener] User unauthenticated → redirecting to login...');

          WidgetsBinding.instance.addPostFrameCallback((_) {
            try {
              /// Redirect langsung
              context.router.replaceAll([const RegisterRoute()]);

              /// SnackBar notifikasi
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Row(
                    children: const [
                      Icon(Icons.timer_off, color: Colors.white),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Session expired. Please login again.',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.orange.shade700,
                  duration: const Duration(seconds: 4),
                  behavior: SnackBarBehavior.floating,
                  margin: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );

              AppLogger.i('✅ [AuthStateListener] Redirected to login screen');
            } catch (e, st) {
              AppLogger.e('❌ [AuthStateListener] Error saat redirect', e, st);
            }
          });
        }
      },
      child: child,
    );
  }
}
