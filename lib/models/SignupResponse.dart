

class SignupResponse {
  bool _success;
  String _message;
  int _status;

  String get message=>_message;

  SignupResponse.map(dynamic obj) {
    this._success = obj["success"];
    this._message = obj["message"];
    this._status = obj["status"];

  }



}