import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app_state.dart';

/// AppCubit: mengelola state global (theme, auth, connectivity)
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppState());

  // -------- Theme --------
  void toggleTheme() {
    final newTheme = state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(state.copyWith(themeMode: newTheme));
  }

  void setLightTheme() => emit(state.copyWith(themeMode: ThemeMode.light));
  void setDarkTheme() => emit(state.copyWith(themeMode: ThemeMode.dark));

  // -------- Auth --------
  /// Simple login (di sini hanya simulasikan)
  void login({required String userId}) {
    emit(state.copyWith(isAuthenticated: true, userId: userId));
  }

  void logout() {
    emit(state.copyWith(isAuthenticated: false, userId: null));
  }

  // -------- Connectivity --------

  void setConnectivity(ConnectivityStatus status) {
    emit(state.copyWith(connectivityStatus: status));
  }
}
