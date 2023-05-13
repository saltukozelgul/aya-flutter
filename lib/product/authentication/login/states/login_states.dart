abstract class LoginStates {
  const LoginStates();
}

// for initial state in login screen -> show login screen, first state
class InitialState extends LoginStates {
  const InitialState();
}

// for change obsecure state in login screen-> password text field
class ChangeObsecureState extends LoginStates {
  const ChangeObsecureState();
}

// for loading state in login screen -> progress indicator
class LoadingState extends LoginStates {
  final bool isLoading;
  const LoadingState(this.isLoading);
}

// for success state in login screen -> navigate to home screen
class LoginSuccess extends LoginStates {
  const LoginSuccess();
}

// for error state in login screen -> show error message
class ErrorState extends LoginStates {
  const ErrorState();
}
