import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/party_controller.dart';
import 'package:party_portal/router/route_generator.dart';

class DrinkSelection extends StatefulWidget {
  const DrinkSelection({Key? key}) : super(key: key);

  @override
  _DrinkSelectionState createState() => _DrinkSelectionState();
}

class _DrinkSelectionState extends State<DrinkSelection> {
  final controller = Get.find<PartyController>();
  TextEditingController drinks = TextEditingController();
  TextEditingController games = TextEditingController();
  bool small = true;
  bool medium = false;
  bool large = false;
  String? size;

  @override
  void initState() {
    size = "small";
    super.initState();
  }

  var list = <String>[];
  var gamelist = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Text(
                  "Drinks?",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Image.asset(
                  'assets/images/drink.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: TextField(
                    controller: drinks,
                    decoration: InputDecoration(
                      label: Text("Enter a Drink name and Press Add"),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: () {
                    list.add(drinks.text);
                    drinks.clear();
                    controller.party.drinks = list;
                  },
                ),
                Text(
                  "Games?",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Image.asset(
                  'assets/images/drink.png',
                  width: 100,
                  height: 100,
                ),
                SizedBox(height: 20),
                Container(
                  width: 200,
                  child: TextField(
                    controller: games,
                    decoration: InputDecoration(
                      label: Text("Enter a Game name and Press Add"),
                    ),
                  ),
                ),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: () {
                    gamelist.add(games.text);
                    games.clear();
                    controller.party.games = gamelist;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Select",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Rate Your Party",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
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
                                  size = 'MA';
                                  controller.party.partyRating = size;
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
                                        color:
                                            Color(0xFFF7F5FF).withOpacity(0.38),
                                        // blurRadius: 0.5,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'MA',
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
                                  size = 'R';
                                  controller.party.partyRating = size;
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
                                        color:
                                            Color(0xFFF7F5FF).withOpacity(0.38),
                                        // blurRadius: 0.5,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'R',
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
                                  size = 'PG-13';
                                  controller.party.partyRating = size;
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
                                        color:
                                            Color(0xFFF7F5FF).withOpacity(0.38),
                                        // blurRadius: 0.5,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                    'PG-13',
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
                InkWell(
                  onTap: () {
                    navigationController.getOffAll(home);
                    Get.snackbar(
                      "Party Created",
                      "Your party has been created Successfully!",
                      backgroundColor: Colors.green,
                    );
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
