import 'package:exp_with_leaflet/app_level/constants/constants.dart';
import 'package:exp_with_leaflet/home/home.dart';

import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //
    switch (settings.name) {
      //
      case ApplevelRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => Home(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => UndefinedView(name: settings.name),
          settings: settings,
        );
    }
  }
}

class UndefinedView extends StatelessWidget {
  const UndefinedView({Key key, this.name}) : super(key: key);

  /// Name of the route....
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Something went wrong for $name'),
      ),
    );
  }
}
