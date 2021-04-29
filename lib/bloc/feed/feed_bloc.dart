import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttergram/repository/database.dart';
import 'package:fluttergram/repository/user.dart';
import 'package:meta/meta.dart';

part 'feed_event.dart';
part 'feed_state.dart';

class FeedBloc extends Bloc<FeedEvent, FeedState> {
  FeedBloc(this.repository) : super(FeedState());

  final UserRepository repository;
  DatabaseRepository database = DatabaseRepository();

  @override
  Stream<FeedState> mapEventToState(
    FeedEvent event,
  ) async* {
    if (event is Load) {
      yield* _mapLoadToState();
    }
  }

  Stream<FeedState> _mapLoadToState() async* {
    try {
      QuerySnapshot data = await database.readCollections('posts');
      dynamic parsedData = data.docs.map((doc) => doc.data());
      yield FeedState(posts: parsedData);
    } catch (e) {
      print(e.toString());
    }
  }
}
