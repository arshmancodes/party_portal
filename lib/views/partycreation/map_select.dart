import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:party_portal/controllers/party_controller.dart';

class MapSelect extends StatefulWidget {
  const MapSelect({Key? key}) : super(key: key);

  @override
  _MapSelectState createState() => _MapSelectState();
}

class _MapSelectState extends State<MapSelect> {
  final controller = Get.find<PartyController>();

  double? lat;
  double? long;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              onLongPress: (pos) {
                print(pos);
                controller.lat = pos.latitude;
                controller.long = pos.longitude;
                Navigator.pop(context);
                Get.snackbar("Location Selected",
                    "You have selected the location for party");
              },
              initialCameraPosition: CameraPosition(
                  zoom: 10, target: LatLng(controller.lat!, controller.long!))),
        ],
      ),
    );
  }
}
