import 'package:injectable/injectable.dart';
import 'package:report/src/modules/onboarding/data/datasources/local/abstract/onboarding_local_data_source.dart';
import 'package:report/src/modules/onboarding/domain/repositories/onboarding_repository.dart';

@LazySingleton(as: OnboardingRepository)
class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingLocalDataSource localDataSource;

  OnboardingRepositoryImpl(this.localDataSource);

  @override
  Future<bool> isOnboardingCompleted() {
    return localDataSource.isOnboardingCompleted();
  }

  @override
  Future<void> setOnboardingCompleted() {
    return localDataSource.setOnboardingCompleted();
  }
}
