import 'Home.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main(){
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new Home(),
      title: new Text('TicTacToe',
      style: new TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 60.0
      ),),
      image: new Image.asset('assets/game.png'),
      backgroundColor: Colors.yellow[300],
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 80.0,
      // onClick: ()=>print("Flutter Egypt"),
      loaderColor: Colors.green
    );
  }
}


