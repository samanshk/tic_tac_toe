import 'dart:io';
import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

class Game extends StatefulWidget {
  String pO, pX;
  Game(this.pO, this.pX);
  @override
  _GameState createState() => _GameState(pO, pX);
}

class _GameState extends State<Game> {
  String pO, pX;
  _GameState(this.pO, this.pX);
  static AudioCache player = AudioCache();
  var btnStates = ['edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit'];
  bool isCross = Random().nextBool();
  String msg = '';
  bool declared = false;
  Timer timer;
  int timeO = 10, timeX = 10;
  bool sound = true;


  initState() {
    super.initState();
    setTimer();
  }

  setTimer() {
    if (declared) {
      timer.cancel();
      return;
    }
    if (!isCross && timeO > 0) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          if(timeO == 0) {
            isCross = !isCross;
            timer.cancel();
            timeX = 10;
            setTimer();
          }
          else {
            if(sound == true) {
              if (timeO > 5) {
                player.play('timer.wav');
              } else {
                player.play('urgent_timer.wav');
              } 
            }
            timeO--;
          }     
        });
      });      
    } 
    else if (isCross && timeX > 0) {
      timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
        setState(() {
          if(timeX == 0) {
            isCross = !isCross;
            timer.cancel();
            timeO = 10;
            setTimer();
          }
          else {
            if (sound == true) {
              if (timeX > 5) {
                player.play('timer.wav');
              } else {
                player.play('urgent_timer.wav');
              }              
            }
            timeX--;
          }     
        });
      });      
    }
    else {
      timer.cancel();
    } 
  }


  resetGameState() {
    setState(() {
      btnStates = ['edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit', 'edit'];
      declared = false;
      msg = '';
      timeX = 10;
      timeO = 10;
      declared = false;
      setTimer();
    });
  }
  
  setBtnState(i) {
    if (btnStates[i] == 'edit' && declared == false) {
      setState(() {
        if (isCross) {
          btnStates[i] = 'cross';
          if (sound == true) {
            player.play('X.mp3');            
          }
          timeX = 0;
        } else {
          btnStates[i] = 'zero';
          if (sound == true) {
            player.play('O.mp3');            
          }
          timeO = 0;
        }
        // isCross ? btnStates[i] = 'cross' : btnStates[i] = 'zero';  
      });
      // isCross = !isCross;    
    }
    checkWinner(i);
  }

  checkWinner(i) {
    if (btnStates[0] != 'edit' && btnStates[0] == btnStates[1] && btnStates[1] == btnStates[2]) {
      setState((){
        btnStates[0] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[0]);
    }
    else if (btnStates[3] != 'edit' && btnStates[3] == btnStates[4] && btnStates[4] == btnStates[5]) {
      setState((){
        btnStates[3] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[3]);
    }
    else if (btnStates[6] != 'edit' && btnStates[6] == btnStates[7] && btnStates[7] == btnStates[8]) {
      setState((){
        btnStates[6] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[6]);
    }
    else if (btnStates[0] != 'edit' && btnStates[0] == btnStates[3] && btnStates[3] == btnStates[6]) {
      setState((){
        btnStates[0] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
        
      });
      _showResult(msg, btnStates[0]);
    }
    else if (btnStates[1] != 'edit' && btnStates[1] == btnStates[4] && btnStates[4] == btnStates[7]) {
      setState((){
        btnStates[1] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[1]);
    }
    else if (btnStates[2] != 'edit' && btnStates[2] == btnStates[5] && btnStates[5] == btnStates[8]) {
      setState((){
        btnStates[2] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[2]);
    }
    else if (btnStates[0] != 'edit' && btnStates[0] == btnStates[4] && btnStates[4] == btnStates[8]) {
      setState((){
        btnStates[0] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        player.play('winner.wav');
      });
      _showResult(msg, btnStates[0]);
    }
    else if (btnStates[2] != 'edit' && btnStates[2] == btnStates[4] && btnStates[4] == btnStates[6]) {
      setState((){
        btnStates[2] == 'cross' ? msg = '$pX is winner' : msg = '$pO is winner';
        declared = true;
        if (sound == true) {
          player.play('winner.wav');
        }
      });
      _showResult(msg, btnStates[2]);
    }
    else if (!btnStates.contains('edit')) {
      setState(() {
        msg = 'Draw';
        declared = true;
        if (sound == true) {
          player.play('game_over.wav');
        }
      });
      _showResult(msg, 'game');
    }
  }
  
  
  Widget btn(i) {
    return MaterialButton(
      shape: RoundedRectangleBorder(side: BorderSide(width: 0.5, color: Colors.blueGrey)),
      onPressed: () {setBtnState(i);},
      child: Image.asset('assets/${btnStates[i]}.jpeg'),
      color: Colors.grey[100],
    );
  }

  soundButton() {
    return GestureDetector(
      child: sound ? Icon(Icons.volume_up) : Icon(Icons.volume_off),
      onTap: () {setState(() {
        sound = !sound;
      });},
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('TicTacToe'),
        backgroundColor: Colors.green,
        actions: <Widget>[
          soundButton(),
          Padding(padding: EdgeInsets.all(20))
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(15),
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                  childAspectRatio: 1.0,
                  
                  
                ),
                itemBuilder: (context, i) => btn(i)
              ),
            ),
            // Text(
            //   msg,
            //   style: TextStyle(fontSize: 30)
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  color: !isCross ? Colors.yellow : null,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text('⏰ $timeO', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),),
                      Text(pO, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Container(
                  color: isCross ? Colors.yellow : null,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Text('⏰ $timeX', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                      Text(pX, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
            Padding(padding: EdgeInsets.all(20)),
            MaterialButton(
              onPressed: () {resetGameState();},
              child: Text(
                'Reset',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              color: Colors.green,
              padding: EdgeInsets.all(10),
            ),
            Padding(padding: EdgeInsets.all(20)),
          ],
        ),
      ),
    );
  }

  Future<void> _showResult(result, img) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(result, textAlign: TextAlign.center),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                // Image.asset('assets/$img.jpeg'),
                result == 'Draw' ? Image.asset('assets/game.png', height: 100, width: 100,) : Image.asset('assets/$img.jpeg', height: 100, width: 100), 
                Padding(padding: EdgeInsets.all(10),),
                MaterialButton(
                  onPressed: () {
                    resetGameState();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Restart',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.green,
                ),
                MaterialButton(
                  onPressed: () {exit(0);},
                  child: Text(
                    'Quit',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  ),
                  color: Colors.green,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
