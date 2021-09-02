import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class WinningStart extends StatefulWidget {
  const WinningStart({Key? key}) : super(key: key);

  @override
  _WinningStartState createState() => _WinningStartState();
}

class _WinningStartState extends State<WinningStart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Text(
                  "Congratulations ",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "You have won the bidding, Press the play button below to join the party",
                  style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 70,
                ),
                InkWell(
                  onTap: () {
                    navigationController.navigateTo(guestIntro);
                  },
                  child: Image.asset(
                    'assets/images/play.png',
                    width: 100,
                    height: 100,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
