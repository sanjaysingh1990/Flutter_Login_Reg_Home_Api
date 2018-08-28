import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton
  static NetworkUtil _instance = new NetworkUtil.internal();
  NetworkUtil.internal();
  factory NetworkUtil() => _instance;
  static final TOKEN="eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjViNzdhOGFkNDQ1M2QzMDg3OTU0YmQ2ZCIsImlhdCI6MTUzNTM0OTU1NX0.dt_EG3j2BScnRdk6Y2xGU_-5buuM3aTb-lAkE1xZV0LEJ5v57ziAhCHXUu7rjwoix4mn3P1YaGVuACmHUPI-_g";

  final JsonDecoder _decoder = new JsonDecoder();

  Future<dynamic> get(String url) {
    return http.get(url, headers: {
    "x-access-token": TOKEN

    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return _decoder.convert(res);
    });
  }

  Future<dynamic> post(String url, {Map headers, body, encoding}) {
    print(body);
    return http
        .post(url, body: body, headers: headers, encoding: encoding)
        .then((http.Response response) {
      final String res = response.body;
      print(res);
      final int statusCode = response.statusCode;
      dynamic result=_decoder.convert(res);


      result["status_code"]=statusCode;
      return result;
    });
  }



}