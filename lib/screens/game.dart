import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<String> displayXO = ["", "", "", "", "", "", "", "", ""];

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resutDec = '';
  bool winnerFound = false;

  static var customFontWhite = GoogleFonts.coiny(
      textStyle: TextStyle(
    color: MainColor.fontColor,
    letterSpacing: 3,
    fontSize: 30,
  ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColor.bgColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Joueur X',
                          style: customFontWhite,
                        ),
                        Text(
                          xScore.toString(),
                          style: customFontWhite,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Joueur O',
                          style: customFontWhite,
                        ),
                        Text(
                          oScore.toString(),
                          style: customFontWhite,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _Tap(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 3, color: MainColor.borderColor),
                            color: MainColor.accenColor),
                        child: Center(
                          child: Text(
                            displayXO[index],
                            style: GoogleFonts.dmSans(
                                textStyle: TextStyle(
                              fontSize: 96,
                              color: MainColor.fontColor,
                            )),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                flex: 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        resutDec,
                        style: customFontWhite,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: MainColor.accenColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 15)),
                          onPressed: () {
                            _clear();
                          },
                          child: Text(
                            'On rejoue ! ?',
                            style: customFontWhite,
                          ))
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void _Tap(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      }

      oTurn = !oTurn;
      _checkWin();
    });
  }

  void _checkWin() {
    //check de la  ligne 1
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[0] + ' a gagné';
        _updateScore(displayXO[0]);
      });
    }
    //check de la  ligne 2
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[3] + ' a gagné';
        _updateScore(displayXO[3]);
      });
    }

    //check de la  ligne 3
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[6] + ' a gagné';
        _updateScore(displayXO[6]);
      });
    }
    //check de la  colonne 1
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[0] + ' a gagné';
        _updateScore(displayXO[0]);
      });
    }
    //check de la  colonne 2
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[1] + ' a gagné';
        _updateScore(displayXO[1]);
      });
    }
    //check de la  colonne 3
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[2] + ' a gagné';
        _updateScore(displayXO[2]);
      });
    }
    //check de la  diagonal 1
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[0] + ' a gagné';
        _updateScore(displayXO[0]);
      });
    }
    //check de la  diagonale 2
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resutDec = 'Joueur ' + displayXO[6] + ' a gagné';
        _updateScore(displayXO[6]);
      });
    }

    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resutDec = 'Egaliter';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clear() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resutDec = '';
    });

    filledBoxes = 0;
  }
}
