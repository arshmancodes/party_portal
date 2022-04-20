import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/base_url.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {

  static AuthController instance = Get.find();

  var currentUser = AuthModel().obs;


  void getUserById(String id) async {
    var url = Uri.parse('$base_url/auth/all/$id');
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        print(currentUser);
        
        currentUser.value = AuthModel.fromJson(jsonDecode(response.body));
        
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<http.Response> registerUser(String username, String email, String password, String phoneNumber, int age) async {
    var url = Uri.parse('$base_url/auth/register');
    try {
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'username' : username,
            'email' : email,
            'password' : password,
            'phoneNumber' : phoneNumber,
            'age' : age
          }));

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }


  Future<http.Response> loginUser(String email, String password) async {
    String token = await firebaseToken();
    var url = Uri.parse('$base_url/auth/login');
    try {
      http.Response response = await http.post(url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({
            'email' : email,
            'password' : password,
            'fcmToken' : token
          }));

      if(response.statusCode == 200){
        currentUser.value = AuthModel.fromJson(jsonDecode(response.body));
        saveUserState(currentUser.value.mongodbId!);
      }

      return response;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }



  Future<String> firebaseToken() async {
    FirebaseMessaging fcm = FirebaseMessaging.instance;
    String? token = await fcm.getToken();
    if(token != ''){
      return token ?? "Failed";
    }else{
      return "Failed";
    }
  }

  void saveUserState(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userId', id);
  }

  Future getUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('userId');
  }

  void logOutUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    // Get.offAll(() => LoginPage());
  }


}