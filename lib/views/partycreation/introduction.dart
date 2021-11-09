import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/controllers/party_controller.dart';
import 'package:party_portal/router/route_generator.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  Future<XFile?>? file;
  String status = '';
  String? base64Image;
  XFile? tmpFile;
  String? filelocation;
  String errMessage = 'Error Uploading Image';
  final controller = Get.find<PartyController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Let's Meet the Host",
                  style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Please attach some of your photos or Party\nphotos to make the guests more comfortable.",
                  style: GoogleFonts.poppins(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    openCamera();
                    //chooseImage();
                  },
                  child: Card(
                    elevation: 20,
                    color: Colors.blue[400],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: SizedBox(
                      width: 150,
                      height: 58,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Take a Picture',
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                (filelocation != null)
                    ? Container(
                        height: 200,
                        width: 200,
                        child: Image(
                          image: FileImage(File(filelocation!)),
                        ))
                    : SizedBox(
                        height: 2,
                      ),
                SizedBox(
                  height: 200,
                ),
                InkWell(
                  onTap: () {
                    print("${controller.party.partySize}");
                    print("${controller.party.hostCount}");
                    print(filelocation);
                    List<String?>? temp = [];
                    temp.add(filelocation);
                    controller.party.partyImages = temp;

                    navigationController.navigateTo(partyInfo);
                  },
                  child: Image.asset('assets/images/createbtn.png'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openCamera() async {
    var imagepicker = ImagePicker();
    var file = await imagepicker.pickImage(source: ImageSource.camera);
    filelocation = file!.path;
    setState(() {});
  }

  chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File files;
    if (result != null) {
      files = File(result.files.single.path!);
      print(result.files.single.path!);
      filelocation = result.files.single.path!;
      setState(() {});
    } else {
      // User canceled the picker
    }
  }
}
