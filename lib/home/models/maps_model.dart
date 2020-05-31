import 'package:exp_with_leaflet/app_level/models/api_response.dart';
import 'package:exp_with_leaflet/app_level/services/apis/maps.dart';
import 'package:exp_with_leaflet/locator.dart';

import 'package:flutter/foundation.dart';

class MapsModel with ChangeNotifier {
  MapsModel();

  Future<void> get initRoute => _initRoute;

  List<MapResponse> get initResponse => _listOfResp;

  // --------------------------------------------- INTERNALS ---------------------------------------------
  final _mapService = locator<MapsService>();

  var _listOfResp = <MapResponse>[];

  Future<void> get _initRoute async {
    _listOfResp = await _mapService.getRoute();
    notifyListeners();
  }
}
