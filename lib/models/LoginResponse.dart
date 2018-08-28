import 'package:flutter_app_plugin_test/models/User.dart';

class LoginResponse {
  bool success;
  String token;
  int status;
  User user;

  LoginResponse.map(dynamic obj) {
    this.success = obj["success"];
    this.token = obj["token"];
    this.status = obj["status"];
    this.user = new User.map(obj["user"]);
  }


  bool get _success => success;

  String get _token => token;

  int get _status => status;

  User get _user => user;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map["token"] = _token;
    map["user"] = _user;

    return map;
  }
}