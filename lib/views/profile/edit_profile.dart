import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/colors.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/constants/custom_snackbar.dart';
import 'package:party_portal/controllers/authentication/auth_controller.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final controller = Get.find<AuthController>();
  final _formKey = GlobalKey<FormState>();
  String? _userName,
      _userEmail,
      _userPassword,
      _userConfirmPassword,
      _userAge,
      _userPhone;

  bool pass = true;
  bool pass2 = true;

  @override
  void initState() {
    print(controller.currentUser.value.name);
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      // IF THE DATA IS VALIDATED, TAKE USER TO OTP SCREEN FOR CONFIRMATION
      // authController
      //     .registerUser(_userName!, _userEmail!, _userPassword!, _userPhone!,
      //         int.parse(_userAge!))
      //     .then((response) {
      //   if (response.statusCode == 200) {
      //     String message = jsonDecode(response.body)['message'];
      //     navigationController.goBack();
      //     CustomSnackBar.showSnackBar(
      //         title: message, message: '', backgroundColor: snackBarSuccess);
      //   } else if (response.statusCode == 500) {
      //     String message = jsonDecode(response.body)['message'];
      //     CustomSnackBar.showSnackBar(
      //         title: message, message: '', backgroundColor: snackBarError);
      //   } else {
      //     String message = jsonDecode(response.body)['error'];
      //     CustomSnackBar.showSnackBar(
      //         title: message, message: '', backgroundColor: snackBarError);
      //   }
      // }
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset(
          'assets/images/Create.png',
          width: 60,
          height: 60,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 50),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Edit Profile',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    initialValue: controller.currentUser.value.name,
                    //controller: nameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userName = value;
                    },
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'name',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF604621),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFF787878), fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    initialValue: authController.currentUser.value.email,
                    textInputAction: TextInputAction.next,
                    // controller: emailController,
                    keyboardType: TextInputType.text,
                    // validator: (value) {
                    //   if (value!.isEmpty || !value.contains("@")) {
                    //     return 'Please enter a valid email address';
                    //   }
                    //   return null;
                    // },
                    onSaved: (value) {
                      _userEmail = value;
                    },
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'email',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF604621),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFF787878), fontSize: 15)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    initialValue: "${authController.currentUser.value.age}",
                    textInputAction: TextInputAction.next,
                    // controller: ageController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userAge = value;
                    },
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'Age',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF604621),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFF787878), fontSize: 15)),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
                  initialValue:
                      "${authController.currentUser.value.phoneNumber}",
                  textInputAction: TextInputAction.done,
                  // controller: phoneController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userPhone = value;
                  },
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      labelText: 'Phone No',
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: Color(0xFF604621),
                      ),
                      labelStyle: const TextStyle(
                          color: Color(0xFF787878), fontSize: 15)),
                ),
              ),
              Container(
                  color: Colors.white,
                  child: DropdownButton<String>(
                    items: <String>['Male', 'Female'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: InkWell(
                  onTap: _trySubmit,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xff00B5F7),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Container(
                              child: const Center(
                                  child: Text(
                            'Update',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xffffffff)),
                          ))),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Container(
                              child: Image.asset(
                            'assets/images/GoSign.png',
                            height: 40,
                            width: 40,
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
