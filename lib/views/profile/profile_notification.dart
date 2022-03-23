import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
        elevation: 0,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Get.snackbar("Notification", "You have read this notification",
                    backgroundColor: Colors.green);
              },
              leading: Icon(Icons.blender_outlined),
              title: Text("Party Joined"),
              subtitle: Text(
                  "A User has joined your party and will be arriving soon at your destination"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Get.snackbar("Notification", "You have read this notification",
                    backgroundColor: Colors.green);
              },
              leading: Icon(Icons.blender_outlined),
              title: Text("Party Joined"),
              subtitle: Text(
                  "A User has joined your party and will be arriving soon at your destination"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Get.snackbar("Notification", "You have read this notification",
                    backgroundColor: Colors.green);
              },
              leading: Icon(Icons.blender_outlined),
              title: Text("Party Joined"),
              subtitle: Text(
                  "A User has joined your party and will be arriving soon at your destination"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              onTap: () {
                Get.snackbar("Notification", "You have read this notification",
                    backgroundColor: Colors.green);
              },
              leading: Icon(Icons.blender_outlined),
              title: Text("Party Joined"),
              subtitle: Text(
                  "A User has joined your party and will be arriving soon at your destination"),
            ),
          ),
        ],
      ),
    );
  }
}
