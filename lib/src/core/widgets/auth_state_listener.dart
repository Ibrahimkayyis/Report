import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_cubit.dart';
import 'package:report/src/modules/auth/presentation/cubits/auth/auth_state.dart';
import 'package:report/src/core/router/app_router.dart';

/// Wrapper widget untuk listen auth state changes
/// dan auto-redirect ke login saat user logout
/// 
/// VERSION: Simple & Reliable (Direct Redirect)
class AuthStateListener extends StatelessWidget {
  final Widget child;

  const AuthStateListener({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthUnauthenticated) {
          debugPrint('🔴 [AuthStateListener] User unauthenticated, redirecting to login...');
          
          // Direct redirect tanpa dialog (most reliable)
          // Show SnackBar sebagai notifikasi
          WidgetsBinding.instance.addPostFrameCallback((_) {
            try {
              // Redirect
              context.router.replaceAll([const RegisterRoute()]);
              
              // Show notification
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
              
              debugPrint('✅ [AuthStateListener] Redirected to login screen');
            } catch (e) {
              debugPrint('❌ [AuthStateListener] Error: $e');
            }
          });
        }
      },
      child: child,
    );
  }
}