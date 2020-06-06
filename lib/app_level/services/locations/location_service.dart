import 'package:flutter/rendering.dart';
import 'package:location/location.dart';

import 'package:logging/logging.dart';
import 'package:latlong/latlong.dart';

class LocationService {
  LocationService() : _location = Location() {
    _currentLatLng = LatLng(0.0, 0.0);
    _location.onLocationChanged.listen(_onChanged);
  }

  // --------------------------------------------- EXPOSED ---------------------------------------------

  LatLng get currentLatLng => _currentLatLng;

  // --------------------------------------------- INTERNALS ---------------------------------------------

  final Location _location;
  LatLng _currentLatLng;
  static final _locationServiceLogger = Logger('LocationService');

  void _onChanged(LocationData current) {
    try {
      //
      debugPrint('CURRE LOCATION ${current.toString()}');
      _currentLatLng.latitude = current?.latitude;
      _currentLatLng.longitude = current?.longitude;
    } catch (exc) {
      _locationServiceLogger.severe(exc.toString());
    }
  }
}
