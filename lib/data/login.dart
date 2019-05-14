import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class Login{
  static final BASE_URL = "http://localhost:8081";
  static final LOGIN_URL = BASE_URL + "/login";
  SharedPreferences prefs;

  Future<bool> getAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    return prefs.getBool("token") ?? false;
  }

  Future<bool> doLogin(user, pass) async {
    try {
      http.Response response = await http.post(LOGIN_URL, body: {
        "email": user,
        "senha": pass
      });

      var jsonData = json.decode(response.body);
      print(jsonData);

      if(jsonData["id"]) {
        success(jsonData);
        return true;
      }
      else
        return false;
    } on Exception catch (_) {}
  }

  void success(jsonData) async {
    prefs = await SharedPreferences.getInstance();

    prefs.setString("id", jsonData["token"]);
    prefs.setString("email", jsonData["user"]["id"].toString());
    prefs.setString("senha", jsonData["user"]["first"]);
    prefs.setString("nome", jsonData["user"]["last"]);

  }


  Future<bool> isLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    var res = prefs.getString("token").toString();
    return res != "null"? true: false;
  }

  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    print("gettoken "+ prefs.getString("token").toString());
    return prefs.getString("token").toString();
  }
  Future<String> getUserId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString("id");
  }

  void doLogoff() async{
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

}