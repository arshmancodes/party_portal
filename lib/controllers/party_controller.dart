import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/authentication/auth_controller.dart';
import 'package:party_portal/models/partymodel.dart';
import 'package:party_portal/notificationservice/local_notification_service.dart';
import 'package:party_portal/views/authentication/model/auth_model.dart';

class PartyController extends GetxController {
  var auth = Get.find<AuthController>();
  var partylist = <PartyModel>[].obs;
  var markerslist = <Location>[].obs;
  var notificationslist = <RemoteMessage>[].obs;
  List<Marker> allmarkers = <Marker>[].obs;
  var partyDetail = PartyModel();
  final party = PartyModel();
  final usercreated = <PartyModel>[].obs;
  final usercreated2 = <PartyModel>[].obs;
  double? lat;
  double? long;
  BitmapDescriptor? icon;

  void sendPartyNotification() async {

    var notiurl = Uri.parse("https://fcm.googleapis.com/fcm/send");

    try {
      var response_noti = await http.post(notiurl, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'key=AAAAmoWXIaQ:APA91bEwk2aTPGusqDiMmXOr3Ka20s3g5FPlKt-LMnvwPW356m73ItwuAXlVH0i0WsIGfnAIHhMjQMYp4IYXCzMZoq1Ig8dKvmiLO3ckTDf1lXfjHdkreDOVked8zDN95dbyX2etyalI'
      }, body: jsonEncode({
        'registration_ids': auth.tokens,
        'notification': {
          'title': 'Party Created',
          'body': 'A new party has been Created',
          'android_channel_id': 'partyportals',
        }
      }));
    } on Exception catch (e) {
      print(e.toString());
    }
  }

  void getParties() async {
    Uri url = Uri.parse('http://partyportal-16261.nodechef.com/api/party/all');

    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      Iterable list = jsonDecode(response.body)['results'];
      partylist.value = list.map((e) => PartyModel.fromJson(e)).toList();
      markerslist.value =
          list.map((e) => Location.fromJson(e['location'])).toList();
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(16, 16)),
          'assets/images/blue_logo.png');
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
          icon: icon!,
          markerId: MarkerId(markerslist[i].locationName!),
          draggable: false,
          position: LatLng(markerslist[i].latitude!, markerslist[i].longitude!),
          onTap: () {
            if(auth.currentUser.value.email == 'arshman11@hotmail.com')
            {
              navigationController.navigateTo('/adminParty');
            }
            else
            {
              navigationController.navigateTo('/partyPricing');
            }
            
            partyDetail = partylist[i];
          });
      allmarkers.add(marker);
    }
    print(allmarkers.length);
  }
}
