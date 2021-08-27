import 'package:flutter/material.dart';
import 'package:party_portal/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:party_portal/views/authentication/login_page.dart';
import 'package:party_portal/views/authentication/signup_page.dart';
import 'package:party_portal/views/partycreation/drinks_selection.dart';
import 'package:party_portal/views/partycreation/introduction.dart';
import 'package:party_portal/views/partycreation/partyInfo.dart';
import 'package:party_portal/views/partycreation/party_detail.dart';
import 'package:party_portal/views/partycreation/party_size.dart';
import 'package:party_portal/views/splash/splash_screen.dart';

// STATIC ROUTES NAME
const String initialRoute = '/';
const String login = '/login';
const String home = '/home';
const String signUp = '/signup';
const String mainRootPage = '/main-root-page';
const String partySize = '/party-size';
const String introPage = '/introduction';
const String partyInfo = '/party-info';
const String drinkSelection = '/drinkSelection';
const String eventDetail = '/eventDetail';

// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(SplashScreen());
      case login:
        return _getPageRoute(LoginPage());
      case signUp:
        return _getPageRoute(SignupPage());
      case mainRootPage:
        return _getPageRoute(const BottomNavBar());
      case partySize:
        return _getPageRoute(const PartySize());
      case introPage:
        return _getPageRoute(const IntroductionPage());
      case partyInfo:
        return _getPageRoute(const PartyInfo());
      case drinkSelection:
        return _getPageRoute(DrinkSelection());
      case home:
        return _getPageRoute(BottomNavBar());
      case eventDetail:
        return _getPageRoute(EventDetail());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
