import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class LoginPage extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LoginPage> {
  bool pass21 = true;
  final _formKey = GlobalKey<FormState>();

//  final SignInCntrl = LoginApiService();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
        toolbarHeight: 60,
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios_sharp, color: Colors.black,),
        //   onPressed: (){
        //     Navigator.of(context).pushReplacementNamed('/Welcome');
        //   },
        // ),
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
              // Stack(
              //   children: [
              //     Container(
              //       alignment: Alignment.center,
              //       height: 300,
              //       child: Image.asset('assets/img/Welcome.png'),
              //     ),
              //   ],
              // ),
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
                    controller: nameController,
                    keyboardType: TextInputType.text,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onSaved: (value) {},
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
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: pass21,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                  onSaved: (value) {},
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
                  onTap: () {
                    navigationController.navigateTo(homePage);
                    //  if (_formKey.currentState.validate()) {
                    //   var resonce = await SignInCntrl.SignINFun(namecntroller.text, passwordcontroller.text);
                    //   final snackBar1 = SnackBar(
                    //     backgroundColor: Colors.blue,
                    //
                    //     content: Row(
                    //
                    //       children: [
                    //         CircularProgressIndicator(),
                    //         SizedBox(width: 11,),
                    //         Text('Waiting'),
                    //
                    //       ],
                    //     ),
                    // duration: Duration(seconds: 1),
                    //   );
                    //   print(resonce);
                    //   ScaffoldMessenger.of(context).showSnackBar(snackBar1);
                    //   if(resonce == "Invalid User"){
                    //     final snackBar = SnackBar(
                    //       backgroundColor: Colors.red,
                    //       content: Row(
                    //         children: [
                    //           Icon(Icons.warning_amber_outlined,color: Colors.white,),
                    //           SizedBox(width: 11,),
                    //           Text('User Invalid'),
                    //
                    //         ],
                    //       ),
                    //       duration: Duration(seconds: 2),
                    //     );
                    //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    //   }
                    //   else{
                    //
                    //     Get.to(SelectLogin());
                    //   }
                    //  }
                  },
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
                padding: const EdgeInsets.only(top: 220),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Don't have an account?",
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
