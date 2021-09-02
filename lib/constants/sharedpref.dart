import 'package:shared_preferences/shared_preferences.dart';

class Localdbservices {
  Future logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  Future getuserpassword() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var id = await sharedPreferences.getString('uid') ?? '';
    if (id == '') {
      return null;
    } else {
      return id;
    }
  }

  void setuser(String uid) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setString('uid', uid);
  }
}
