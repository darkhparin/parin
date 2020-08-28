import 'package:flutter/material.dart';

class NavigationService {
  GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop({dynamic result}) {
    return _navigationKey.currentState.pop(result);
  }

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> navigateReplacementTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState
        .pushReplacementNamed(routeName, arguments: arguments);
  }
}
