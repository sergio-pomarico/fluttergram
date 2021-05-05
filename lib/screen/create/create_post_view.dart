import 'package:flutter/material.dart';
import 'package:fluttergram/bloc/feed/feed_bloc.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/ui_shared/size_config.dart';
import 'package:fluttergram/ui_shared/behavior.dart';
import 'package:fluttergram/widgets/bottom_navbar.dart';
import 'package:fluttergram/widgets/input/input.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostScreen extends StatefulWidget {
  static String route = "/create";

  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePostScreen> {
  TextEditingController content = TextEditingController();
  String contentError;
  FeedBloc feedBloc;
  dynamic post;
  PickedFile image;

  final picker = ImagePicker();

  void validateContent(String _) {
    setState(() {
      contentError = content.text.isEmpty ? 'the content is required' : null;
    });
  }

  void launchCamera() async {
    image = await picker.getImage(source: ImageSource.camera);
  }

  void launchGallery() async {
    image = await picker.getImage(source: ImageSource.gallery);
  }

  void onPressLoadPhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return bottomSheet();
      },
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      width: SizeConfig.screenWidth,
      height: 120,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Select the post image',
              style: TextStyle(color: textColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                TextButton(
                  onPressed: launchCamera,
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_a_photo,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: launchGallery,
                  child: Row(
                    children: [
                      Icon(
                        Icons.photo_album,
                        color: primaryColor,
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: Key('create_post_view'),
      appBar: AppBar(
        title: Text(
          "Create Post",
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: BottomNavBar(selectedMenu: null),
      body: ScrollConfiguration(
        behavior: NeverGrowthScroll(),
        child: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () => onPressLoadPhoto(context),
                  child: SizedBox(
                    height: 320,
                    width: SizeConfig.screenWidth,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                      ),
                      child: Icon(
                        Icons.photo_rounded,
                        color: textColor,
                        size: 48,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                Input(
                  controller: content,
                  multiline: true,
                  label: 'Post',
                  placeholder: 'what are you thinking ?',
                  onChange: validateContent,
                  error: contentError,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
