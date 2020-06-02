import 'package:exp_with_leaflet/app_level/assets/assets.dart';

import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class CustomMarker extends Marker {
  CustomMarker({
    @required LatLng position,
    double width = 50.0,
    double height = 50.0,
  }) : super(
          builder: (_) => _InternalWidget(),
          point: position,
          height: height,
          width: width,
        );
}

class _InternalWidget extends StatelessWidget {
  const _InternalWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: <Widget>[
        Image.asset(AppAssets.marker.assetName),
        Positioned(
          left: 10.0,
          bottom: -30.0,
          child: FlutterLogo(),
        )
      ],
    );
  }
}
