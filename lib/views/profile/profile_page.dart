import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/router/route_generator.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 10,
        title: Center(
          child: Text(
            "Profile",
            style: GoogleFonts.lobster(color: Colors.black, fontSize: 28),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.contain,
              ),
              // color: Colors.grey.withOpacity(0.88),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 40,
                ),
                const Center(
                  child: CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage('assets/images/MALE.png'),
                  ),
                ),
                Center(
                  child: Obx(() => Text(
                        '${authController.currentUser.value.name}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.05,
                          color: Colors.black,
                        ),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.add_location,
                      color: Colors.blue,
                      size: 30,
                    ),
                    Text('San Francisco, CA'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20),
                  child: InkWell(
                    onTap: () {
                      navigationController.navigateTo(notificationScreen);
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.notifications,
                        size: 25,
                      ),
                      title: Text(
                        'Notification',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigationController.navigateTo(editProfile);
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: ListTile(
                      leading: Icon(
                        Icons.settings,
                        size: 25,
                      ),
                      title: Text(
                        'Profile Setting',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      navigationController.navigateTo(buildHistory);
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.history,
                        size: 25,
                      ),
                      title: Text(
                        'History',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        navigationController.getOffAll(login);
                      });
                    },
                    child: const ListTile(
                      leading: Icon(
                        Icons.logout,
                        color: Colors.red,
                        size: 25,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
