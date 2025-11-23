import 'package:equatable/equatable.dart';

abstract class OnboardingState extends Equatable {
  @override
  List<Object?> get props => [];
}

class OnboardingInitial extends OnboardingState {}

class OnboardingChecking extends OnboardingState {}

class OnboardingCompleted extends OnboardingState {}

class OnboardingNotCompleted extends OnboardingState {}

class OnboardingError extends OnboardingState {
  final String message;

  OnboardingError(this.message);

  @override
  List<Object?> get props => [message];
}
