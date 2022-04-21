import 'dart:convert';
import 'package:cooking_app/model/login_dataModel.dart';
import 'package:http/http.dart' as http;

class LoginDataServices {
  var loginInfo;
  var isAuth = false;
  var token;
  var message;
  LoginDataModel loginDataModel = LoginDataModel();

  Future<LoginDataModel> loginUserInfo(String email, String password) async {
    var apiUrl = "https://recipeappserver.herokuapp.com/login";
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        "Content-Type": "application/json; charset=utf-8",
      },
      body: jsonEncode(loginDataModel.toJson(email, password)),
    );

    Map<String, dynamic> map = json.decode(response.body);

    loginInfo = LoginDataModel.fromJson(map);
    try {
      isAuth = loginInfo.isAuth;
      token = loginInfo.token == null ? "no token" : loginInfo.token;
      message = loginInfo.message == null ? "no message" : loginInfo.message;

      if (response.statusCode == 200 || response.statusCode == 201) {
        print("class LoginDataServices map : \n$map");
        return loginInfo;
      } else {
        print(
            " isAuth ? : ${loginInfo.isAuth} ,, message ? : ${loginInfo.message}");
        throw Exception(
            'class LoginDataServices Failed to Login User \n${response.statusCode}.');
      }
    } catch (e) {
      print("Error LoginDataServices ? : $e");
      return LoginDataModel();
    }
  }

  Future<bool> hasToken() async {
    return isAuth;
  }

  Future<String> persistToken() async {
    var token = loginInfo!.token == null
        ? "loginInfo.token in persistToken() null token"
        : loginInfo.token;
    return token;
  }

  Future<String> erorrMassege() async {
    return loginInfo.message;
  }
}
