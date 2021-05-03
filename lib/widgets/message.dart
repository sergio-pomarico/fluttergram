import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';

class Message extends StatelessWidget {
  final String name;
  final String message;
  final bool groupChat;
  final bool connect;
  final String image1;
  final String image2;

  Message(
      {this.name,
      this.message,
      this.groupChat,
      this.connect,
      this.image1,
      this.image2});

  @override
  Widget build(BuildContext context) {
    final element = Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          if (!groupChat)
            Container(
              padding: EdgeInsets.only(
                left: 17,
              ),
              child: Center(
                child: SizedBox(
                  height: getProportionateScreenHeight(70),
                  width: getProportionateScreenWidth(70),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      SizedBox(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFF5F6F9),
                          ),
                          child: CircleAvatar(
                            maxRadius: 40,
                            backgroundImage: NetworkImage(image1),
                          ),
                        ),
                      ),
                      if (connect)
                        Positioned(
                          right: 4,
                          bottom: 0,
                          child: SizedBox(
                            height: 25,
                            width: 25,
                            child: Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                  ),
                                ],
                                shape: BoxShape.circle,
                                color: Color(0xFFF5F6F9),
                              ),
                              padding: EdgeInsets.all(4.0),
                              child: CircleAvatar(
                                maxRadius: 10,
                                backgroundColor: Colors.blue.shade700,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
          if (groupChat)
            Container(
              padding: EdgeInsets.only(
                left: 17,
                right: 0,
              ),
              child: Center(
                child: SizedBox(
                  height: getProportionateScreenHeight(70),
                  width: getProportionateScreenWidth(70),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Positioned(
                        left: 30,
                        right: 0,
                        top: 0,
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: Container(
                            child: CircleAvatar(
                              maxRadius: 40,
                              backgroundImage: NetworkImage(image1),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 10,
                        left: 0,
                        bottom: 0,
                        child: SizedBox(
                          height: 48,
                          width: 48,
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.white,
                                  spreadRadius: 3,
                                  //blurRadius: 1,
                                ),
                              ],
                              shape: BoxShape.circle,
                            ),
                            child: CircleAvatar(
                              maxRadius: 40,
                              backgroundImage: NetworkImage(image2),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          Container(
            padding: EdgeInsets.only(
              left: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  name,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return element;
  }
}
