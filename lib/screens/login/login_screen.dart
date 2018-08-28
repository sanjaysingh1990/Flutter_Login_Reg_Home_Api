import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_plugin_test/other/auth.dart';
import 'package:flutter_app_plugin_test/data/database_helper.dart';
import 'package:flutter_app_plugin_test/models/LoginResponse.dart';
import 'package:flutter_app_plugin_test/screens/login/login_screen_presenter.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>
    implements LoginScreenContract, AuthStateListener {
  BuildContext _ctx;


  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _email;

  LoginScreenPresenter _presenter;

  LoginScreenState() {
    _presenter = new LoginScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      _onLoading();
      _presenter.doLogin(_email, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
    print("authentication called");
    if (state == AuthState.LOGGED_IN)

      Navigator.of(_ctx).pushReplacementNamed("/home");
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    //login
    var loginBtn = new InkWell(
      onTap: () => _submit(),
      child: new Container(
        //width: 100.0,
        height: 40.0,
        decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border.all(color: Colors.white, width: 2.0),
          borderRadius: new BorderRadius.circular(100.0),
        ),
        child: new Center(child: new Text('LGOIN',
          // ignore: conflicting_dart_import
          style: new TextStyle(fontSize: 14.0, color: Colors.deepOrange),),),
      ),
    );






    var loginForm = new Column(
      children: <Widget>[
        new Text(
          "LOGIN",
          style: new TextStyle(fontSize: 22.0,
              color: const Color(0xFFFFFFFF),
              fontWeight: FontWeight.w700,
              fontFamily: "Roboto"),

        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  validator: (val) {
                    if (val.length == 0) {

                      return "Please enter your email";
                    }
                    else if (!val.contains("@")) {

                      return "Please enter a valid email";
                    }

                  },
                  decoration: new InputDecoration(labelText: "Email"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.only(
                    left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),

                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(
                      labelText: "Password", fillColor: Colors.white),
                  obscureText: true, //to make it password field
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: loginBtn,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 14.0,right: 14.0),
          child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  "Forgat password?",
                  style: new TextStyle(fontSize:12.0,
                      color: const Color(0xFFf9ebeb),
                      fontWeight: FontWeight.w500,
                      fontFamily: "Roboto"),
                ),
                new InkWell(
                  onTap: () =>  Navigator.of(_ctx).pushNamed("/signup"),
                  child: new Text(
                    "Sign up",
                    style: new TextStyle(fontSize:12.0,
                        color: const Color(0xFFf9ebeb),
                        fontWeight: FontWeight.w500,
                        fontFamily: "Roboto"),
                  ),
                ),

          ],

          ),
        )

      ],


      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: Theme(
        data: Theme.of(context).copyWith(
            primaryColor: Colors.white,
            accentColor: Colors.white,
            hintColor: Colors.white,
            inputDecorationTheme: new InputDecorationTheme(
                labelStyle: new TextStyle(color: Colors.white))
        ),
        child: new Container(
          color: Colors.deepOrange,
//        decoration: new BoxDecoration(
//          image: new DecorationImage(
//              image: new AssetImage("assets/background_image.jpg"),
//              fit: BoxFit.cover),
//        ),

          child: new Center(
            child: new Container(
              child: loginForm,

              height: 300.0,

            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginError(String errorTxt) {

    _onHideLoading();
    _showDialog(errorTxt);
  }

  @override
  void onLoginSuccess(LoginResponse response) async {
    _onHideLoading();
    _showSnackBar("Login successful!");
    Navigator.of(_ctx).pushReplacementNamed("/home");
//    var db = new DatabaseHelper();
//    await db.saveUser(response);
//    var authStateProvider = new AuthStateProvider();
//    authStateProvider.notify(AuthState.LOGGED_IN);

  }

  // user defined function
  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert"),
          content: new Text("$message"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _onLoading() {
    showDialog(
      context: scaffoldKey.currentState.context,
      barrierDismissible: false,
      child: new SimpleDialog(
        title: Container(
          child: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
                  child: new Text("Loading"),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onHideLoading() {
    Navigator.pop(scaffoldKey.currentState.context); //pop dialog
  }

}