import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class PartySize extends StatefulWidget {
  const PartySize({Key? key}) : super(key: key);

  @override
  _PartySizeState createState() => _PartySizeState();
}

class _PartySizeState extends State<PartySize> {
  bool small = true;
  bool medium = false;
  bool large = false;
  String? size;
  @override
  void initState() {
    size = "small";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Party Size",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Please select the party size among the given options ",
                    style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Container(
                    width: 350,
                    height: 150,
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20, top: 0),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0xFFF7F5FF).withOpacity(0.38),
                                // blurRadius: 0.5,
                                spreadRadius: 1,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      small = true;
                                      medium = false;
                                      large = false;
                                    });
                                    size = 'small';
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: small == true
                                          ? Colors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFF7F5FF)
                                              .withOpacity(0.38),
                                          // blurRadius: 0.5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Small',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: small == true
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // ignore: unnecessary_statements
                                      small = false;
                                      medium = true;
                                      large = false;
                                    });
                                    size = 'medium';
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: medium == true
                                          ? Colors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFF7F5FF)
                                              .withOpacity(0.38),
                                          // blurRadius: 0.5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Medium',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: medium == true
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // ignore: unnecessary_statements
                                      small = false;
                                      medium = false;
                                      large = true;
                                    });
                                    size = 'large';
                                  },
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: large == true
                                          ? Colors.blue
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(40),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xFFF7F5FF)
                                              .withOpacity(0.38),
                                          // blurRadius: 0.5,
                                          spreadRadius: 1,
                                        ),
                                      ],
                                    ),
                                    child: Center(
                                        child: Text(
                                      'Large',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: large == true
                                              ? Colors.white
                                              : Colors.black),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: 150,
                        height: 300,
                        child: Column(
                          children: [
                            Text(
                              "No. of Hosts",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Image.asset(
                              'assets/images/females.png',
                              width: 150,
                              height: 200,
                            ),
                            TextField(),
                          ],
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 300,
                        child: Column(
                          children: [
                            Text(
                              "No. of Guests",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Image.asset(
                              'assets/images/males.png',
                              width: 150,
                              height: 200,
                            ),
                            TextField(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      navigationController.navigateTo(introPage);
                    },
                    child: Image.asset('assets/images/createbtn.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
