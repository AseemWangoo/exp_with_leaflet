import 'package:exp_with_leaflet/app_level/routes/routes.dart';
import 'package:exp_with_leaflet/app_level/theme/theme.dart';
import 'package:exp_with_leaflet/locator.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:logging/logging.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT DEP INJECTION..
  setupLocator();

  // SETUP ORIENTATION
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // LOGGING
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    print('👻👻👻 ${record.level.name}: 🎯🎯 ${record.message}');
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      theme: AppTheme.appTheme,
    );
  }
}
