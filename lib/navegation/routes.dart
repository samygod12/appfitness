import 'package:appfitness/presentation/pages/home/my_home.dart';
import 'package:appfitness/presentation/pages/login/login.dart';
import 'package:appfitness/presentation/pages/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case login:
        return _buildRoute(Login.create);
      case home:
        return _buildRoute(MyHome.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}