import 'package:exp_with_leaflet/app_level/extensions/color_extension.dart';
import 'package:exp_with_leaflet/app_level/models/api_response.dart';
import 'package:exp_with_leaflet/home/widgets/custom_marker.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapUtils {
  MapUtils._();

  static List<LatLng> polylines(List<List<double>> points) {
    var _positions = <LatLng>[];

    for (var position in points) {
      _positions.add(validator(position));
    }

    return _positions;
  }

  static List<Polyline> listOfPolylines(List<MapResponse> mapData) {
    var _polylines = <Polyline>[];

    for (var mapCoordinate in mapData) {
      var _points = mapCoordinate.geometry.coordinates.first;
      var _props = mapCoordinate.properties.color;
      var _color = HexColor.fromHex(_props);

      _polylines.add(
        Polyline(
          points: polylines(_points),
          strokeWidth: 1.0,
          color: _color,
        ),
      );
    }

    return _polylines;
  }

  static List<Marker> listOfMarkers(List<MapResponse> mapData) {
    var _mapMarkers = <Marker>[];

    for (var mapCoordinate in mapData) {
      var _points = mapCoordinate.geometry.coordinates.first.first;

      var _props = mapCoordinate.properties.color;
      var _color = HexColor.fromHex(_props);

      _mapMarkers.add(
        CustomMarker(
          color: _color,
          data: mapCoordinate.properties,
          position: validator(_points),
        ),
      );
    }

    return _mapMarkers;
  }

  static List<LatLng> fetchInitRespPoints(List<MapResponse> mapData) {
    var _latLng = <LatLng>[];

    for (var mapCoordinate in mapData) {
      var _points = mapCoordinate.geometry.coordinates.first.first;
      _latLng.add(validator(_points));
    }

    return _latLng;
  }

  static LatLng validator(List<double> points) {
    if (points.length == 3) {
      return LatLng(points[1], points.first);
    } else {
      return LatLng(points.last, points.first);
    }
  }
}
