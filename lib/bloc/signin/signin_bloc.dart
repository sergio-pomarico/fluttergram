import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:fluttergram/screen/home/home_view.dart';
import 'package:fluttergram/repository/user_repository.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/helpers/navigator.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc(this.repository) : super(SigninInitial());

  final UserRepository repository;
  final NavigationService navigator = locator<NavigationService>();

  @override
  Stream<SigninState> mapEventToState(
    SigninEvent event,
  ) async* {
    if (event is SignIn) {
      yield* _mapSignInWithCredentialsPressedToState(
          email: event.email, password: event.password);
    }
  }

  Stream<SigninState> _mapSignInWithCredentialsPressedToState(
      {String email, String password}) async* {
    try {
      await repository.registerUserWithEmailPass(email.trim(), password.trim());
      navigator.replace(route: HomeScreen.route);
    } catch (e) {
      print(e.toString());
    }
  }
}
