import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:report/src/modules/presentation/cubits/auth/auth_cubit.dart';

import 'gen/colors.gen.dart';
import 'gen/i18n/translations.g.dart';

import 'src/core/cubit/app_cubit.dart';
import 'src/core/cubit/app_state.dart';
import 'src/core/service_locator/service_locator.dart';
import 'src/core/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // inisialisasi dependency injection
  await configureDependencies();

  // register AppCubit secara manual (global singleton)
  if (!sl.isRegistered<AppCubit>()) {
    sl.registerLazySingleton<AppCubit>(() => AppCubit());
  }

  runApp(const ReportApp());
}

class ReportApp extends StatelessWidget {
  const ReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appCubit = sl<AppCubit>();
    final authCubit = sl<AuthCubit>();
    final appRouter = AppRouter();

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return TranslationProvider(
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: appCubit),
              BlocProvider.value(value: authCubit),
            ],
            child: BlocBuilder<AppCubit, AppState>(
              builder: (context, state) {
                return MaterialApp.router(
                  title: 'REPORT',
                  themeMode: state.themeMode,
                  theme: ThemeData(
                    fontFamily: 'Poppins',
                    scaffoldBackgroundColor: ColorName.background,
                    appBarTheme: const AppBarTheme(
                      backgroundColor: ColorName.primary,
                      foregroundColor: ColorName.onPrimary,
                    ),
                    textTheme: const TextTheme(
                      bodyMedium: TextStyle(color: ColorName.textPrimary),
                      bodyLarge: TextStyle(color: ColorName.textPrimary),
                    ),
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: ColorName.primary,
                      primary: ColorName.primary,
                      onPrimary: ColorName.onPrimary,
                      surface: ColorName.background,
                    ),
                  ),
                  darkTheme: ThemeData.dark().copyWith(
                    scaffoldBackgroundColor: ColorName.background,
                  ),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocaleUtils.supportedLocales,
                  locale: LocaleSettings.currentLocale.flutterLocale,
                  routerConfig: appRouter.config(),
                  builder: (context, child) {
                    return child ?? const SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
