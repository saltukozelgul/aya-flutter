abstract class ProfileStates {
  const ProfileStates();
}

class ProfileInitialState extends ProfileStates {
  const ProfileInitialState();
}

class ProfileLoadingState extends ProfileStates {
  const ProfileLoadingState();
}

class GeneralPageState extends ProfileStates {
  const GeneralPageState();
}

class ListsPageState extends ProfileStates {
  const ListsPageState();
}

class BadgePageState extends ProfileStates {
  const BadgePageState();
}

class DeleteListState extends ProfileStates {
  const DeleteListState();
}

class LogOutState extends ProfileStates {
  const LogOutState();
}

class ProfileErrorState extends ProfileStates {
  final String message;
  const ProfileErrorState(this.message);
}
