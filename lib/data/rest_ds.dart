import 'dart:async';

import 'package:flutter_app_plugin_test/models/LoginResponse.dart';
import 'package:flutter_app_plugin_test/models/SignupResponse.dart';
import 'package:flutter_app_plugin_test/models/home/HomeDataResponse.dart';
import 'package:flutter_app_plugin_test/models/signuprequest.dart';
import 'package:flutter_app_plugin_test/utils/network_util.dart';


class RestDatasource {
  NetworkUtil _netUtil = new NetworkUtil();
  static final BASE_URL = "http://112.196.27.243:3098/";
  static final LOGIN_URL = BASE_URL + "login";
  static final SIGNUP_URL = BASE_URL;
  static final HOME_TASK = BASE_URL + "tasks";
  static final _API_KEY = "somerandomkey";
   Future<LoginResponse> login(String username, String password) {
    return _netUtil.post(LOGIN_URL, body: {
      "email": username,
      "password": password
    }).then((dynamic res) {
      int statusCode = res["status_code"];
      if (statusCode < 200 || statusCode > 400 || res == null) {
        print("error" + statusCode.toString());
        throw new Exception(res["message"]);
      }
      else {
        return new LoginResponse.map(res);
      }
    });
  }


  Future<SignupResponse> signup(SingnupRequest request) {
    return _netUtil.post(SIGNUP_URL, body: {

      "email": "${request.email}",
      "password": "${request.password}",
      "confirm_password": "jksdjakskd",
      "first_name": "${request.firstName}",
      "last_name": "${request.lastName}"

    }).then((dynamic res) {
      int statusCode = res["status_code"];
      if (statusCode < 200 || statusCode > 400 || res == null) {
        print("error" + statusCode.toString());
        throw new Exception(res["message"]);
      }
      else {
        return new SignupResponse.map(res);
      }
    });
  }
  Future<HomeDataResponse> loadData() {
    return _netUtil.get(HOME_TASK).then((dynamic res) {

      int statusCode = res["status"];
      if (statusCode < 200 || statusCode > 400 || res == null) {
        print("error" + statusCode.toString());
        throw new Exception(res["message"]);
      }
      else {
        return new HomeDataResponse.map(res);
      }
    });
  }


}