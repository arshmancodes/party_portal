import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/party_controller.dart';
import 'package:party_portal/router/route_generator.dart';

class PartyInfo extends StatefulWidget {
  const PartyInfo({Key? key}) : super(key: key);

  @override
  _PartyInfoState createState() => _PartyInfoState();
}

class _PartyInfoState extends State<PartyInfo> {
  final controller = Get.find<PartyController>();
  TextEditingController where = TextEditingController();
  String? when;
  String? HLong;
  var one = Get.arguments;
  bool check1 = true;
  bool check2 = false;
  bool check3 = false;
  String? size1;
  var time = DateTime.now();
  String? formated;
  DateTime mytime = DateTime.now();
  _showDateDialog(BuildContext context) {
    // flutter defined function
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 250,
          child: CupertinoDatePicker(
            initialDateTime: time,
            mode: CupertinoDatePickerMode.date,
            maximumYear: 2026,
            onDateTimeChanged: (value) {
              setState(() {
                time = value;
                formated = DateFormat("yMd").format(time);
                when = formated.toString();
                controller.party.startingDate = when;
              });
            },
          ),
        );
      },
    );
  }

  String? timeformated;
  var thistime;
  _showTimeDialog(BuildContext context) {
    // flutter defined function
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      builder: (BuildContext context) {
        // return object of type Dialog
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          height: 250,
          child: CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.hms,
            onTimerDurationChanged: (value) {
              setState(() {
                thistime = value;
                timeformated = thistime.toString();
                HLong = timeformated.toString();
                controller.party.howLong = HLong;
              });
            },
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    size1 = "Pre-Game";
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    "Party Info",
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/groupparty.png'),
                      Text(
                        "when",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.040,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 21),
                        child: GestureDetector(
                          onTap: () {
                            _showDateDialog(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width - 32,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Container(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  formated == null
                                      ? "Input your Date"
                                      : formated.toString(),
                                  style: GoogleFonts.openSans(
                                      //fontFamily: "Open Sans",
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * 0.036,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Where?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.040,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 21),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width - 32,
                          child: Container(
                            alignment: AlignmentDirectional.centerStart,
                            child: TextField(
                              controller: where,
                              keyboardType: TextInputType.text,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'SFUIDisplay'),
                              decoration: InputDecoration(
                                enabled: false,
                                hintText: "Your Current location will be used",
                                hintStyle: GoogleFonts.openSans(
                                    //fontFamily: "Open Sans",
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: size.width * 0.036,
                                    color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "How Long?",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.040,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 21),
                        child: GestureDetector(
                          onTap: () {
                            HLong = _showTimeDialog(context);
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width - 32,
                            child: Padding(
                              padding: EdgeInsets.only(left: 15),
                              child: Container(
                                alignment: AlignmentDirectional.centerStart,
                                child: Text(
                                  timeformated == null
                                      ? "Input Time"
                                      : timeformated.toString(),
                                  style: GoogleFonts.openSans(
                                      //fontFamily: "Open Sans",
                                      fontWeight: FontWeight.w400,
                                      fontStyle: FontStyle.normal,
                                      fontSize: size.width * 0.036,
                                      color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, bottom: 10),
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        // where.text = "30.53996480119752 70.26455917547194";
                        // String location = where.text;
                        // print(location);
                        // var lat, lng;
                        // var mylocation = location.split(" ");
                        // print(mylocation[0]);
                        // lat = double.parse(mylocation[0]);
                        // lng = double.parse(mylocation[1]);
                        // print(lat);
                        // if (size1!.isNotEmpty == true &&
                        //     when!.isNotEmpty &&
                        //     lat != null &&
                        //     lng != null &&
                        //     HLong!.isNotEmpty) {
                        navigationController.navigateTo(drinkSelection);
                        // Get.to(GameSelected() , arguments: [one , size1, when.toString() , lat.toString(),lng.toString() , HLong.toString()]);
                        // } else {
                        //   final snackBar = SnackBar(
                        //     backgroundColor: Colors.red,
                        //     content: Row(
                        //       children: [
                        //         SizedBox(
                        //           width: 21,
                        //         ),
                        //         Icon(
                        //           Icons.warning_amber_outlined,
                        //           color: Colors.white,
                        //         ),
                        //         SizedBox(
                        //           width: 55,
                        //         ),
                        //         Text('Text Field are EmPty'),
                        //       ],
                        //     ),
                        //   );
                        //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        //}
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Image.asset("assets/images/play.png"),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
