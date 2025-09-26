import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

/// Status awal, belum dicek
class AuthInitial extends AuthState {}

/// Sedang cek token
class AuthLoading extends AuthState {}

/// User sudah login
class AuthAuthenticated extends AuthState {
  final String token;
  final String role;

  const AuthAuthenticated({required this.token, required this.role});

  @override
  List<Object?> get props => [token, role];
}

/// User belum login / token tidak ada
class AuthUnauthenticated extends AuthState {}

/// Error saat cek auth
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
