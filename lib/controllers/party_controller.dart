import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/authentication/auth_controller.dart';
import 'package:party_portal/models/partymodel.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';

class PartyController extends GetxController {
  var partylist = <PartyModel>[].obs;
  var markerslist = <Location>[].obs;
  List<Marker> allmarkers = <Marker>[].obs;
  final party = PartyModel();
  final usercreated = <PartyModel>[].obs;
  final usercreated2 = <PartyModel>[].obs;
  double? lat;
  double? long;

  void getParties() async {
    Uri url = Uri.parse('http://partyportal-16261.nodechef.com/api/party/all');

    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      Iterable list = jsonDecode(response.body)['results'];
      partylist.value = list.map((e) => PartyModel.fromJson(e)).toList();
      markerslist.value =
          list.map((e) => Location.fromJson(e['location'])).toList();
      getMarkers();
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<void> getPartybyId(String userid) async {
    Uri url = Uri.parse("http://partyportal-16261.nodechef.com/api/party/all");

    try {
      var response = await http.get(url);

      print(response.body);
      print(userid);
      Iterable list = jsonDecode(response.body)['results'];
      usercreated.value = list.map((e) => PartyModel.fromJson(e)).toList();
      for (int i = 0; i < usercreated.length; i++) {
        if (usercreated[i].createdBy == userid) {
          usercreated2.add(usercreated[i]);
        }
      }
      print(usercreated2.length);
      print("done");
    } on Exception catch (e) {
      // TODO
    }
  }

  void postParty() async {
    var json = party.toJson();
    Uri url =
        Uri.parse('http://partyportal-16261.nodechef.com/api/party/create');

    try {
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: jsonEncode(json));
      print(response.body);
    } on Exception catch (e) {
      print(e);
    }
    print(jsonEncode(json));
  }

  void getMarkers() {
    for (int i = 0; i < markerslist.length; i++) {
      Marker marker = Marker(
          markerId: MarkerId(markerslist[i].locationName!),
          draggable: false,
          position: LatLng(markerslist[i].latitude!, markerslist[i].longitude!),
          onTap: () {
            navigationController.navigateTo('/auctionView');
          });
      allmarkers.add(marker);
    }
    print(allmarkers.length);
  }
}
