import 'package:flutter/material.dart';
import 'package:party_portal/constants/controllers.dart';
import 'package:party_portal/views/authentication/auth_decider.dart';
import 'package:party_portal/views/bottom_nav_bar/admin_party.dart';
import 'package:party_portal/views/bottom_nav_bar/auction_view.dart';
import 'package:party_portal/views/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:party_portal/views/authentication/login_page.dart';
import 'package:party_portal/views/authentication/signup_page.dart';
import 'package:party_portal/views/bottom_nav_bar/build_history.dart';
import 'package:party_portal/views/partycreation/drinks_selection.dart';
import 'package:party_portal/views/partycreation/introduction.dart';
import 'package:party_portal/views/partycreation/join_party.dart';
import 'package:party_portal/views/partycreation/map_select.dart';
import 'package:party_portal/views/partycreation/party_info.dart';
import 'package:party_portal/views/partycreation/party_detail.dart';
import 'package:party_portal/views/partycreation/party_size.dart';
import 'package:party_portal/views/partycreation/portal_pricing.dart';
import 'package:party_portal/views/profile/edit_profile.dart';
import 'package:party_portal/views/profile/profile_notification.dart';
import 'package:party_portal/views/splash/splash_screen.dart';
import 'package:party_portal/views/winningPages/arrive.dart';
import 'package:party_portal/views/winningPages/guestIntroduction.dart';
import 'package:party_portal/views/winningPages/winning_start.dart';

// STATIC ROUTES NAME
const String initialRoute = '/';
const String authDecider = '/auth-decider';
const String login = '/login';
const String home = '/home';
const String signUp = '/signup';
const String signOut = '/sign-out';
const String mainRootPage = '/main-root-page';
const String partySize = '/party-size';
const String introPage = '/introduction';
const String partyInfo = '/party-info';
const String drinkSelection = '/drinkSelection';
const String eventDetail = '/eventDetail';
const String auctionView = '/auctionView';
const String joinParty = '/joinParty';
const String partyPricing = '/partyPricing';
const String winningStart = '/WinningPage';
const String guestIntro = '/guesIntro';
const String arrivePage = '/arrivePage';
const String notificationScreen = '/notificationScreen';
const String buildHistory = '/buildHistory';
const String editProfile = '/editProfile';
const String mapSelect = '/mapSelect';
const String adminParty = '/adminParty';
// TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

class RouteGenerator {
  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return _getPageRoute(SplashScreen());
      case login:
        return _getPageRoute(LoginPage());
      case authDecider:
        return _getPageRoute(const AuthDecider());
      case signUp:
        return _getPageRoute(SignupPage());
      case mainRootPage:
        return _getPageRoute(const BottomNavBar());
      case partySize:
        return _getPageRoute(const PartySize());
      case introPage:
        return _getPageRoute(const IntroductionPage());
      case partyInfo:
        return _getPageRoute(const PartyInfo());
      case drinkSelection:
        return _getPageRoute(DrinkSelection());
      case home:
        return _getPageRoute(BottomNavBar());
      case eventDetail:
        return _getPageRoute(EventDetail());
      case auctionView:
        return _getPageRoute(AuctionView());
      case joinParty:
        return _getPageRoute(JoinParty());
      case partyPricing:
        return _getPageRoute(PortalPricing());
      case winningStart:
        return _getPageRoute(WinningStart());
      case guestIntro:
        return _getPageRoute(GuestIntro());
      case arrivePage:
        return _getPageRoute(ArrivePage());
      case notificationScreen:
        return _getPageRoute(NotificationScreen());
      case buildHistory:
        return _getPageRoute(BuildHistory());
      case signOut:
        authController.logOutUser();
        return _getPageRoute(SignupPage());
      case editProfile:
        return _getPageRoute(EditProfile());
      case mapSelect:
        return _getPageRoute(MapSelect());
      case adminParty:
        return _getPageRoute(AdminParty());
      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}
