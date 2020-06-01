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
        ),
      );
    }
    debugPrint('>>>> listOfPolylines ${_polylines.length}');

    return _polylines;
  }

  static List<Marker> listOfMarkers(List<MapResponse> mapData) {
    var _mapMarkers = <Marker>[];

    for (var mapCoordinate in mapData) {
      var _points = mapCoordinate.geometry.coordinates.first.first;
      debugPrint('c  _markers $_points');

      _mapMarkers.add(
        Marker(
          width: 80.0,
          height: 80.0,
          point: validator(_points),
          builder: (ctx) => FlutterLogo(),
        ),
      );

      debugPrint('>>>>> POINT ${validator(_points)}');
    }

    return _mapMarkers;
  }

  static LatLng validator(List<double> points) {
    if (points.length == 3) {
      return LatLng(points[1], points.first);
    } else {
      return LatLng(points.last, points.first);
    }
  }
}
