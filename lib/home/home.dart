import 'package:exp_with_leaflet/home/models/maps_model.dart';
import 'package:exp_with_leaflet/home/utilities/polylines.dart';
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
  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(title: Text('Exp with leaflet')),
      body: SafeArea(
        child: Consumer<MapsModel>(
          builder: (_, model, child) {
            //
            final _resp = model.initResponse;
            debugPrint('>>>> ${_resp.length}');

            if (_resp.isEmpty) {
              return child;
            }
            debugPrint('>>>> ${_resp.first.geometry.coordinates.first.first}');

            final _latLng = _resp.first.geometry.coordinates.first.first;

            final _polyPoints = MapUtils.polylines(
              _resp.first.geometry.coordinates.first,
            );

            return FlutterMap(
              layers: [
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                      points: _polyPoints,
                      strokeWidth: 4.0,
                      color: Colors.red,
                    ),
                  ],
                ),
                TileLayerOptions(
                  subdomains: ['a', 'b', 'c'],
                  urlTemplate:
                      'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                ),
              ],
              options: MapOptions(
                center: LatLng(48.427920, -123.358090),
                zoom: 13.0,
              ),
            );
          },
          child: FlutterMap(
            layers: [
              TileLayerOptions(
                subdomains: ['a', 'b', 'c'],
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
            ],
            options: MapOptions(
              center: LatLng(48.427920, -123.358090),
              zoom: 13.0, // 13.0
            ),
          ),
        ),
      ),
    );
  }
}
