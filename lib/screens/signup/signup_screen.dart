import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_plugin_test/other/auth.dart';
import 'package:flutter_app_plugin_test/models/SignupResponse.dart';
import 'package:flutter_app_plugin_test/models/signuprequest.dart';
import 'package:flutter_app_plugin_test/screens/signup/signup_screen_presenter.dart';


class SignupScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<SignupScreen>
    implements SignupScreenContract, AuthStateListener {
  BuildContext _ctx;


  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _firstName, _lastName, _email, _password, _confirmPass;

  SignupScreenPresenter _presenter;

  LoginScreenState() {
    _presenter = new SignupScreenPresenter(this);
    var authStateProvider = new AuthStateProvider();
    authStateProvider.subscribe(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      print("hello");
      form.save();
      SingnupRequest request = new SingnupRequest(
          _firstName, _lastName, _email, _password, _confirmPass);
      _onLoading();
      _presenter.doSignup(request);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  onAuthStateChanged(AuthState state) {
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
        child: new Center(child: new Text('SIGN UP',
          // ignore: conflicting_dart_import
          style: new TextStyle(fontSize: 14.0, color: Colors.deepOrange),),),
      ),
    );


    var loginForm = new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,

      children: <Widget>[

        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            onTap: () => Navigator.of(_ctx).pop(), //back button hit
            child: new Icon(
                Icons.arrow_back,
                color: const Color(0xFFFFFFFF),
                size: 24.0),
          ),
        ),

        Center(
          child: new Text(
            "SIGN UP",
            style: new TextStyle(fontSize: 22.0,
                color: const Color(0xFFFFFFFF),
                fontWeight: FontWeight.w700,
                fontFamily: "Roboto"),

          ),
        ),
        new Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
            child: new Column(
              children: <Widget>[
                //first name
                new TextFormField(
                  onSaved: (val) => _firstName = val,
                  validator: (val) {
                    if (val.length == 0) {
                      return "Please enter your first name";
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "First Name", fillColor: Colors.white),

                ),


                //second name
                new TextFormField(
                  onSaved: (val) => _lastName = val,
                  validator: (val) {
                    if (val.length == 0) {
                      return "Please enter your last name";
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Last Name", fillColor: Colors.white),

                ),


                //email field
                new TextFormField(
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
                //password
                new TextFormField(
                  onSaved: (val) => _password = val,
                  validator: (val) {
                    if (val.length == 0) {
                      return "Please enter your password";
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Password", fillColor: Colors.white),
                  obscureText: true, //to make it password field
                ),

                //confirm password
                new TextFormField(
                  onSaved: (val) => _confirmPass = val,
                  validator: (val) {
                    if (val.length == 0) {
                      return "Please enter your confirm passwrod";
                    }
                    else if (_password!=val) {
                      return "Your password dosen't match";
                    }
                  },
                  decoration: new InputDecoration(
                      labelText: "Confirm Password", fillColor: Colors.white

                  ),
                  obscureText: true, //to make it password field
                ),
              ], //children
            ), //column
          ), //padding
        ), //form
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: loginBtn,
        ), //padding


      ],


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
          height: double.infinity, //for match parent
          color: Colors.deepOrange,
//        decoration: new BoxDecoration(
//          image: new DecorationImage(
//              image: new AssetImage("assets/background_image.jpg"),
//              fit: BoxFit.cover),
//        ),

          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: new Container(
                child: loginForm,

              ),
            ),
          ), //scrollview
        ),
      ),
    );
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

  @override
  void onSignupSuccess(SignupResponse res) async {
    _showSnackBar(res.message);
    _onHideLoading();
    Navigator.of(_ctx).pushReplacementNamed("/home");
  }

  @override
  void onSignupError(String errorTxt) {
    print("called");
    _onHideLoading();
    _showDialog(errorTxt);
  }

}