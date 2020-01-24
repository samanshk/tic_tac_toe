import 'package:flutter/material.dart';

import 'Game.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var playerO = TextEditingController();
  var playerX = TextEditingController();  
  String pO = 'PlayerO', pX = 'PlayerX';
  setNames() {
    setState(() {
      if (playerO.text.isNotEmpty) {
        pO = playerO.text;
      }
      if (playerX.text.isNotEmpty) {
        pX = playerX.text;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple[700],
      // appBar: AppBar(
      //   title: Text('Dice Game'),
      // ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text('TicTacToe', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Padding(padding: EdgeInsets.all(20),),
            Image.asset('assets/game.png', height: 150, width: 150,),
            Padding(padding: EdgeInsets.all(20),),
            TextField(
              controller: playerO,
              decoration: InputDecoration(
                icon: Icon(Icons.trip_origin),
                hintText: 'Player O name',
                filled: true,
                fillColor: Colors.white,
              ),
              maxLength: 7,
              enableInteractiveSelection: false,
            ),
            Padding(padding: EdgeInsets.all(15),),
            TextField(
              controller: playerX,
              decoration: InputDecoration(
                icon: Icon(Icons.cancel),
                hintText: 'Player X name',
                filled: true,
                fillColor: Colors.white,
              ),
              maxLength: 7,
              enableInteractiveSelection: false,
            ),
            Padding(padding: EdgeInsets.all(20),),
            MaterialButton(
              padding: EdgeInsets.all(10),
              onPressed: () {
                setNames();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Game(pO, pX)
                  )
                );
              },
              child: Text(
                'Enter',
                style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              color: Colors.green,
            )
          ],
        )
      ),
    );
  }
}