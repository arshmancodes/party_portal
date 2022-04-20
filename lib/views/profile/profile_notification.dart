import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/controllers/party_controller.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  final controller = Get.find<PartyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (controller.notificationslist.isEmpty)
              ? Text("No Notifications to Show")
              : ListView.builder(
              itemCount: controller.notificationslist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {

                  },
                  child: Card(
                    elevation: 5,
                    color: Colors.white,
                    child: ListTile(
                      leading: Icon(Icons.add_a_photo),
                      title: Text('${controller.notificationslist[index].notification!.title}'),
                      subtitle: Text('${controller.notificationslist[index].notification!.body}'),
                    ),
                  ),
                );
              })),
    );
  }
}
//Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceAround,
//                           children: [
//                             Expanded(
//                               child: SingleChildScrollView(
//                                 child:Text(
//                                   "${controller.notificationslist[index].notification!.title}",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Expanded(
//                               child: Text(
//                                 '${controller.notificationslist[index].notification!.body}',
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),