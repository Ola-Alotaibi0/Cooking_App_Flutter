import 'dart:convert';
import 'package:cooking_app/model/registration_dataModel.dart';
import 'package:http/http.dart' as http;

class RegistrationDataServices {

  var registrationInfo;

  RegistrationDataModel userDataModel = RegistrationDataModel();

  Future<RegistrationDataModel> registrationUserInfo(
      String email, String password) async {
    var apiUrl = "https://recipeappserver.herokuapp.com/register";
    http.Response res = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode(
        userDataModel.toJson(email, password),
      ),

    );

    Map<String, dynamic> map = json.decode(res.body);
    try {

      registrationInfo = RegistrationDataModel.fromJson(map);

      if (res.statusCode == 200) {

        print("class UserDataServices map : \n$map");


        return registrationInfo;

      } else {

        throw Exception(
            'class UserDataServices Failed to create User, error is ${registrationInfo.message}.');
      }
    } catch (e) {
      print("class UserDataServices error");
      print(e);
      return RegistrationDataModel();
    }
  }

  Future<bool> successfulRegistration() async{

    var check_SuccessfulRegistration = registrationInfo.success == null ? false : registrationInfo.success;


    return check_SuccessfulRegistration;
  }

  Future<String> errorMessageRegistration() async{
    var errorMessage_Registration = registrationInfo.message == null ? "message null" : registrationInfo.message;
    return errorMessage_Registration;
  }
}