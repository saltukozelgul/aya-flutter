abstract class SignupStatesOne {
  const SignupStatesOne();
}

// for initial state in signup screen -> show signup screen, first state
class InitialState extends SignupStatesOne {
  final String? currentImage;
  final bool imagePicked;
  final bool isValidate;
  const InitialState(this.currentImage, this.imagePicked, this.isValidate);
}

// if user exists in database -> show error
class UserExists extends SignupStatesOne {
  const UserExists();
}

// opens next signup screen if username is not exists in database
class ToNextPage extends SignupStatesOne {
  const ToNextPage();
}

// for validate form
class ErrorState extends SignupStatesOne {
  const ErrorState();
}
