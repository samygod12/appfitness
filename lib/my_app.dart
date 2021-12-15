import 'package:appfitness/navegation/routes.dart';
import 'package:appfitness/presentation/bloc/login%20cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  static Widget create() {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSignedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.login, (route) => false);
        } else if (state is LoginSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (route) => false);
        }
      },
      child: MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      title: 'Authentication Flow',
      onGenerateRoute: Routes.routes,
    );
  }
}