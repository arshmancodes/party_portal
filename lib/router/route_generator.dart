import 'package:flutter/material.dart';
import 'package:party_portal/views/home_page.dart';
import 'package:party_portal/views/authentication/login_page.dart';
import 'package:party_portal/views/authentication/signup_page.dart';
import 'package:party_portal/views/splash/splash_screen.dart';

// STATIC ROUTES NAME
const String initialRoute = '/';
const String login = '/login';
const String signUp = '/signup';
const String homePage = '/home-page';


// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes (RouteSettings settings){
    switch (settings.name){
      case initialRoute:
        return _getPageRoute(SplashScreen());
      case login:
        return _getPageRoute(LoginPage());
      case signUp:
        return _getPageRoute(SignupPage());
      case homePage:
        return _getPageRoute(const HomePage());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child){
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute(){
    return MaterialPageRoute(builder: (ctx){
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child:  Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}