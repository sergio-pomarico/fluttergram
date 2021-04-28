part of 'login_bloc.dart';

class LoginState {
  final String authError;
  final User user;
  LoginState({
    this.authError = '',
    this.user,
  });
}
