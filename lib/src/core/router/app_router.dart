import 'package:auto_route/auto_route.dart';
import 'package:report/src/core/router/auth_guard.dart';
import 'package:report/src/modules/presentation/screens/profile/profile_screen.dart';
import 'package:report/src/modules/presentation/screens/qr/qr_screen.dart';
import '../../modules/presentation/screens/auth/splash/splash_screen.dart';
import '../../modules/presentation/screens/auth/register/register_screen.dart';
import '../../modules/presentation/screens/auth/login/login_screen.dart';
import '../../modules/presentation/screens/home/home_screen.dart';
import '../../modules/presentation/screens/main_layout/main_layout_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: MainLayoutRoute.page, guards: [AuthGuard()]),
  ];
}
