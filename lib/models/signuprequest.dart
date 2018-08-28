class SingnupRequest {
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _confirmPassword;

  String get firstName=>_firstName;
  String get lastName=>_lastName;
  String get email=>_email;
  String get password=>_password;
  String get confirmPassword=>_confirmPassword;

  SingnupRequest(this._firstName,this._lastName,this._email,this._password,this._confirmPassword);

}