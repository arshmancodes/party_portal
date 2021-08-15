// STATIC ROUTES NAME

import 'package:flutter/material.dart';
import 'package:party_portal/views/home_page.dart';
import 'package:party_portal/views/authentication/login_page.dart';
import 'package:party_portal/views/authentication/signup_page.dart';
import 'package:party_portal/views/splash/splash_screen.dart';

const String initialRoute = '/';
const String login = '/login';
const String signUp = '/signup';
const String homePage = '/home-page';


// CONTROLLER FUNCTION THAT CONTROLS THE FLOW OF ROUTING
class RouteGenerator {

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

  static PageRoute _getPageRoute(Widget child){
    return MaterialPageRoute(builder: (ctx) => child);
  }

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