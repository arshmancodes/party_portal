import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class AdminParty extends StatefulWidget {
  const AdminParty({ Key? key }) : super(key: key);

  @override
  _AdminPartyState createState() => _AdminPartyState();
}

class _AdminPartyState extends State<AdminParty> {
  List<String> filelocation = [];
 Widget image_carousel = Container(
    // decoration: BoxDecoration(
    //   borderRadius: BorderRadius.circular(10.0)
    // ),
    height: 200.0,
    child: CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
      ),
      items: [1, 2, 3, 4, 5]
          .map((e) => Builder(
                builder: (BuildContext context) {
                  return Container(
                    child: Image.asset('assets/images/EventBidding.png'),
                  );
                },
              ))
          .toList(),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 40,
        centerTitle: true,
        
      ),
      body: ListView(
        children: [
          Center(child: Text("Admin Options", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20))),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
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
                                    'Add Images from Gallery',
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
                          image: FileImage(File(filelocation![index])),
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
          // Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20),
          //   child: Container(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         borderRadius: BorderRadius.circular(20),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.2), //color of shadow
          //             spreadRadius: 5, //spread radius
          //             blurRadius: 7, // blur radius
          //             offset: Offset(0, 2), // changes position of shadow
          //           ),
          //         ],
          //       ),
          //       child: image_carousel),
          // ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Center(
                      child: Container(
                        height: 80,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey
                                  .withOpacity(0.2), //color of shadow
                              spreadRadius: 2, //spread radius
                              blurRadius: 2, // blur radius
                              offset:
                                  Offset(0, 2), // changes position of shadow
                              //first paramerter of offset is left-right
                              //second parameter is top to down
                            ),
                            //you can set more BoxShadow() here
                          ],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image.asset(
                          'assets/images/EventBidding.png',
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'Detail',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a',
              style: TextStyle(fontSize: 10, color: Colors.black54),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Duration',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '11:45:00 PM',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Location',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'America',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'States',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'wasigton',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Drink',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'All',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2), //color of shadow
                    spreadRadius: 2, //spread radius
                    blurRadius: 2, // blur radius
                    offset: Offset(0, 2), // changes position of shadow
                    //first paramerter of offset is left-right
                    //second parameter is top to down
                  ),
                  //you can set more BoxShadow() here
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Members',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '54',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Center(
              child: Text("Join Party"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Enter the amount to Bid"),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                              decoration: InputDecoration(
                            label: Text("Amount"),
                          )),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Get.snackbar("Bid Placed",
                                    "Your bid has been successfully placed",
                                    backgroundColor: Colors.green);
                              },
                              child: Text("Bid"))
                        ],
                      ),
                    );
                  });
            },
            child: Center(
              child: Text("Bid on This Party"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              Get.snackbar("Party Updated",
                                    "The party has been updated with new Data",
                                    backgroundColor: Colors.green);
            },
            child: Center(
              child: Text("Save Info"),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: InkWell(
          //     onTap: () {
          //       // Get.to(EventInfoNext());
          //     },
          //     child: Container(
          //       height: 80,
          //       width: 40,
          //       decoration: BoxDecoration(
          //         color: Colors.blue,
          //         borderRadius: BorderRadius.circular(50),
          //         border: Border.all(
          //           color: Colors.yellow,
          //         ),
          //       ),
          //       child: Center(
          //         child: Text(
          //           "Click Here to Follow\n    Martina's Party",
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 20.0,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 30.0),
          //   child: InkWell(
          //       onTap: () {
          //         navigationController.getOffAll(home);
          //       },
          //       child: Image.asset(
          //         'assets/images/play.png',
          //         width: 70,
          //         height: 70,
          //       )),
          // ),
        ],
      ),
    );

    
  }
  chooseImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    List<File> files = [];
    if (result != null) {
      files.add(File(result.files.single.path!));
      print(result.files.single.path!);
      filelocation.add(result.files.single.path!);
      setState(() {});
    } else {
      // User canceled the picker
    }
  }
}