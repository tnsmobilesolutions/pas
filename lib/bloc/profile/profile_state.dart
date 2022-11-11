part of 'profile_bloc.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class MyprofileState extends ProfileState {
  userModel currentUser;
  MyprofileState({
    required this.currentUser,
  });
}

class EditProfileState extends ProfileState {}
