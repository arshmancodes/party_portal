import 'package:flutter/material.dart';
import 'package:party_portal/views/history_page.dart';
import 'package:party_portal/views/home_view_page.dart';
import 'package:party_portal/views/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        physics: NeverScrollableScrollPhysics(),
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
