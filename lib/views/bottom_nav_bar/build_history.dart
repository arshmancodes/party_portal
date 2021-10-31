import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class BuildHistory extends StatefulWidget {
  const BuildHistory({Key? key}) : super(key: key);

  @override
  _BuildHistoryState createState() => _BuildHistoryState();
}

class _BuildHistoryState extends State<BuildHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Party Creation History",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Below is the List of all the Parties you Created",
                    style: GoogleFonts.poppins(
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     navigationController.navigateTo(eventDetail);
                  //   },
                  //   child: Card(
                  //     elevation: 20,
                  //     color: Colors.blue[400],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: SizedBox(
                  //       width: 400,
                  //       height: 100,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(20.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Party Name',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'Martina\'s Party',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Location',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'America',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Date Created',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '08/25/2021',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     navigationController.navigateTo(eventDetail);
                  //   },
                  //   child: Card(
                  //     elevation: 20,
                  //     color: Colors.indigo[300],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: SizedBox(
                  //       width: 400,
                  //       height: 100,
                  //       child: Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Party Name',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'Jessica\'s Party',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Location',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'America',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Date Created',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     '08/25/2021',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     navigationController.navigateTo(eventDetail);
                  //   },
                  //   child: Card(
                  //     elevation: 20,
                  //     color: Colors.blue[400],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: SizedBox(
                  //       width: 400,
                  //       height: 100,
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(20.0),
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //           children: [
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Party Name',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'Martina\'s Party',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Location',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   'America',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //             Column(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceAround,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                   'Date Created',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 16,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //                 Text(
                  //                   '08/25/2021',
                  //                   style: GoogleFonts.poppins(
                  //                     fontSize: 15,
                  //                     fontWeight: FontWeight.bold,
                  //                     color: Colors.white,
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // InkWell(
                  //   onTap: () {
                  //     navigationController.navigateTo(eventDetail);
                  //   },
                  //   child: Card(
                  //     elevation: 20,
                  //     color: Colors.indigo[300],
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(30),
                  //     ),
                  //     child: SizedBox(
                  //       width: 400,
                  //       height: 100,
                  //       child: Padding(
                  //           padding: const EdgeInsets.all(20.0),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //             children: [
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Party Name',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'Jessica\'s Party',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Location',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     'America',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //               Column(
                  //                 mainAxisAlignment:
                  //                     MainAxisAlignment.spaceAround,
                  //                 crossAxisAlignment: CrossAxisAlignment.start,
                  //                 children: [
                  //                   Text(
                  //                     'Date Created',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 16,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                   Text(
                  //                     '08/25/2021',
                  //                     style: GoogleFonts.poppins(
                  //                       fontSize: 15,
                  //                       fontWeight: FontWeight.bold,
                  //                       color: Colors.white,
                  //                     ),
                  //                   ),
                  //                 ],
                  //               ),
                  //             ],
                  //           )),
                  //     ),
                  //   ),
                  // ),
                  Text("There is no current party history to display",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
