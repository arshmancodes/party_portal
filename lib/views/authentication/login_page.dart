import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/colors.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/constants/custom_snackbar.dart';
import 'package:party_portal/router/route_generator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LoginPage> {
  bool pass21 = true;
  final _formKey = GlobalKey<FormState>();

  String? _userEmail, _userPassword;

  void _trySubmit() {
    print("Button pressed");
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      // CALL LOGIN METHOD
      authController.loginUser(emailController.text,passwordController.text).then((response){

        if(response.statusCode == 200){
          navigationController.getOffAll(mainRootPage);
          CustomSnackBar.showSnackBar(title: 'Login Successful', message: '', backgroundColor: snackBarSuccess);
          authController.getAllUsers();
        }else{
          String message = jsonDecode(response.body)['error'];
          CustomSnackBar.showSnackBar(title: message, message: '', backgroundColor: snackBarError);
        }

      });

    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        centerTitle: true,
        title: Image.asset(
          'assets/images/Create.png',
          width: 50,
          height: 50,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
          child: ListView(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Welcome',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 7, left: 5),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Please Login',
                      style: TextStyle(
                          color: Color(0xffCBCBCB),
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty || !value.contains("@")) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _userEmail = value;
                    },

                    style:  const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'Email',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Color(0xFF604621),
                        ),
                        labelStyle:
                        const TextStyle(color: Color(0xFF787878), fontSize: 15)),
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: pass21,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userPassword = value;
                  },
                  style:
                  const TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      labelText: 'Password',
                      prefixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (pass21 == true) {
                                pass21 = false;
                              } else {
                                pass21 = true;
                              }
                            });
                          },
                          child: Icon(
                            pass21 == true
                                ? Icons.lock_outline
                                : Icons.lock_open_rounded,
                            color:const  Color(0xFF604621),
                          )),
                      labelStyle:
                      const TextStyle(color: Color(0xFF787878), fontSize: 15)),
                ),
              ),
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
                              child:const Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                color: Color(0xffffffff)),
                          )),
                        ),
                        Padding(
                          padding:const  EdgeInsets.only(right: 10),
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

              const Padding(
                padding: EdgeInsets.only(top: 5, left: 5),
                child: Text('Forget Password?'),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      TextSpan(
                          text: "Sign Up",
                          style:  const TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Color(0xff4EB1FE),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigationController.navigateTo(signUp);
                            }),
                    ]),
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
