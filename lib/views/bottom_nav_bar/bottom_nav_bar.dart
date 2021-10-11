import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/views/bottom_nav_bar/attended_history.dart';
import 'package:party_portal/views/bottom_nav_bar/build_history.dart';
import 'package:party_portal/views/bottom_nav_bar/create_party.dart';
import 'package:party_portal/views/bottom_nav_bar/home_view_page.dart';
import 'package:party_portal/views/profile/profile_page.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
  }

  int _index = 0;
  PageController _pageController = PageController();

  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      HomeViewPage(),
      AttendedHistory(),
      CreateParty(),
      BuildHistory(),
      ProfilePage(),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      _index = index;
    });
  }

  void _onNavTap(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home),
        title: ("Home"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: ("History"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage("assets/images/createbtn.png"),
          color: Colors.yellow,
          size: 50,
        ),
        // title: ("Create Party"),
        // textStyle: GoogleFonts.actor(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.history),
        title: ("History"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: ("Profile"),
        textStyle: GoogleFonts.oswald(),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.black45,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style15,
    ));
  }
}
