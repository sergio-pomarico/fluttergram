part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SignIn extends SigninEvent {
  final String email;
  final String password;

  SignIn({this.email, this.password});
}
