import 'package:exp_with_leaflet/app_level/services/apis/maps.dart';
import 'package:exp_with_leaflet/app_level/services/locations/location_service.dart';

import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<LocationService>(() => LocationService());
  locator.registerLazySingleton<MapsService>(() => MapsService());
}
