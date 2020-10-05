import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {String argument}) {
    return navigatorKey.currentState.pushNamed(routeName, arguments: argument);
  }

  void goBack() {
    return navigatorKey.currentState.pop();
  }
}

class MainContentNav extends NavigationService {}
