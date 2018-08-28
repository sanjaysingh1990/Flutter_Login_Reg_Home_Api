import 'package:flutter/material.dart';
import 'package:flutter_app_plugin_test/data/rest_ds.dart';
import 'package:flutter_app_plugin_test/models/home/DataItem.dart';
import 'package:flutter_app_plugin_test/models/home/HomeDataResponse.dart';
import 'package:flutter_app_plugin_test/screens/home/home_screen_presenter.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new HomeScreenApp();
  }
}

class HomeScreenApp extends State<HomeScreen> implements HomeScreenContract {

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  RestDatasource api;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    api = new RestDatasource();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(title: new Text("Home"),),
      body: new Center(
        child: new Column(
          children: <Widget>[
            //first time
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //first item
                children: <Widget>[
                  _getPointItem(
                      Icons.add_circle, "Today/Tomorrow", Colors.deepOrange),
                  _getPointItem(Icons.add_circle, "This week", Colors.blue),
                  _getPointItem(Icons.add_circle, "Later", Colors.green),

                ],

              ),
            ), //row


            new Expanded(
              child: FutureBuilder<HomeDataResponse>(
                future: api.loadData(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) print(snapshot.error);

                  return snapshot.hasData
                      ? loadList(
                      snapshot.data.dataList) // return the ListView widget
                      : Center(child: CircularProgressIndicator());
                },
              ),

            )

          ],
        ),
      ),
    );
  }

  Widget loadList(List<DataItem> list) {
    return new ListView.builder
      (
        itemCount: list.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext ctxt, int Index) {
          Color color = Colors.deepOrange;
          //for item left strip color
          var item = list[Index];
          if (item.scheduleList.daysLeft > 0 &&
              item.scheduleList.daysLeft <= 7) {
            color = Colors.blue;
          }
          else if (item.scheduleList.daysLeft > 7) {
            color = Colors.green;
          }
          //for time left
          String timeleft;

          if (item.scheduleList.daysLeft < 0) {
            timeleft = "Expired";
          }
         else if (item.scheduleList.daysLeft == 0) {
            timeleft = "Today";
          }
          else if (item.scheduleList.daysLeft < 7) {
            timeleft = item.scheduleList.daysLeft.toString() + " day left";
          }

          else  {
            timeleft = item.scheduleList.daysLeft.toString() + " day left";
          }

          return _listItem(list[Index], color,timeleft);
        }
    );
  }

  Widget _getPointItem(IconData icon, String title, Color color)
       {
    //first time
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //first item
      children: <Widget>[
        new Icon(
            icon,
            color: color,
            size: 10.0),
        //first time
        new Row(
          children: <Widget>[
            new Text(
              "$title",
              style: new TextStyle(fontSize: 10.0,
                color: const Color(0xFF000000),
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto",

              ),
            ),
          ],
        )

      ],


    );
  }

  Widget _listItem(DataItem item, Color color,String timeLeft) {
    return new Card(

      child: new Row(
        children: <Widget>[
          new Container(
            height: 102.0,
            width: 5.0,
            color: color,

          ),
          new Expanded(child:
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //first item of column
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 4.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: new Text(
                        "${item.title}",
                        style: new TextStyle(fontSize: 14.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Roboto"),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),


                    new Text(
                      "${timeLeft}",
                      style: new TextStyle(fontSize: 12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w400,
                          fontFamily: "Roboto"),
                    ),
                  ],
                ),
              ), //padding
              //date
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: new Text(
                  "${item.scheduleList.scheduleDate}",
                  style: new TextStyle(fontSize: 13.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Roboto"),
                ),
              ), //text

              //desc
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: new Text(
                  "${item.description}",
                  style: new TextStyle(fontSize: 10.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w300,
                      fontFamily: "Roboto"),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ), //text


              //divider
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: new Divider(color: const Color(0xFF848484)),
              ), //padding

              //controlls

              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _getActionItem("EDIT", Icons.edit),
                  _getActionItem("DELETE", Icons.delete),
                  _getActionItem("DONE", Icons.done),

                ],


              )


            ],

          )
          )


        ],


      ),
    );
  }

  //list item
  Widget _getActionItem(String name, IconData icon) {
    return Center(
      child: new Row(
        children: <Widget>[

          new Icon(
              icon,
              color: Colors.deepOrange,
              size: 13.0),

          //desc
          new Text(
            "$name",
            style: new TextStyle(fontSize: 12.0,
                color: Colors.deepOrange,
                fontWeight: FontWeight.w500,
                fontFamily: "Roboto"),
          ),
        ],

      ),
    ); //row
  }

  @override
  void onError(String errorTxt) {
    print(errorTxt);
    _showSnackBar(errorTxt);
    _onHideLoading();
    // TODO: implement onError
  }

  @override
  void onSuccess(HomeDataResponse res) {
    _showSnackBar("Data found!");
    _onHideLoading();
    // TODO: implement onSuccess

  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  // user defined function
  void _showDialog(String message) {
    // flutter defined function
    showDialog(
      context: scaffoldKey.currentState.context,
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
    //Navigator.pop(scaffoldKey.currentState.context); //pop dialog
  }

}