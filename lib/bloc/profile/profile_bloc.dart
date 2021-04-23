import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttergram/repository/storage.dart';
import 'package:fluttergram/repository/user.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(this.repository) : super(ProfileState());

  final UserRepository repository;
  StorageRepository storage = StorageRepository();

  @override
  Stream<ProfileState> mapEventToState(
    ProfileEvent event,
  ) async* {
    if (event is ProfileImage) {
      yield* _mapProfileImageEventToState(event.path);
    }
    if (event is CurrentUser) {
      yield* _mapCurrentUserEventToState();
    }
  }

  Stream<ProfileState> _mapCurrentUserEventToState() async* {
    try {
      User user = repository.getCurrentUser();
      yield ProfileState(user: user);
    } catch (e) {
      print(e.toString());
    }
  }

  Stream<ProfileState> _mapProfileImageEventToState(String photo) async* {
    String path = 'photos/${DateTime.now().millisecondsSinceEpoch}.jpg';
    User user = repository.getCurrentUser();

    await storage.uploadFile(path, photo);
    String photoUrl = await storage.getDownloadUrl(path);

    await user.updateProfile(photoURL: photoUrl);
    user.reload();
    yield ProfileState(user: user);
  }
}
