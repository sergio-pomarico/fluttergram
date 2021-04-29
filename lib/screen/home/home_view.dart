import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttergram/bloc/feed/feed_bloc.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/post.dart';

class HomeScreen extends StatefulWidget {
  static String route = "/feed";

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  FeedBloc feedBloc;
  dynamic posts;

  @override
  void initState() {
    feedBloc = BlocProvider.of<FeedBloc>(context);
    feedBloc.add(Load());
    setState(() {
      posts = feedBloc.state.posts;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      key: Key('home_view'),
      appBar: AppBar(
        title: Text(
          "Home",
          textAlign: TextAlign.center,
        ),
        leading: SizedBox(),
      ),
      backgroundColor: Color(0xFFF5F6F9),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.home),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (posts?.isNotEmpty ?? false)
                ...posts
                    .map<Widget>(
                      (post) => Post(
                        author: post['author'],
                        content: post['content'],
                        postURL: post['photo'],
                        profileURL: post['photo'],
                      ),
                    )
                    .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
