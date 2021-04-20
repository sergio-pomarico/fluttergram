import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttergram/repository/user_repository.dart';

import 'package:fluttergram/ui_shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttergram/bloc/bloc.dart';
import 'helpers/navigator.dart';
import 'locator.dart';
import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupApp();
  setupLocator();
  runApp(AppState());
}

Future<void> setupApp() async {
  try {
    await Firebase.initializeApp();
  } on Exception catch (e) {
    print('setupApp ${e.toString()}');
    return;
  }
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserRepository userRepository = UserRepository();
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(userRepository),
      ),
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fluttergram',
      theme: theme(),
      navigatorKey: locator<NavigationService>().navigatorKey,
      initialRoute: UIRouter.initialRoute,
      onGenerateRoute: UIRouter.generateRoute,
    );
  }
}
