import 'dart:async';

import 'package:exp_with_leaflet/app_level/models/curr_location.dart';
import 'package:exp_with_leaflet/app_level/services/locations/location_service.dart';
import 'package:exp_with_leaflet/home/models/maps_model.dart';
import 'package:exp_with_leaflet/home/utilities/constants.dart';
import 'package:exp_with_leaflet/home/utilities/polylines.dart';
import 'package:exp_with_leaflet/locator.dart';
import 'package:exp_with_leaflet/splash/splash.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';
import 'package:unicorndial/unicorndial.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapController mapController;
  MapsModel get _mapService => Provider.of<MapsModel>(context, listen: false);
  // final _streamController = locator<LocationService>().locationController;
  final _stream = locator<LocationService>().locationStream;

  StreamSubscription<UserCurrentLocation> _locationSubscription;

  UserCurrentLocation _currLocation = UserCurrentLocation(
    latitude: 48.427920,
    longitude: -123.358090,
  );

  final _defLocation = UserCurrentLocation(
    latitude: 48.427920,
    longitude: -123.358090,
  );

  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _locationSubscription = _stream.listen((event) {
      debugPrint('IAM RUNNING NOW ${event.latitude} ${event.longitude}');
      _currLocation = event;
    });
  }

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(title: const Text(HomeConstants.homeTitle)),
      body: SafeArea(
        child: Consumer<MapsModel>(
          builder: (_, model, child) {
            //
            final _resp = model.initResponse;
            if (_resp.isEmpty) {
              return child;
            }

            final _listOfPolyLines = MapUtils.listOfPolylines(_resp);
            final _markers = MapUtils.listOfMarkers(_resp);

            return FlutterMap(
              layers: [
                TileLayerOptions(
                  urlTemplate: HomeConstants.mapUrl,
                  subdomains: HomeConstants.mapDomain,
                ),
                PolylineLayerOptions(polylines: _listOfPolyLines),
                MarkerLayerOptions(markers: _markers)
              ],
              options: MapOptions(
                center: LatLng(_defLocation.latitude, _defLocation.longitude),
                zoom: 8.0,
              ),
              mapController: mapController,
            );
          },
          child: const SplashScreen(),
        ),
      ),
      floatingActionButton: UnicornDialer(
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.6),
        parentButtonBackground: Colors.redAccent,
        parentButton: const Icon(Icons.menu),
        childButtons: <UnicornButton>[
          UnicornButton(
            currentButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                mapController.move(
                  LatLng(_defLocation.latitude, _defLocation.longitude),
                  8.0,
                );
                _locationSubscription.pause();
              },
              heroTag: HomeConstants.pauseTracking,
              child: const Icon(Icons.pause),
              tooltip: HomeConstants.pauseTracking,
            ),
            hasLabel: true,
            labelText: HomeConstants.pauseTracking,
          ),
          UnicornButton(
            currentButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                final _isStreamPaused = _locationSubscription.isPaused;

                if (_isStreamPaused) {
                  _locationSubscription.resume();
                }

                mapController.move(
                  LatLng(_currLocation.latitude, _currLocation.longitude),
                  8.0,
                );
              },
              heroTag: HomeConstants.currLocation,
              child: const Icon(Icons.location_on),
              tooltip: HomeConstants.currLocation,
            ),
            hasLabel: true,
            labelText: HomeConstants.currLocation,
          ),
          UnicornButton(
            currentButton: FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                final _latLng = MapUtils.fetchInitRespPoints(
                  _mapService.initResponse,
                );
                var _bounds = LatLngBounds();

                for (var _pos in _latLng) {
                  _bounds.extend(_pos);
                }
                mapController.fitBounds(
                  _bounds,
                  options: FitBoundsOptions(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  ),
                );
              },
              heroTag: HomeConstants.showOffices,
              child: const Icon(Icons.location_city),
              tooltip: HomeConstants.showOffices,
            ),
            hasLabel: true,
            labelText: HomeConstants.showOffices,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _locationSubscription?.cancel();
    super.dispose();
  }
}
