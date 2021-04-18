import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttergram/repository/user_repository.dart';

import 'package:fluttergram/ui_shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluttergram/bloc/login/login_bloc.dart';
import 'package:fluttergram/bloc/auth/auth_bloc.dart';

import 'routes/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupApp();
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
      BlocProvider<AuthBloc>(
        create: (_) => AuthBloc(),
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
      initialRoute: UIRouter.initialRoute,
      onGenerateRoute: UIRouter.generateRoute,
    );
  }
}
