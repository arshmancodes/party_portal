import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/authentication/auth_service_controller.dart';
import 'package:party_portal/router/route_generator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

void _navigateToHome() async {
  await Future.delayed(const Duration(milliseconds: 4000), () {});
  Get.find<AuthServiceController>().currentUser.value?.uid != null ? navigationController.getOffAll(mainRootPage) : navigationController.getOffAll(login);
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  child: Image.asset(
                    'assets/images/party.gif',
                    height: 50,
                    width: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    'Party Portal',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
