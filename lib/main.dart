import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:party_portal/views/homePage.dart';
import 'package:party_portal/views/loginPage.dart';
import 'package:party_portal/views/profilePage.dart';
import 'package:party_portal/views/signupPage.dart';
import 'package:party_portal/views/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

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
    return GetMaterialApp(
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/profile', page: () => ProfilePage()),
        GetPage(name: '/homepage', page: () => HomePage()),
        GetPage(name: '/signup', page: () => SignupPage()),
      ],
    );
  }
}
