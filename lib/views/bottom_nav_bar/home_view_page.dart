import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/constants/sharedpref.dart';
import 'package:party_portal/controllers/party_controller.dart';
import 'package:party_portal/router/route_generator.dart';

class HomeViewPage extends StatefulWidget {
  const HomeViewPage({Key? key}) : super(key: key);

  @override
  _HomeViewPageState createState() => _HomeViewPageState();
}

class _HomeViewPageState extends State<HomeViewPage> {
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;
  double _upperValue = 10;
  bool check1 = true;
  bool check2 = false;
  Localdbservices localdbservices = Localdbservices();
  final controller = Get.find<PartyController>();
  ImageConfiguration? img;
  GoogleMapController? mapController;
  Map<MarkerId, Marker> marker = <MarkerId, Marker>{};
  List allmyparties = [];
  LocationData? currentlocation;
  var location = new Location();
  late double lat;
  late double long;
  // fetchparties() async {
  //   var id = await localdbservices.getuserpassword();
  //   var response =
  //       await get(Uri.parse("http://18.210.113.69:1809/api/getParties/$id"));
  //   if (response.statusCode == 200) {
  //     var mydata = jsonDecode(response.body);
  //     // MyParties myParties = MyParties.fromJson(mydata);
  //     // for (var temp in myParties.allParties) {
  //     //   AllParties allParties =
  //     //       AllParties(latitute: temp.latitute, logitute: temp.logitute);
  //     //   print(temp.logitute);

  //     // marker[MarkerId("party${temp.partyID}")] = Marker(
  //     //     markerId: MarkerId("party${temp.partyID}"),
  //     //     position: LatLng(
  //     //         double.parse(temp.latitute), double.parse(temp.logitute)),
  //     //     icon: BitmapDescriptor
  //     //         .defaultMarker /*BitmapDescriptor.fromAssetImage(ImageConfiguration(size: Size(40,40)),"assets/Icons/mapicon.png)"*/);
  //     // allmyparties.add(allParties);
  //   }
  //   return allmyparties;
  // }

  BitmapDescriptor? pinLocationIcon;
  final Completer<GoogleMapController> _controller = Completer();
  bool loaded = false;
  // Future future;
  @override
  void initState() {
    super.initState();
    getLocation();
    controller.getParties();
    setState(() {});
    print("Location print ${currentlocation}");
    // future = fetchparties();
  }

  void getLocation() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    currentlocation = await location.getLocation();
    lat = currentlocation!.latitude!;
    long = currentlocation!.longitude!;
    print(lat);
    print(long);
    controller.lat = lat;
    controller.long = long;
    loaded = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {});
          }),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 60,
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
          (loaded)
              ? GoogleMap(
                  markers: Set.from(controller.allmarkers),
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(lat, long),
                    zoom: 15,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                )
              : Center(child: CircularProgressIndicator()),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Stack(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(right: 120),
                //   child: Container(
                //     alignment: Alignment.topCenter,
                //     child: GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           check1 = true;
                //           check2 = false;
                //         });
                //       },
                //       child: Container(
                //         height: 40,
                //         width: 125,
                //         decoration: BoxDecoration(
                //           borderRadius: const BorderRadius.only(
                //             bottomLeft: Radius.circular(30),
                //             topLeft: Radius.circular(30),
                //           ),
                //           color:
                //               check1 == true ? Color(0xff34C3F8) : Colors.white,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/Icons/female.png",
                //               color:
                //                   check1 == true ? Colors.white : Colors.black,
                //             ),
                //             const SizedBox(
                //               width: 8,
                //             ),
                //             Text(
                //               "Female",
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: size.width * 0.040,
                //                 color: check1 == true
                //                     ? Colors.white
                //                     : Colors.black,
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 100),
                //   child: Container(
                //     alignment: Alignment.topCenter,
                //     child: GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           check1 = false;
                //           check2 = true;
                //         });
                //       },
                //       child: Container(
                //         height: 40,
                //         width: 120,
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(50),
                //           color:
                //               check2 == true ? Color(0xff34C3F8) : Colors.white,
                //         ),
                //         child: Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             Image.asset(
                //               "assets/Icons/male.png",
                //               color:
                //                   check2 == true ? Colors.white : Colors.black,
                //             ),
                //             SizedBox(
                //               width: 8,
                //             ),
                //             Text(
                //               "Male",
                //               style: GoogleFonts.poppins(
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: size.width * 0.040,
                //                 color: check2 == true
                //                     ? Colors.white
                //                     : Colors.black,
                //               ),
                //             )
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 120, left: 10),
          //   child: Text(
          //     "1.00Mile",
          //     style: GoogleFonts.poppins(
          //       fontWeight: FontWeight.w600,
          //       fontSize: size.width * 0.035,
          //       color: Colors.black,
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(top: 150, left: 10),
          //   child: Container(
          //       alignment: Alignment.centerLeft,
          //       height: 300,
          //       width: 50,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(100),
          //         color: Colors.white,
          //       ),
          //       child: RotatedBox(
          //           quarterTurns: 3,
          //           child: Slider(
          //             value: _upperValue,
          //             onChanged: (value) {
          //               setState(() {

          //                 _upperValue = value;
          //               });
          //             },
          //             max: 18.0,
          //             min: 10,
          //           ))),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(left: 10, bottom: 80),
          //   child: Container(
          //     alignment: Alignment.bottomLeft,
          //     child: Text(
          //       "0.0Miles",
          //       style: GoogleFonts.poppins(
          //         fontWeight: FontWeight.w600,
          //         fontSize: size.width * 0.035,
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
