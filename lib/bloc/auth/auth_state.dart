part of 'auth_bloc.dart';

class AuthState {
  final bool authenticated;
  final User user;

  AuthState({
    this.authenticated = false,
    this.user,
  });
}
