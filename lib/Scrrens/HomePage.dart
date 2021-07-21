import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../ReSource.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = false; // 1st person is placed oh
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String winner = '';
  int ohScore = 0;
  int exScore = 0;
  int filledBox = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackground,
      body: Column(
        children: [
          Expanded(
            child: Hero(
              tag: 'Play',
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: ohTurn ? neutral : colorPlayerX,
                      child: Text(
                        'X',
                        style: myFontWhite,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          exScore.toString(),
                          style: myFontWhite,
                        ),
                        Text(
                          ' : ',
                          style: myFontWhite,
                        ),
                        Text(
                          ohScore.toString(),
                          style: myFontWhite,
                        ),
                      ],
                    ),
                    CircleAvatar(
                        radius: 30,
                        backgroundColor: ohTurn ? colorPlayerO : neutral,
                        child: Text(
                          'O',
                          style: myFontWhite,
                        )),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (ohTurn && displayXO[index] == '') {
                          displayXO[index] = 'O';
                          checkUp();
                        } else if (displayXO[index] == '') {
                          displayXO[index] = 'X';
                          checkUp();
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: neutral),
                      ),
                      child: Center(
                        child: isOh(displayXO[index])
                            ? Text(
                                displayXO[index],
                                style: myO,
                              )
                            : Text(
                                displayXO[index],
                                style: myX,
                              ),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'logo',
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("lib/images/t3xo.png"),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Hero(
                    tag: 'T3',
                    child: Text(
                      'TIC TAC TOE',
                      style: myFontWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOh(String a) {
    if (a == 'O') {
      return true;
    }
    return false;
  }

  void checkUp() {
    filledBox++;
    ohTurn = !ohTurn;
    HapticFeedback.lightImpact();
    if (_checkWinner()) {
      _showWinDialog();
    } else if (filledBox == 9) {
      _showDrawDialog();
    }
  }

  bool _checkWinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      winner = displayXO[0];
      return true;
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      winner = displayXO[3];
      return true;
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      winner = displayXO[6];
      return true;
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      winner = displayXO[0];
      return true;
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      winner = displayXO[1];
      return true;
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      winner = displayXO[2];
      return true;
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      winner = displayXO[0];
      return true;
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      winner = displayXO[2];
      return true;
    }
    return false;
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: myBackground,
            title: Center(
              child: Text(
                '!! DRAW !!',
                style: myFontWhite.copyWith(fontSize: 60, color: Colors.amber),
              ),
            ),
            actions: [
              TextButton(
                autofocus: true,
                onPressed: () {
                  HapticFeedback.heavyImpact();
                  _clearBoard();
                  Navigator.of(context).pop();
                },
                child: Center(
                    child: Text(
                  'PlayAgain',
                  style: TextStyle(color: Colors.white),
                )),
              )
            ],
          );
        });
  }

  void _showWinDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: myBackground,
            title: Text(
              'WINNER IS : ' + winner,
              style: myFontWhite.copyWith(
                  fontSize: 50,
                  color: isOh(winner) ? colorPlayerO : colorPlayerX),
            ),
            actions: [
              TextButton(
                  autofocus: true,
                  onPressed: () {
                    HapticFeedback.heavyImpact();
                    _clearBoard();
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'PlayAgain',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          );
        });

    if (winner == 'O') {
      ohScore++;
      ohTurn = false;
    } else {
      exScore++;
      ohTurn = true;
    }
  }

  void _clearBoard() {
    for (int i = 0; i < 9; i++) {
      setState(() {
        displayXO[i] = '';
      });
      filledBox = 0;
      winner = '';
    }
  }
}
