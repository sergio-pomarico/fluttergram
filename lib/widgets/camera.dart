import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:fluttergram/ui_shared/constants.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/helpers/navigator.dart';

enum CameraState { NONE, LOADING, LOADED, ERROR }

class Camera extends StatefulWidget {
  Camera({Key key}) : super(key: key);

  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  final NavigationService navigator = locator<NavigationService>();
  CameraState cameraState = CameraState.NONE;
  List<CameraDescription> cameras;
  CameraController cameraController;
  XFile file;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  @override
  void dispose() {
    super.dispose();
    cameraController.dispose();
  }

  Future<void> initializeCamera() async {
    if (!mounted) return;
    setState(() {
      cameraState = CameraState.LOADING;
    });

    cameras = await availableCameras();
    cameraController = CameraController(cameras[0], ResolutionPreset.high);

    //manage camera object
    await cameraController.initialize();

    if (cameraController.value.hasError) {
      setState(() {
        cameraState = CameraState.ERROR;
      });
    } else {
      setState(() {
        cameraState = CameraState.LOADED;
      });
    }
  }

  void takePicture(BuildContext context) async {
    file = await cameraController.takePicture();
    navigator.goBack(navigator.navigatorKey, file.path);
  }

  Widget buildScaffold(BuildContext context, {Widget body}) {
    return Scaffold(
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () => takePicture(context),
        child: Icon(Icons.photo_rounded),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (cameraState == CameraState.NONE || cameraState == CameraState.LOADING) {
      return buildScaffold(
        context,
        body: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.white,
          ),
        ),
      );
    } else if (cameraState == CameraState.LOADED) {
      return buildScaffold(
        context,
        body: CameraPreview(cameraController),
      );
    } else if (cameraState == CameraState.ERROR) {
      return buildScaffold(
        context,
        body: Center(
          child: Text('¡Ooops! 😩. Camera has failed, restart app'),
        ),
      );
    }
    return SizedBox();
  }
}
