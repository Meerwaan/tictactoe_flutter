import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Constants/colors.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
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
      body: Center(
          child: Text(
        'Jeu du Morpion',
        style: customFontWhite,
      )),
    );
  }
}
