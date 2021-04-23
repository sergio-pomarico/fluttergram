part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ProfileImage extends ProfileEvent {
  ProfileImage(this.path);
  final String path;
}

class CurrentUser extends ProfileEvent {}
