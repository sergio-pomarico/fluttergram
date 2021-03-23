import 'package:flutter/material.dart';
import 'package:fluttergram/ui_shared/theme.dart';

import './router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttergram',
      theme: theme(),
      initialRoute: UIRouter.initialRoute,
      onGenerateRoute: UIRouter.generateRoute,
    );
  }
}
