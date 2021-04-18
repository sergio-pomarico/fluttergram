import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:fluttergram/repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.repository) : super(LoginState());

  final UserRepository repository;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      try {
        //Login user with firebase
        User user = await repository.loginWithEmailAndPassword(
            event.email, event.password);
        print(user);
      } catch (e) {
        //on error update authError
        LoginState(authError: e.toString());
      }
    }
  }
}
