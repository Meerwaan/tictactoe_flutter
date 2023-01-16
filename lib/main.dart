import 'package:flutter/material.dart';
import 'package:tictactoe_flutter/screens/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: GameScreen(),
    
    );
  }

 
}
