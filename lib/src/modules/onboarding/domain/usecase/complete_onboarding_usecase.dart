import 'package:injectable/injectable.dart';
import 'package:report/src/modules/onboarding/domain/repositories/onboarding_repository.dart';

@lazySingleton
class CompleteOnboardingUseCase {
  final OnboardingRepository repository;

  CompleteOnboardingUseCase(this.repository);

  Future<void> call() {
    return repository.setOnboardingCompleted();
  }
}
