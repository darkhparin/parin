import 'package:cwl/services/dialog_service.dart';
import 'package:cwl/ui/views/startup_view.dart';
import 'package:flutter/material.dart';
import 'package:cwl/services/navigation_service.dart';
import 'managers/dialog_manager.dart';
import 'ui/router.dart';
import 'locator.dart';

void main() {
  // Register all the models and services before the app starts
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Compound',
      builder: (context, child) => Navigator(
        key: locator<DialogService>().dialogNavigationKey,
        onGenerateRoute: (settings) => MaterialPageRoute(
            builder: (context) => DialogManager(child: child)),
      ),
      navigatorKey: locator<NavigationService>().navigationKey,
      theme: ThemeData(
        primaryColor: Color(0xFF1E88E5),
      ),
      home: StartUpView(),
      onGenerateRoute: generateRoute,
    );
  }
}
