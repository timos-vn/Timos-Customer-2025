// Base abstract class for all BLoC events
abstract class BaseEvent {
  const BaseEvent();
}

// Base abstract class for all BLoC states  
abstract class BaseState {
  const BaseState();
}

// Common loading state mixin
mixin LoadingState on BaseState {
  bool get isLoading;
}

// Common error state mixin
mixin ErrorState on BaseState {
  String? get errorMessage;
}

// Common success state mixin
mixin SuccessState on BaseState {
  String? get successMessage;
}