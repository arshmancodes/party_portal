import 'package:flutter/material.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/views/bottom_nav_bar/history_page.dart';
import 'package:party_portal/views/bottom_nav_bar/home_view_page.dart';
import 'package:party_portal/views/profile/profile_page.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {


  @override
  void initState() {
    if (authServiceController.currentUser.value?.uid != null) {
      // Database().getUser(_authController.currentUser.value!.uid).then((value) {
      //   _authController.loggedInUser.value = value;
      // });
      print('null');
    }
    super.initState();
  }


  int _index = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = [
    HomeViewPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  void _onNavTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: _onNavTap,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _index == 0 ? Colors.blue : Colors.black,
            ),
            title: Text(
              "Home",
              style: TextStyle(
                color: _index == 0 ? Colors.blue : Colors.black,
              ),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.history,
                color: _index == 1 ? Colors.blue : Colors.black,
              ),
              title: Text(
                "History",
                style: TextStyle(
                  color: _index == 1 ? Colors.blue : Colors.black,
                ),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _index == 2 ? Colors.blue : Colors.black,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: _index == 2 ? Colors.blue : Colors.black,
                ),
              )),
        ],
      ),
    );
  }
}
