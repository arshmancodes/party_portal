import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';

class AuthServiceController extends GetxController {

  static AuthServiceController instance = Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser.obs;
  var loggedInUser = AuthModel().obs;

  @override
  void onInit() {
    // auth change stream
    currentUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }

  //  CREATE USER WITH EMAIL AND PASSWORD
  void createUser(String email, String password, String userName, int userAge, int userPhone) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);

      AuthModel _user = AuthModel(
        uid: _authResult.user!.uid,
        name: userName,
        email: email.trim(),
        age: userAge,
        phoneNumber: userPhone
      );
      loggedInUser.value = _user;
      navigationController.goBack();

    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error Creating Account", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }


  // Login with email and password
  void loginUser(String email, String password) async {
    try {
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password);

      AuthModel _user = AuthModel(
        uid: _authResult.user!.uid,
        name: '',
        email: email.trim(),
      );

      loggedInUser.value = _user;

      // TODO :: LOAD USER INFO FROM FIRE STORE COLLECTION
      // loggedInUser.value = await Database().getUser(_authResult.user!.uid);
      navigationController.getOffAll(mainRootPage);

    } catch (e) {
      Get.snackbar("Error Signing in", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // LOGOUT
  void logOut() async {
    try {
      await _auth.signOut();
      navigationController.getOffAll(login);
    } catch (e) {
      Get.snackbar("Error Signing Out", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

}