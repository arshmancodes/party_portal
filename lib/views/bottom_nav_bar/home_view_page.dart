import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/constants/sharedpref.dart';
import 'package:party_portal/router/route_generator.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  double _upperValue = 10;
  bool check1 = true;
  bool check2 = false;
  Localdbservices localdbservices = Localdbservices();
  ImageConfiguration? img;
  GoogleMapController? mapController;
  Map<MarkerId, Marker> marker = <MarkerId, Marker>{};
  List allmyparties = [];
  fetchparties() async {
    var id = await localdbservices.getuserpassword();
    var response =
        await get(Uri.parse("http://18.210.113.69:1809/api/getParties/$id"));
    if (response.statusCode == 200) {
      var mydata = jsonDecode(response.body);
      // MyParties myParties = MyParties.fromJson(mydata);
      // for (var temp in myParties.allParties) {
      //   AllParties allParties =
      //       AllParties(latitute: temp.latitute, logitute: temp.logitute);
      //   print(temp.logitute);

      // marker[MarkerId("party${temp.partyID}")] = Marker(
      //     markerId: MarkerId("party${temp.partyID}"),
      //     position: LatLng(
      //         double.parse(temp.latitute), double.parse(temp.logitute)),
      //     icon: BitmapDescriptor
      //         .defaultMarker /*BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)),"assets/Icons/mapicon.png)"*/);
      // allmyparties.add(allParties);
    }
    return allmyparties;
  }

  // Future future;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // future = fetchparties();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Text(
            "Welcome",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w700,
              fontSize: size.width * 0.06,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          FutureBuilder(
              //future: future,
              builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GoogleMap(
                minMaxZoomPreference:
                    MinMaxZoomPreference(_upperValue, _upperValue),
                initialCameraPosition: CameraPosition(
                    target: LatLng(30.53996480119752, 70.26455917547194),
                    zoom: _upperValue),
                mapType: MapType.terrain,
                /* scrollGesturesEnabled: true,
                  rotateGesturesEnabled: true,
                  zoomGesturesEnabled: true,*/
                zoomControlsEnabled: false,
                zoomGesturesEnabled: true,
                markers: Set.from(marker.values),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          check1 = true;
                          check2 = false;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 125,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color:
                              check1 == true ? Color(0xff34C3F8) : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Icons/female.png",
                              color:
                                  check1 == true ? Colors.white : Colors.black,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Female",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.040,
                                color: check1 == true
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          check1 = false;
                          check2 = true;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color:
                              check2 == true ? Color(0xff34C3F8) : Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/Icons/male.png",
                              color:
                                  check2 == true ? Colors.white : Colors.black,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "Male",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.040,
                                color: check2 == true
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 150,
            ),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  onTap: () {
                    navigationController.navigateTo(winningStart);
                  },
                  child: Image.asset("assets/Icons/yellow.png",
                      height: size.width * 0.35, width: size.width * 0.29)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 250),
            child: Container(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    navigationController.navigateTo(joinParty);
                  },
                  child: Image.asset("assets/Icons/purplegreen.png",
                      height: size.width * 0.25, width: size.width * 0.19)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 220),
            child: Container(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: () {
                    navigationController.navigateTo(joinParty);
                  },
                  child: Image.asset("assets/Icons/red.png",
                      height: size.width * 0.25, width: size.width * 0.19)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100),
            child: Container(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () {
                    navigationController.navigateTo(joinParty);
                  },
                  child: Image.asset("assets/Icons/greenshadow.png",
                      height: size.width * 0.55, width: size.width * 0.55)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120, left: 10),
            child: Text(
              "1.00Mile",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.035,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 150, left: 10),
            child: Container(
                alignment: Alignment.centerLeft,
                height: 300,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      value: _upperValue,
                      onChanged: (value) {
                        setState(() {
                          _upperValue = value;
                        });
                      },
                      max: 18.0,
                      min: 10,
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 80),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                "0.0Miles",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: size.width * 0.035,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
