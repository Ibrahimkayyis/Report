import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

/// ✅ Sekarang LoginSuccess membawa token dan role
class LoginSuccess extends LoginState {
  final String token;
  final String role;

  const LoginSuccess(this.token, this.role);

  @override
  List<Object?> get props => [token, role];
}

class LoginFailure extends LoginState {
  final String error;
  const LoginFailure(this.error);

  @override
  List<Object?> get props => [error];
}
