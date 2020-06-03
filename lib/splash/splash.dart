import 'package:exp_with_leaflet/app_level/utilities/screen_size.dart';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //
    final _height = ScreenQueries.instance.customHeightPercent(context, 0.1);

    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.orangeAccent,
      child: Center(child: FlutterLogo(size: _height)),
    );
  }
}
