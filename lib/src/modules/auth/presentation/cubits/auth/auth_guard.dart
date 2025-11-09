import 'package:auto_route/auto_route.dart';
import 'package:report/src/core/service_locator/service_locator.dart';
import 'package:report/src/modules/auth/domain/repositories/auth_repository.dart';
import '../../../../../core/router/app_router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authRepository = sl<AuthRepository>();
    final token = await authRepository.getSavedToken();

    if (token != null && token.isNotEmpty) {
      // ✅ logged in → lanjutkan ke route tujuan
      resolver.next(true);
    } else {
      // ❌ tidak login → redirect ke Register
      router.replaceAll([const RegisterRoute()]);
    }
  }
}
