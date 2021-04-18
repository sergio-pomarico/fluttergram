part of 'login_bloc.dart';

class LoginState {
  final String email;
  final String password;
  final String authError;

  LoginState({this.email = '', this.password = '', this.authError = ''});
}
