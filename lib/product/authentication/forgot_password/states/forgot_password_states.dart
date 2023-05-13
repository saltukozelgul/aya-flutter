abstract class ForgotPasswordStates {
  const ForgotPasswordStates();
}

//* Main states *//

// Loading state for the loading indicator
class LoadingState extends ForgotPasswordStates {
  final bool isLoading;
  const LoadingState(this.isLoading);
}

// Success state for the success message, when the password is changed
class SuccessState extends ForgotPasswordStates {
  const SuccessState();
}

// Error state for the error message, when the server is down
class ErrorState extends ForgotPasswordStates {
  final bool serverError;
  const ErrorState(this.serverError);
}

// Wrong code state for the error message, when the code is wrong
class WrongCodeState extends ForgotPasswordStates {
  const WrongCodeState();
}

// Timer state for the timer on the code validation page
class TimerState extends ForgotPasswordStates {
  const TimerState();
}

// Passwords not match state for the error message, when the passwords are not the same
class PasswordsNotMatchState extends ForgotPasswordStates {
  const PasswordsNotMatchState();
}

//* Page States *//
class SendCodeState extends ForgotPasswordStates {
  final bool isMailTaken;

  const SendCodeState(this.isMailTaken);
}

class ValidateEmailCodeState extends ForgotPasswordStates {
  final String emailText;
  final int counter;
  const ValidateEmailCodeState(this.emailText, this.counter);
}

class ChangePasswordState extends ForgotPasswordStates {
  const ChangePasswordState();
}
