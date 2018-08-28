import 'package:flutter/material.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
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
                  padding: const EdgeInsets.only(top: 16.0),
                  child: new Center(
                    child: new Text(
                      "SIGN UP",
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
            ), //container

            new Expanded(child: new Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[

                //first button
                //button edit
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 50.0, right: 50.0),
                  child: new InkWell(
                    onTap: () => print('hello'),
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
                            Color.fromRGBO(11, 141, 141, 50.0),
                            Color.fromRGBO(11, 141, 141, 50.0),
                          ],
                        ), //gradient
                        border: new Border.all(
                            color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: getLayout("assets/icon_email.png", "Email"),
                      ),
                    ),

                  ),
                ), //padding //end here

                //second button
                //button edit
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 50.0, right: 50.0, top: 10.0),
                  child: new InkWell(
                    onTap: () => print('hello'),
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

                            Color.fromRGBO(223, 56, 37, 50.0),
                            Color.fromRGBO(223, 56, 37, 50.0),
                            Color.fromRGBO(242, 136, 15, 50.0),
                            Color.fromRGBO(242, 136, 15, 50.0),
                          ],
                        ), //gradient
                        border: new Border.all(
                            color: Colors.white, width: 2.0),
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: getLayout("assets/google_plus_icon.png", "Google"),
                      ),
                    ),

                  ),
                ), //padding
                // end here

                //button edit
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10.0, left: 50.0, right: 50.0, top: 10.0),
                  child: new InkWell(

                    onTap: () => print('hello'),
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
                        child: getLayout("assets/facebook_icon.png", "Facebook"),
                      ),
                    ),
                  ),
                ), //padding //end here


                //end

                //term and condition
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: new Center(
                    child: new Text(
                      "Already have an account? Sign in",
                      style: new TextStyle(fontSize: 12.0,
                        color: Colors.blue,
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto",
                      ),
                    ), //text
                  ),
                ), //center


              ],

            )
            )


          ],

        )

    );
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

}