import 'package:exp_with_leaflet/app_level/services/apis/maps.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<MapsService>(() => MapsService());
}
