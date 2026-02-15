import 'package:flutter/material.dart';
import 'package:sudoku_api/sudoku_api.dart';
import 'package:sudoku_starter/game.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Puzzle puzzle =  Puzzle(PuzzleOptions());
  await puzzle.generate();
  runApp(MyApp(puzzle: puzzle));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.puzzle});

  final Puzzle puzzle;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Game(title: 'Flutter Demo Home Page', puzzle: puzzle),
    );
  }
}
