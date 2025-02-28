abstract class UserProfileState {}

class UserProfileInitial extends UserProfileState {}

class UserProfileLoading extends UserProfileState {}

class UserProfileLoaded extends UserProfileState {
  final Map<String, dynamic> userData;

  UserProfileLoaded(this.userData);
}

class UserProfileError extends UserProfileState {
  final String message;
  UserProfileError(this.message);
}

// edit user profile
class EditUserProfileLoading extends UserProfileState {}

class EditUserProfileSuccess extends UserProfileState {}

class EditUserProfileError extends UserProfileState {}
