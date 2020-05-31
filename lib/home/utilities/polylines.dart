import 'package:flutter/cupertino.dart';
import 'package:latlong/latlong.dart';

class MapUtils {
  MapUtils._();

  static List<LatLng> polylines(List<List<double>> points) {
    var _positions = <LatLng>[];

    for (var position in points) {
      final _latitude = position.first.clamp(-90.0, 90.0);
      final _longitude = position.last.clamp(-180.0, 180.0);

      _positions.add(LatLng(_latitude, _longitude));
    }

    return _positions;
  }
}
