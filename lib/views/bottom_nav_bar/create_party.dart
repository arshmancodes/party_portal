import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';
import 'package:party_portal/views/partycreation/party_size.dart';

class CreateParty extends StatefulWidget {
  const CreateParty({Key? key}) : super(key: key);

  @override
  _CreatePartyState createState() => _CreatePartyState();
}

class _CreatePartyState extends State<CreateParty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Build your Party",
              style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Click on the Party Play button in the Bottom \nto host your Party ",
              style: GoogleFonts.poppins(
                  color: Colors.black38,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
            Image.asset('assets/images/groupparty.png'),
            SizedBox(
              height: 30,
            ),
            InkWell(
              child: Image.asset(
                'assets/images/play.png',
                width: 120,
                height: 120,
              ),
              onTap: () {
                print("Button Clicked");
                navigationController.navigateTo(partySize);
              },
            )
          ],
        ),
      ),
    ));
  }
}
