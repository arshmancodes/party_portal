import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/authentication/auth_controller.dart';
import 'package:party_portal/controllers/party_controller.dart';
import 'package:party_portal/models/partymodel.dart';
import 'package:party_portal/router/route_generator.dart';

class DrinkSelection extends StatefulWidget {
  const DrinkSelection({Key? key}) : super(key: key);

  @override
  _DrinkSelectionState createState() => _DrinkSelectionState();
}

class _DrinkSelectionState extends State<DrinkSelection> {
  final controller = Get.find<PartyController>();
  final authcontroller = Get.find<AuthController>();
  TextEditingController drinks = TextEditingController();
  TextEditingController games = TextEditingController();
  bool small = true;
  bool medium = false;
  bool large = false;
  String? size;
  List<String> list2 = ['Absinthe',
    'Advocaat',
    'Amaretto',
    'Applejack',
    'Asti',
    'Baileys',
    'Baileys Irish Cream',
    'Beer',
    'Blue Curacao',
    'Bourbon',
    'Brandy',
    'Canadian Whiskey',
    'Chambord',
    'Champagne',
    'Cider',
    'Cognac',
    'Cointreau',
    'Drambuie',
    'Frangelico',
    'Gin',
    'Glenfiddich',
    'Grand Marnier',
    'Irish Whiskey',
    'Jack Daniels',
    'JagerMeister',
    'Jim Beam',
    'Kahlua',
    'Liqeur',
    'Liquor',
    'Midori',
    'Prosecco',
    'Punch',
    'Red Wine',
    'Rose Wine',
    'Rum',
    'Sambuca',
    'Sangria',
    'Scotch',
    'Sherry',
    'Sloe Gin',
    'Southern Comfort',
    'Tequilla',
    'Triple Sec',
    'Vermouth',
    'Vodka',
    'Whiskey',
    'White Wine',
    'Wine'
  ];
  List<String> list3 = [
    'Apples to Apples',
    'Around the World',
    'Asshole',
    'Avalanche',
    'Bar-Hopping',
    'Bartok(Card Game)',
    'Baseball',
    'Beer Bong',
    'Beer can Pyramid',
    'Beer Checkers',
    'Beer Die',
    'Beer Helmet',
    'Beer Mile',
    'Beer Pong',
    'Beer Pong(Paddles)',
    'Beer Pong Blitz(5 Cups)',
    'Beer Pong Blitz (3 Cups)',
    'Beerdarts',
    'Biscuit',
    'Black or Red',
    'Boat Race',
    'Boot of Beer',
    'Buffalo',
    'Dropshot Blitz',
    'Dropshot Bonanza',
    'Cards Against Humanity',
    'Detonator',
    'Dizzy Bat',
    'Edward Fortyhands',
    'Fingers',
    'Flip Cup',
    'Fuzzy Duck',
    'Goon of Fortune',
    'Hi, Bob',
    'High Jinks',
    'Horserace',
    'Ice Luge',
    'Icing',
    'Jenga',
    'Karoake',
    'Kastenlauf',
    'Keg Stand',
    'Kings',
    'Kinito',
    'Kottabos',
    'Kings uses Playing Cards',
    'Liar\'s Dice',
    'Matchbox',
    'Neknominate',
    'Never have i ever',
    'Pass Out',
    'Patruni e Sutta',
    'Pop Champayne',
    'Poker',
    'Power Hour',
    'President',
    'Pub Golf',
    'Pyramid',
    'Pyramid of Fire',
    'Quarters',
    'Quodlibet',
    'Ride the bus',
    'Ring of Fire',
    'Schlafmutze',
    'Scum',
    'Sevens, Elevens and doubles',
    'Ship, captain and crew',
    'Shotgunning',
    'Sinking',
    'Slam Pong',
    'Snap-Dragon',
    'Spades',
    'Spoof',
    'Three Man',
    'Toepen',
    'Truth or Dare',
    'Twister',
    'Up Jenkins',
    'Wizard Staff',
    'Yard of ale'



  ];
  String? gameslist = 'Apples to Apples';
  String? drinkslist = 'Absinthe';

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
                    child: DropdownButton<String>(
                      value: drinkslist,
                      items: list2.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value2) {
                        setState(() {
                          drinkslist = value2;
                        });
                      },
                    )),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: () {
                    setState(() {
                      drinkslist = list2[0];
                    });
                    list.add(drinkslist!);

                    Location location = Location();
                    location.latitude = controller.lat;
                    location.longitude = controller.long;
                    location.locationName = "Testing";
                    controller.party.location = location;
                    controller.party.createdBy = "1";

                    controller.party.drinks = list;
                    Get.snackbar("Drink Added",
                        "Your drink has been added Select more drinks and Add them!");
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
                    child: DropdownButton<String>(
                      value: gameslist,
                      items: list3.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value2) {
                        setState(() {
                          gameslist = value2;
                        });
                      },
                    )),
                ElevatedButton(
                  child: Text("Add"),
                  onPressed: () {
                    setState(() {
                      gameslist = list3[0];
                    });
                    gamelist.add(gameslist!);
                    controller.party.games = gamelist;
                    Get.snackbar("Game Added",
                        "Your game has been added please select another games and add them.");
                  },
                ),
                SizedBox(
                  height: 20,
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
                    controller.party.createdBy =
                        authcontroller.currentUser.value.mongodbId;
                    controller.party.partyInfo = "Awesome Party";

                    controller.postParty();

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
