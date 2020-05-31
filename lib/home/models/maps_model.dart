import 'package:exp_with_leaflet/app_level/services/apis/maps.dart';
import 'package:exp_with_leaflet/locator.dart';

import 'package:flutter/foundation.dart';

class MapsModel with ChangeNotifier {
  MapsModel();

  Future<void> get initRoute => _initRoute;

  // --------------------------------------------- INTERNALS ---------------------------------------------
  final _mapService = locator<MapsService>();

  Future<void> get _initRoute async {
    await _mapService.getRoute();
    notifyListeners();
  }
}
