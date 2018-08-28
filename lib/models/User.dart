class User {
  String first_name;
  String last_name;
  String email;

  String get _firstName => first_name;
  String get _lastName => last_name;
  String get _email => email;
  User.map(dynamic obj) {
    this.first_name = obj["first_name"];
    this.last_name = obj["last_name"];
    this.email = obj["email"];
  }


}