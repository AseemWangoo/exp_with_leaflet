import 'package:exp_with_leaflet/home/models/maps_model.dart';
import 'package:exp_with_leaflet/home/utilities/constants.dart';
import 'package:exp_with_leaflet/home/utilities/polylines.dart';
import 'package:exp_with_leaflet/splash/splash.dart';
import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  MapController mapController;

  MapsModel get _mapService => Provider.of<MapsModel>(context, listen: false);

  @override
  void initState() {
    super.initState();
    mapController = MapController();
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
                center: LatLng(48.427920, -123.358090),
                zoom: 8.0,
              ),
              mapController: mapController,
            );
          },
          child: const SplashScreen(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        icon: const Icon(Icons.location_on),
        label: const Text(HomeConstants.showPoints),
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
      ),
    );
  }
}
