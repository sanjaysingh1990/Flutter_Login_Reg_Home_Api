import 'package:flutter/material.dart';


ThemeData buildTheme() {
  final ThemeData base = ThemeData();
  return base.copyWith(
    hintColor: Colors.red,
    primaryColor: Colors.black,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.blue,
      ),
      labelStyle: TextStyle(
        color: Colors.green,
      ),
    ),
  );
}

class InputTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: buildTheme(),
      home: new HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String xp = '0';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(),
        body: new Container(
          padding: new EdgeInsets.only(top: 16.0),
          child: new ListView(
            children: <Widget>[
              new InkWell(
                  onTap: () {},
                  child: new Theme(
                      data: new ThemeData(
                          hintColor: Colors.yellow
                      ),
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                              borderSide: new BorderSide(color: Colors.white),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(100.0),

                              ),
                            ),
                            hintText: 'Tell us about yourself',
                            helperText: 'Keep it short, this is just a demo.',
                            labelText: 'Life story',
                            prefixIcon: const Icon(
                              Icons.person, color: Colors.green,),
                            prefixText: ' ',
                            suffixText: 'USD',
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )
                  )
              ),
              new InkWell(
                  onTap: () {},
                  child: new TextField(
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.teal)
                        ),
                        hintText: 'Tell us about yourself',
                        helperText: 'Keep it short, this is just a demo.',
                        labelText: 'Life story',
                        prefixIcon: const Icon(
                          Icons.person, color: Colors.green,),
                        prefixText: ' ',
                        suffixText: 'USD',
                        suffixStyle: const TextStyle(color: Colors.green)),
                  )
              )
            ],
          ),
        )
    );
  }
}