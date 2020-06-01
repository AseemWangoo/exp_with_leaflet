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
    var points = <LatLng>[
      LatLng(51.5, -0.09),
      LatLng(53.3498, -6.2603),
      LatLng(48.8566, 2.3522),
    ];

    return Scaffold(
      appBar: AppBar(title: Text('Exp with leaflet')),
      body: SafeArea(
        child: Consumer<MapsModel>(
          builder: (_, model, child) {
            //
            final _resp = model.initResponse;
            debugPrint('>>>> ${_resp.length}');

            if (_resp.isEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            final _listOfPolyLines = MapUtils.listOfPolylines(_resp);

            final _markers = MapUtils.listOfMarkers(_resp);

            return FlutterMap(
              options: MapOptions(
                center: LatLng(51.5, -0.09),
                zoom: 5.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c']),
                PolylineLayerOptions(
                  polylines: [
                    Polyline(
                        points: points, strokeWidth: 4.0, color: Colors.purple),
                  ],
                ),
                PolylineLayerOptions(
                  polylines: _listOfPolyLines,
                ),
                MarkerLayerOptions(markers: _markers)
              ],
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
