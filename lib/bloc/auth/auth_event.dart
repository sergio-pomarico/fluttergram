part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoggedIn extends AuthEvent {}

class LoggedOut extends AuthEvent {}

class CheckSession extends AuthEvent {}
