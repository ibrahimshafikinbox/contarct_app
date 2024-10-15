// import 'package:equatable/equatable.dart';

// abstract class UserProfileState extends Equatable {
//   const UserProfileState();

//   @override
//   List<Object> get props => [];
// }

// class UserProfileInitial extends UserProfileState {}

// class UserProfileLoading extends UserProfileState {}

// class UserProfileLoaded extends UserProfileState {
//   final Map<String, dynamic> userData;

//   const UserProfileLoaded(this.userData);

//   @override
//   List<Object> get props => [userData];
// }

// class UserProfileError extends UserProfileState {
//   final String errorMessage;

//   const UserProfileError(this.errorMessage);

//   @override
//   List<Object> get props => [errorMessage];
// }
import 'package:client_project/Feature/Profile/cubit/profilr_cubit.dart';

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
