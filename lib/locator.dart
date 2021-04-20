import 'package:get_it/get_it.dart';

import 'helpers/navigator.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator..registerLazySingleton(() => NavigationService());
}
