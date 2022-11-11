part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class MyprofileEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  userModel updatedUser;
  EditProfileEvent({
    required this.updatedUser,
  });
}
