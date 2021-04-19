import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergram/repository/user_repository.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.userRepository) : super(AuthState());

  final UserRepository userRepository;

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is CheckSession) {
      _mapAuthEventToState();
    }
    if (event is LoggedIn) {
      _mapLoggedInEventToState();
    }
    if (event is LoggedOut) {
      _mapLoggedOutEventToState();
    }
  }

  Stream<AuthState> _mapAuthEventToState() async* {
    try {
      bool isLoggedIn = userRepository.isLoggedIn();
      if (isLoggedIn) {
        User user = userRepository.getCurrentUser();
        yield AuthState(user: user, authenticated: true);
      } else {
        yield AuthState(authenticated: false);
      }
    } catch (e) {
      yield AuthState(authenticated: false);
    }
  }

  Stream<AuthState> _mapLoggedInEventToState() async* {
    User user = userRepository.getCurrentUser();
    yield AuthState(user: user);
  }

  Stream<AuthState> _mapLoggedOutEventToState() async* {
    userRepository.logout();
    yield AuthState(authenticated: false);
  }
}
