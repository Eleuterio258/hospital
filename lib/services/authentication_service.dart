import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  static Future logar(String email, String senha) async {
    try {
      var headers = <String, String>{"Content-Type": "application/json"};

      var url = Uri.parse("http://ip-45-33-20-69.cloudezapp.io:5000/api/Login");

      var params = {"email": email, "senha": senha};

      var s = jsonEncode(params);

      var response = await http.post(url, headers: headers, body: s);

      if (response.statusCode == 200) {
        Map mapResponse = json.decode(response.body);
        var token = mapResponse["token"];
        var role = mapResponse["role"];
        var prefs = await SharedPreferences.getInstance();

        prefs.setString("token", token);
        
        prefs.setString("role", role);
        return true;
      } else {
        return false;
      }
    } catch (error) {
      throw Exception(error);
    }
  }
}
