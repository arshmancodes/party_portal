import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Introduction",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Please attach some of your photos or Party\nphotos to make the guests more comfortable.",
                  style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                Card(
                  elevation: 20,
                  color: Colors.blue[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 58,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Upload',
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/images/createbtn.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
