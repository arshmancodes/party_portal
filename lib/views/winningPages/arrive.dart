import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class ArrivePage extends StatefulWidget {
  const ArrivePage({Key? key}) : super(key: key);

  @override
  _ArrivePageState createState() => _ArrivePageState();
}

class _ArrivePageState extends State<ArrivePage> {
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
                'assets/images/EventWorld.png',
                width: 250,
                height: 250,
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(home);
                  Get.snackbar(
                      "Ride Booked", "Your Ride has been booked by Uber",
                      backgroundColor: Colors.green[300]);
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
                      child: Text("Uber"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(home);
                  Get.snackbar(
                      "Ride Booked", "Your Ride has been booked by Lyft",
                      backgroundColor: Colors.green[300]);
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
                      child: Text("Lyft"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(home);
                  Get.snackbar(
                      "Ride Booked", "Your Ride has been booked by Fly Wheel",
                      backgroundColor: Colors.green[300]);
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
                      child: Text("Fly Wheel"),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  navigationController.navigateTo(home);
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
                      child: Text("Other"),
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
