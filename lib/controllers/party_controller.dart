import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as form;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:party_portal/constants/base_url.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/authentication/auth_controller.dart';
import 'package:party_portal/models/partymodel.dart';

class PartyController extends GetxController {
  var auth = Get.find<AuthController>();
  var partylist = <PartyModel>[].obs;
  var markerslist = <Location>[].obs;
  var notificationslist = <RemoteMessage>[].obs;
  List<Marker> allmarkers = <Marker>[].obs;
  var partyDetail = PartyModel();
  final party = PartyModel();
  var view_party = PartyModel();
  final usercreated = <PartyModel>[].obs;
  final usercreated2 = <PartyModel>[].obs;
  double? lat;
  double? long;
  BitmapDescriptor? icon;
  form.Dio dio = form.Dio();

  void sendPartyNotification() async {
    var notiurl = Uri.parse("https://fcm.googleapis.com/fcm/send");

    try {
      var response_noti = await http.post(notiurl,
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization':
                'key=AAAAmoWXIaQ:APA91bEwk2aTPGusqDiMmXOr3Ka20s3g5FPlKt-LMnvwPW356m73ItwuAXlVH0i0WsIGfnAIHhMjQMYp4IYXCzMZoq1Ig8dKvmiLO3ckTDf1lXfjHdkreDOVked8zDN95dbyX2etyalI'
          },
          body: jsonEncode({
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
    Uri url = Uri.parse('$base_url/party/all');

    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      Iterable list = jsonDecode(response.body)['results'];
      partylist.value = list.map((e) => PartyModel.fromJson(e)).toList();
      markerslist.value =
          list.map((e) => Location.fromJson(e['location'])).toList();
      icon = await BitmapDescriptor.fromAssetImage(
          ImageConfiguration(size: Size(16, 16)), 'assets/images/Create.png');
      getMarkers();
    } on Exception catch (e) {
      print(e);
    }
  }

  void deleteParty(String id) async {
    Uri url = Uri.parse("$base_url/party/delete/$id");

    try {
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});
      print(response.body);
    } on Exception catch (e) {}
  }

  Future<void> getPartybyId(String userid) async {
    Uri url = Uri.parse("$base_url/party/all");

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
    Uri url = Uri.parse('$base_url/party/create');

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

  // postIt() async {
  //   var postUri = Uri.parse("$base_url/party/create");
  //   var request = new http.MultipartRequest("POST", postUri);
  //   request.fields['createdBy'] = party.createdBy!;
  //   request.fields['partySize'] = party.partySize!;
  //   request.fields['hostCount'] = party.hostCount!.toString();
  //   request.fields['guestCount'] = party.guestCount!.toString();
  //   request.fields['createdAt'] = DateTime.now().toString();
  //   request.fields['updatedAt'] = DateTime.now().toString();
  //   request.fields['location'] = party.location!.toJson() as String;

  //   for (int i = 0; i < party.partyImages!.length; i++) {
  //     var file = new http.MultipartFile.fromBytes(
  //         'partyImages', party.partyImages![i]!.file.readAsBytesSync(),
  //         contentType:  MediaType('image', 'jpeg'));
  //     request.files.add(file);

  //   }

  //   request.files.add(new http.MultipartFile.fromBytes('partyImages', await File.fromUri("<path/to/file>").readAsBytes(), contentType: new MediaType('image', 'jpeg')))

  //   request.send().then((response) {
  //     if (response.statusCode == 200) print("Uploaded!");
  //   });
  // }

  // void postParty() async {

  //     List<File> files = [];
  //     List<MultipartFile> uploadfiles = [];
  //   for (int i = 0; i < party.partyImages!.length; i++) {
  //     uploadfiles.add();
  //   }

  //   var data = jsonEncode({
  //     'createdBy': party.createdBy,
  //     'partySize': party.partySize,
  //     'hostCount' : party.hostCount,
  //     'guestCount' : party.guestCount,
  //     'partyImages' : files,
  //     'location': {
  //       'latitude': party.location!.latitude,
  //       'longitude': party.location!.longitude,
  //       'locationName' : party.location!.locationName,
  //     },

  //     'createdAt': DateTime.now().toString(),
  //     'updatedAt': DateTime.now().toString(),
  //   });
  // }

  // void postParty() async {
  //   var json = party.toJson();
  //   print(json);
  //   List<File> files = [];
  //   for (int i = 0; i < party.partyImages!.length; i++) {
  //     files.add(File(party.partyImages![i]!));
  //   }
  //   party.partyImages = [];

  //   var req =
  //       http.MultipartRequest('POST', Uri.parse('$base_url/party/create'));
  //   files.forEach((element) async {
  //     req.files
  //         .add(await http.MultipartFile.fromPath('partyImages', element.path));
  //   });

  //   req.headers.addAll({
  //     'Content-Type': 'multipart/form-data',
  //   });

  //   var response = req.send();
  //   print(response);
  // }
  //   // try {
  //   //   var response = await dio.post(
  //   //     "$base_url/party/create",
  //   //     data: form.FormData.fromMap(
  //   //       {
  //   //         "partyImages[]": files,
  //   //         "createdBy": party.createdBy,
  //   //         "partySize": party.partySize,
  //   //         "partyRating": party.partyRating,
  //   //         "startingDate": party.startingDate,
  //   //         "drinks": party.drinks,
  //   //         "games": party.games,
  //   //         "location": party.location,
  //   //       },
  //   //     ),
  //   //     options: form.Options(
  //   //       headers: {
  //   //         'Content-Type': 'multipart/form-data',
  //   //       },
  //   //     ),
  //   //   );

  //   //   print(response.data);
  //   // } catch (err) {
  //   //   print("error");
  //   // }

  //   // try {
  //   //   var response = await http.post(url,
  //   //       headers: {'Content-Type': 'application/json; charset=UTF-8'},
  //   //       body: jsonEncode(json));
  //   //   print(response.body);
  //   // } on Exception catch (e) {
  //   //   print(e);
  //   // }
  //   // print(jsonEncode(json));
  // }

  void getMarkers() {
    for (int i = 0; i < markerslist.length; i++) {
      Marker marker = Marker(
          icon: icon!,
          markerId: MarkerId(markerslist[i].locationName!),
          draggable: false,
          position: LatLng(markerslist[i].latitude!, markerslist[i].longitude!),
          onTap: () {
            if (auth.currentUser.value.email == 'arshman11@hotmail.com') {
              navigationController.navigateTo('/adminParty');
            } else {
              navigationController.navigateTo('/partyPricing');
            }

            partyDetail = partylist[i];
          });
      allmarkers.add(marker);
    }
    print(allmarkers.length);
  }
}
