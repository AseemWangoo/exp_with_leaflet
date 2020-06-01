import 'package:exp_with_leaflet/app_level/models/api_response.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapUtils {
  MapUtils._();

  static List<LatLng> polylines(List<List<double>> points) {
    var _positions = <LatLng>[];

    for (var position in points) {
      var _latitude = 0.0;
      var _longitude = 0.0;

      if (position.length == 3) {
        _latitude = position.first.clamp(-90.0, 90.0);
        _longitude = position[1].clamp(-180.0, 180.0);
      } else {
        _latitude = position.first.clamp(-90.0, 90.0);
        _longitude = position.last.clamp(-180.0, 180.0);
      }

      _positions.add(LatLng(_latitude, _longitude));
    }

    return _positions;
  }

  static List<Polyline> listOfPolylines(List<MapResponse> mapData) {
    var _polylines = <Polyline>[];

    for (var mapCoordinate in mapData) {
      var _points = mapCoordinate.geometry.coordinates.first;

      _polylines.add(
        Polyline(
          points: polylines(_points),
          strokeWidth: 4.0,
          color: Colors.red,
          gradientColors: [
            Color(0xffE40203),
            Color(0xffFEED00),
            Color(0xff007E2D),
          ],
        ),
      );
    }
    debugPrint('>>>> listOfPolylines ${_polylines.length}');

    return _polylines;
  }
}
