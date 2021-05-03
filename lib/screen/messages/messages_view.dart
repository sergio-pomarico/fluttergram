import 'package:flutter/material.dart';
import 'package:fluttergram/repository/data.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/input_search.dart';
import 'package:fluttergram/widgets/message.dart';
import 'package:fluttergram/widgets/stories.dart';

class MessageScreen extends StatefulWidget {
  static String route = "/messages";

  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Key('message_view'),
      appBar: AppBar(
        title: Text(
          "Chat",
          textAlign: TextAlign.center,
        ),
        leading: SizedBox(),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: MenuState.message),
      body: Container(
        child: ListView(
          children: [
            InputSearch(),
            SizedBox(height: SizeConfig.screenHeight * 0.04),
            Container(
              child: Row(
                children: <Widget>[
                  for (final storie in storiesJson)
                    Stories(
                      text: storie['name'],
                      image: storie['image'],
                    ),
                ],
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.02),
            for (final message in messagesJson)
              Message(
                name: message['name'],
                message: message['message'],
                groupChat: message['group'],
                connect: message['connect'],
                image1: message['image1'],
                image2: message['image2'],
              ),
          ],
        ),
      ),
    );
  }
}
