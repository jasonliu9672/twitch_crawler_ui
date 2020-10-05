import 'package:get_it/get_it.dart';
import 'package:twitch_crawler_ui/presentation/services/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => MainContentNav());
}
