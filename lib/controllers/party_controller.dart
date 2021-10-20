import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PartyController extends GetxController {
  void getParties() async {
    Uri url = Uri.parse('http://192.168.100.58:3000/');

    try {
      var response = await http.get(url,
          headers: {'Content-Type': 'application/json; charset=UTF-8'});

      print(response.body);
    } on Exception catch (e) {
      print(e);
    }
  }
}
