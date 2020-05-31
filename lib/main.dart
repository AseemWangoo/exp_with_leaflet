import 'package:exp_with_leaflet/app_level/routes/routes.dart';
import 'package:exp_with_leaflet/app_level/theme/theme.dart';
import 'package:exp_with_leaflet/home/home.dart';
import 'package:exp_with_leaflet/home/models/maps_model.dart';
import 'package:exp_with_leaflet/locator.dart';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // INIT DEP INJECTION..
  setupLocator();

  // SETUP ORIENTATION
  if (!kIsWeb) {
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  // LOGGING
  Logger.root.onRecord.listen((record) {
    print(
      '👻👻👻 ${record.level.name} [${record.loggerName}] : 🎯🎯 ${record.message}',
    );
  });

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Router.generateRoute,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<MapsModel>(
            create: (_) => MapsModel(),
          ),
        ],
        child: Home(),
      ),
      theme: AppTheme.appTheme,
    );
  }
}
