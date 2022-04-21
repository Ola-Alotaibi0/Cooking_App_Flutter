
class RegistrationDataModel{
  String? email;
  String? password;
  String? name;
  String? message;
  bool? success ;
  RegistrationDataModel({
    this.email,
    this.password,
    this.message,
    this.success,
  });

  RegistrationDataModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    message = json['message'];
    name = json['name'];
    success = json['success'];
  }

  Map<String, dynamic> toJson(String email, String password) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = email;
    data['password'] = password;
    return data;
  }

}
