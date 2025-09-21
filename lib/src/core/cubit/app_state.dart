import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Status konektivitas (simple)
enum ConnectivityStatus { online, offline }

/// State global aplikasi — ringan, mudah dikembangkan
class AppState extends Equatable {
  final ThemeMode themeMode;
  final bool isAuthenticated;
  final String? userId;
  final ConnectivityStatus connectivityStatus;

  const AppState({
    this.themeMode = ThemeMode.light,
    this.isAuthenticated = false,
    this.userId,
    this.connectivityStatus = ConnectivityStatus.online,
  });

  AppState copyWith({
    ThemeMode? themeMode,
    bool? isAuthenticated,
    String? userId,
    ConnectivityStatus? connectivityStatus,
  }) {
    return AppState(
      themeMode: themeMode ?? this.themeMode,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      userId: userId ?? this.userId,
      connectivityStatus: connectivityStatus ?? this.connectivityStatus,
    );
  }

  @override
  List<Object?> get props => [themeMode, isAuthenticated, userId, connectivityStatus];
}
