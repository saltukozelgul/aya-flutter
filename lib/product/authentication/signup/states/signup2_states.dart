abstract class SignupTwoStates {
  const SignupTwoStates();
}

// initial state
class InitialState extends SignupTwoStates {
  const InitialState();
}

// loading state
class LoadingState extends SignupTwoStates {
  final bool isLoading;
  const LoadingState(this.isLoading);
}

// for change obsecure state in login screen-> password text field
class ChangeObsecureState extends SignupTwoStates {
  const ChangeObsecureState();
}

// for check if email is taken
class IsEmailExistsState extends SignupTwoStates {
  const IsEmailExistsState();
}

// for validate form
class ValidateState extends SignupTwoStates {
  final bool isValidate;
  const ValidateState(this.isValidate);
}

// if signup is success
class SuccessState extends SignupTwoStates {
  const SuccessState();
}

// if signup is error -- network error
class ErrorState extends SignupTwoStates {
  const ErrorState();
}
