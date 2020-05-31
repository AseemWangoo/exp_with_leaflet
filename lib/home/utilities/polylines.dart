import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

class MapUtils {
  MapUtils._();

  static List<LatLng> polylines(List<List<double>> points) {
    var _positions = <LatLng>[];

    for (var position in points) {
      final _latitude = position.first;
      final _longitude = position.last;

      _positions.add(LatLng(_latitude, _longitude));
    }

    debugPrint('>>>>> ${_positions.length}');

    return _positions;
  }
}
