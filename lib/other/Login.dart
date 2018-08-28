import 'dart:async';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        key: scaffoldKey,

        body: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //top back button
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 24.0),
                  child: new Icon(
                      Icons.arrow_back,
                      color: Colors.green,
                      size: 24.0),
                ), //padding

                //heading
                Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: new Center(
                    child: new Text(
                      "SIGN IN",
                      style: new TextStyle(fontSize: 30.0,
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto"),
                    ), //text
                  ), //center
                ), //padding

                //divider
                Center(
                  child: Container(
                    width: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: new Divider(color: Colors.green),
                    ), //padding
                  ), //container
                ), //center

                //summary text
                new Center(
                  child: new Text(
                    "Just one step Left\nto your veggy",
                    textAlign: TextAlign.center,
                    style: new TextStyle(fontSize: 16.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto",

                    ),
                  ), //text
                ), //center


              ],
            ), //column

            new Expanded(child: Form(
              key: formKey,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  //username
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 25.0, left: 50.0, right: 50.0, top: 10.0),
                    child: Container(
                      width: 300.0,
                      height: 50.0,

                      child: new Theme(


                        child: new TextFormField(

                          decoration: new InputDecoration(

                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white),
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(100.0),

                                ),
                              ),
                              filled: true,
                              hintStyle: new TextStyle(color: Colors.grey[800]),
                              hintText: "User Name",
                              fillColor: const Color(0xFFBBF6D5)),
                          style: new TextStyle(
                            fontSize: 13.0,
                            height: 0.4,
                            color: Colors.black,
                          ),
                          validator: (val) =>
                          val.length == 0 ? 'Please enter user name.' : null,
                          onSaved: (val) => _email = val,

                        ), data: new ThemeData(
                        primaryColor: Colors.redAccent,
                        primaryColorDark: Colors.red,
                      ),
                      ),
                    ),
                  ), //text field


                  //password
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 50.0, right: 50.0),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(100.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Password",
                          fillColor: const Color(0xFFBBF6D5)),
                      style: new TextStyle(
                        fontSize: 13.0,
                        height: 0.4,
                        color: Colors.black,
                      ),

                      validator: (val) =>
                      val.length < 10 ? 'Password too short.' : null,
                      onSaved: (val) => _password = val,
                      obscureText: true,

                    ),
                  ), //text field

                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 50.0, right: 50.0),
                      child: new Text(
                        "Forgot Password?",
                        style: new TextStyle(fontSize: 12.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Roboto"),
                      ),
                    ),
                  ),


                  //button edit
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 50.0, right: 50.0, top: 10.0),
                    child: new InkWell(

                      onTap: () => _submit(),
                      child: new Container(
                        width: 300.0,
                        height: 50.0,

                        decoration: new BoxDecoration(
                          gradient: new LinearGradient( // new
                            // Where the linear gradient begins and ends
                            begin: Alignment.topRight, // new
                            end: Alignment.bottomLeft, // new
                            // Add one stop for each color.
                            // Stops should increase
                            // from 0 to 1
                            stops: [0.1, 0.1, 0.7, 0.9],
                            colors: [
                              // Colors are easy thanks to Flutter's
                              // Colors class.


                              Color.fromRGBO(29, 90, 212, 50.0),
                              Color.fromRGBO(29, 90, 212, 50.0),
                              Color.fromRGBO(30, 135, 239, 50.0),
                              Color.fromRGBO(30, 135, 239, 50.0),
                            ],
                          ), //gradient
                          border: new Border.all(
                              color: Colors.white, width: 2.0),
                          borderRadius: new BorderRadius.circular(100.0),


                        ), //box decoration
                        child: Padding(
                          padding: const EdgeInsets.only(left: 30.0),
                          child: getLayout(
                              "assets/facebook_icon.png", "Facebook"),
                        ),
                      ),
                    ),
                  ), //padding //end here


                  //end

                  //term and condition
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: new Center(
                      child: new Text(
                        "Create a account? Sign up",
                        style: new TextStyle(fontSize: 12.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Roboto",
                        ),
                      ), //text
                    ),
                  ), //center


                ],

              ),
            ) //expended
            )


          ],

        )

    );
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();

      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _onLoading(); //show loader
    }
  }

  Widget getLayout(String icon, String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0,),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            new Image.asset(
              '$icon',
              width: 16.0,
              height: 16.0,
              fit: BoxFit.fill,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: new Container(
                width: 1.0,
                height: 15.0,
                color: Colors.grey,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: new Text(
                "$text",
                style: new TextStyle(fontSize: 15.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Roboto",
                ),
              ),
            ),
          ],
        ),
      ),
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
    new Future.delayed(new Duration(seconds: 10), () {
      Navigator.pop(scaffoldKey.currentState.context); //pop dialog
      // _login();
    });
  }


}