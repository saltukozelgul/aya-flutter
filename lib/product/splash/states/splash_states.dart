// abstract class for splash states
abstract class SplashStates {
  const SplashStates();
}

// state that when splash screen is loading, first process is checking user logged in or not
class InitialState extends SplashStates {
  const InitialState();
}

// state that when user is logged in before -> navigate home screen
class UserLoggedInState extends SplashStates {}

// state that when user is not logged in before-> navigate introduction screen
class UserNotLoggedInState extends SplashStates {
  const UserNotLoggedInState();
}

// state that when user is model is returns null
class NullableModelState extends SplashStates {
  const NullableModelState();
}
