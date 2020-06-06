import 'package:exp_with_leaflet/app_level/assets/assets.dart';
import 'package:exp_with_leaflet/app_level/models/api_response.dart';
import 'package:exp_with_leaflet/app_level/widgets/column_spacer.dart';
import 'package:exp_with_leaflet/home/widgets/custom_dialog.dart';

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
  _InternalWidget({Key key, this.color, Properties data})
      : _data = data,
        super(key: key);

  final Color color;
  final Properties _data;

  @override
  Widget build(BuildContext context) {
    //

    final _widget = ColumnSpacer(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text('Name : ${_data.name}'),
        Text('Desc : ${_data.description}'),
        Text('Slug : ${_data.slug}'),
        Text('French Name : ${_data.frenchName}'),
        Text('French Desc : ${_data.frenchDescription}'),
      ],
    );

    return GestureDetector(
      child: Image.asset(
        AppAssets.marker.assetName,
        color: color,
      ),
      onTap: () async => showDialog(
        context: context,
        builder: (_) => PlaceDialog(
          title: _data.name,
          desc: _widget,
        ),
      ),
    );
  }
}
