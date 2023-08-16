import 'package:flutter/material.dart';
import 'package:pet_adoption_app/core/constants/routes_list.dart';
import 'package:pet_adoption_app/data/models/pet_data_model.dart';
import 'package:pet_adoption_app/ui/screens/detail/pet_detail_screen.dart';
import 'package:pet_adoption_app/ui/screens/history/history_screen.dart';
import 'package:pet_adoption_app/ui/screens/home/homepage.dart';
import 'package:pet_adoption_app/ui/screens/introduction/introduction_screen.dart';
import 'package:pet_adoption_app/ui/screens/splashScreen/splash_screen.dart';

class Routes {
  static void setToScreen(String name) {
    _currentScreen = name;
  }

  static resetScreen() {
    _currentScreen = '';
  }

  static String getCurrentScreen() {
    String cName = _currentScreen;

    return cName;
  }

  static String _currentScreen = '';
  static Route generateRoute(RouteSettings settings) {
    final Widget screen;

    _currentScreen = settings.name ?? '';

    // print('opening screen $_currentScreen ');
    switch (settings.name) {
      case RouteList.splashScreen:
        screen = const SplashScreen();
        break;
      case RouteList.introductionScreen:
        screen = const IntroductionScreen();
        break;

      case RouteList.homepage:
        screen = const HomePage();
        break;

      case RouteList.detailpage:
        final arguments = settings.arguments as PetDetailModel;
        screen = PetDetailScreen(petDetail: arguments);
        break;

      case RouteList.historypage:
        screen = const HistoryScreen();
        break;

      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('No routes defined for ${settings.name} yet.'),
            ),
          ),
        );
    }

    return MaterialPageRoute(
      builder: (context) => screen,
    );
  }

  static Widget _parameterMissing() {
    return const Scaffold(
      body: Center(
        child: Text('Not a valid parameter passed'),
      ),
    );
  }
}
