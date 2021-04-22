import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/screen/home/home_view.dart';

import 'package:fluttergram/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(this.repository) : super(LoginState());

  final UserRepository repository;
  final NavigationService navigator = locator<NavigationService>();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is Login) {
      yield* _mapLoginWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> _mapLoginWithCredentialsPressedToState(
      {String email, String password}) async* {
    try {
      await repository.loginWithEmailAndPassword(email.trim(), password.trim());
      navigator.replace(navigator.navigatorKey, route: HomeScreen.route);
    } catch (e) {
      print(e.toString());
    }
  }
}
