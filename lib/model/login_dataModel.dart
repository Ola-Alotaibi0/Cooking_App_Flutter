
class LoginDataModel {
  String? email;
  String? password;
  bool? isAuth;
  String? message;
  String? token;

  LoginDataModel({this.email, this.password, this.isAuth, this.message, this.token});


  LoginDataModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    isAuth = json['isAuth'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson(String email, String password) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}