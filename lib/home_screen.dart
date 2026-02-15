import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sudoku_api/sudoku_api.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _startNewGame(BuildContext context) async {
    final puzzle = Puzzle(PuzzleOptions());
    await puzzle.generate();
    if (!context.mounted) {
      return;
    }
    context.go('/game', extra: puzzle);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sudoku game')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _startNewGame(context),
          child: const Text('Start new game'),
        ),
      ),
    );
  }
}
