import 'package:flutter/material.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/views/authentication/login_page.dart';
import 'package:party_portal/views/bottom_nav_bar/bottom_nav_bar.dart';

class AuthDecider extends StatelessWidget {
  const AuthDecider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: authController.getUserId(),
        builder: (ctx, AsyncSnapshot auth){
          if(auth.hasData && auth.data != null){
            authController.getUserById(auth.data);
            return const BottomNavBar();
          }else{
            return LoginPage();
          }
        });
  }
}
