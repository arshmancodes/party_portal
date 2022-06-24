import 'dart:convert';
import 'dart:io' as Io;
import 'dart:io';
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
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
  List<String> filelocation = [];
  List<String> uploadfiles = [];

  String errMessage = 'Error Uploading Image';
  final controller = Get.find<PartyController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                      //openCamera();
                      chooseImage();
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
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Upload from Gallery',
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
                  (filelocation.isNotEmpty)
                      ? Container(
                          height: 200,
                          
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image(
                          image: FileImage(Io.File(filelocation![index])),
                          ),
                            );
      
                          }, itemCount: filelocation?.length, ) )
                      : SizedBox(
                          height: 2,
                        ),
                  SizedBox(
                    height: 40,
                  ),
                  Text("Swipe left and Right to scroll between images", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18) ),
                  SizedBox(height: 80),
                  InkWell(
                    onTap: () {
                      print("${controller.party.partySize}");
                      print("${controller.party.hostCount}");
                      print(filelocation);
                      
                      controller.party.partyImages = filelocation;
      
                      navigationController.navigateTo(partyInfo);
                    },
                    child: Image.asset('assets/images/createbtn.png'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // openCamera() async {
  //   var imagepicker = ImagePicker();
  //   var file = await imagepicker.pickImage(source: ImageSource.camera);
  //   filelocation = file!.path;
  //   setState(() {});
  // }

  chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    List<Io.File> files = [];
    if (result != null) {
      files.add(Io.File(result.files.single.path!));
      print(result.files.single.path!);
      File imagefile = Io.File(result.files.single.path!);
      filelocation.add(result.files.single.path!);
      //Uint8List imagebytes = await imagefile.readAsBytes();
      //String base64string = base64.encode(imagebytes);
      //print(base64string);
      // print(img64.substring(0, 100));
      //uploadfiles.add(base64string);
      //print(controller.party.partyImages);

      setState(() {});
    } else {
      // User canceled the picker
    }
  }
}
