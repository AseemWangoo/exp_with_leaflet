import 'package:exp_with_leaflet/app_level/assets/assets.dart';
import 'package:exp_with_leaflet/app_level/models/api_response.dart';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class CustomMarker extends Marker {
  CustomMarker({
    @required LatLng position,
    @required Properties data,
    double width = 50.0,
    double height = 50.0,
    Color color = Colors.white,
  })  : assert(position != null, data != null),
        super(
          builder: (_) => _InternalWidget(color: color, data: data),
          point: position,
          height: height,
          width: width,
        );
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key, this.color, this.data}) : super(key: key);

  final Color color;
  final Properties data;

  @override
  Widget build(BuildContext context) {
    //

    return GestureDetector(
      child: Image.asset(
        AppAssets.marker.assetName,
        color: color,
      ),
      onTap: () {
        debugPrint('I was tapped');
      },
    );
  }
}
