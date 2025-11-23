import 'package:injectable/injectable.dart';
import 'package:report/src/core/log/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../abstract/onboarding_local_data_source.dart';

@LazySingleton(as: OnboardingLocalDataSource) 
class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  static const _keyOnboarding = 'is_onboarding_completed';

  @override
  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool(_keyOnboarding) ?? false;
    AppLogger.d('Onboarding status loaded: $value');
    return value;
  }

  @override
  Future<void> setOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyOnboarding, true);
    AppLogger.d('Onboarding status saved: true');
  }
}
