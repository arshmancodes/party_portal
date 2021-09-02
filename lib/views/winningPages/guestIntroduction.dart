import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class GuestIntro extends StatefulWidget {
  const GuestIntro({Key? key}) : super(key: key);

  @override
  _GuestIntroState createState() => _GuestIntroState();
}

class _GuestIntroState extends State<GuestIntro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Introduction: Host & Guests ",
                style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 50,
              ),
              Image.asset(
                'assets/images/hosts.png',
                width: 250,
                height: 250,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(arrivePage);
                },
                child: Card(
                  elevation: 20,
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: Center(
                      child: Text("Take a Picture"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
                child: Image.asset('assets/Icons/add.png'),
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(arrivePage);
                },
                child: Card(
                  elevation: 20,
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: Center(
                      child: Text("FaceTime Call"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
                child: Text(
                  "OR",
                  style: GoogleFonts.bebasNeue(fontSize: 24),
                ),
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(arrivePage);
                },
                child: Card(
                  elevation: 20,
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: 250,
                    height: 50,
                    child: Center(
                      child: Text("10 Sec Video"),
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
