import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  String? _userName,
      _userEmail,
      _userPassword,
      _userConfirmPassword,
      _userAge,
      _userPhone;

  bool pass = true;
  bool pass2 = true;

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
      // Create user on auth request
      authServiceController.createUser(_userEmail!, _userPassword!, _userName!, int.parse(_userAge!), int.parse(_userPhone!));
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
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                child: Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: nameController,
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
                    textInputAction: TextInputAction.next,
                    controller: passwordController,
                    keyboardType: TextInputType.text,
                    obscureText: pass,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8) {
                        return "your password must have 8 characters";
                      }
                      return null;
                    },
                      onSaved: (value) {
                        _userPassword = value;
                      },
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'Password',
                        prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (pass == true) {
                                  pass = false;
                                } else {
                                  pass = true;
                                }
                              });
                            },
                            child: Icon(
                              pass == true
                                  ? Icons.lock_outline
                                  : Icons.lock_open_rounded,
                              color: const Color(0xFF604621),
                            )),
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
                    textInputAction: TextInputAction.next,
                    controller: confirmPasswordController,
                    keyboardType: TextInputType.text,
                    obscureText: pass2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Confirm password';
                      } else if (value != passwordController.text) {
                        return 'your confirm password is not match';
                      }
                      return null;
                    },
                      onSaved: (value) {
                        _userConfirmPassword = value;
                      },
                    style: const TextStyle(
                        color: Colors.black, fontFamily: 'SFUIDisplay'),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(21),
                        ),
                        labelText: 'Confirm Password',
                        prefixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (pass2 == true) {
                                  pass2 = false;
                                } else {
                                  pass2 = true;
                                }
                              });
                            },
                            child: Icon(
                              pass2 == true
                                  ? Icons.lock_outline
                                  : Icons.lock_open_rounded,
                              color: const Color(0xFF604621),
                            )),
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
                    textInputAction: TextInputAction.next,
                    controller: ageController,
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
                  textInputAction: TextInputAction.done,
                  controller: phoneController,
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
                            'Sign Up',
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      const TextSpan(
                          text: "Already a user? ",
                          style: TextStyle(
                            fontFamily: 'SFUIDisplay',
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      TextSpan(
                          text: "Sign in",
                          style: const TextStyle(
                              fontFamily: 'SFUIDisplay',
                              color: Color(0xff4EB1FE),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              navigationController.goBack();
                            }),
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
